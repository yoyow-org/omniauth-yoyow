module OmniAuth
  module Strategies
    class Yoyow
      include OmniAuth::Strategy
      class CallbackError < StandardError; end
      args %i[auth_server]

      option :auth_server, "http://localhost:3000"

      # yoyow middleware
      def middleware
        @middleware ||= OmniAuth::YoyowMiddleware.new(options.auth_server)
      end

      def request_phase
        redirect auth_url
      end

      def auth_url
        middleware.get_auth_url(callback_url)
      end

      def callback_url
        full_host + script_name + callback_path
      end

      def callback_phase
        yyw_id = request.params["yoyow"]
        time   = request.params["time"]
        sign   = request.params["sign"]
        if ! middleware.verify_auth(yyw_id, time, sign)
          raise CallbackError.new("invalid credential found.")
        end

        super
      rescue CallbackError => e
        fail!(:invalid_credential, e)
      end

      uid do
        request.params["yoyow"]
      end

      info do
        account = middleware.get_account(uid)
        {
          name:     account[:name],
          nickname: account[:name],
        }
      end
    end
  end
end

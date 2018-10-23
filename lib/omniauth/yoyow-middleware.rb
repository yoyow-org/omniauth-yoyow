require 'uri'
require 'multi_json'
require 'faraday'

module OmniAuth
  class YoyowMiddleware
    attr_reader :resource

    class MiddlewareRequestError < StandardError; end
    
    def initialize(url)
      unless url.start_with?('http')
        url = 'http://' + url
      end
      @resource = Faraday.new(url)
    end

    def get_auth_url(callback_url)
      resp      = get_platform_sign
      auth_data = resp.slice(:sign, :time, :platform).merge({state: callback_url})
      auth_url  = [resp[:url], '?', URI.encode_www_form(auth_data)].join('')
    end

    def get_account(uid)
      _get '/api/v1/getAccount', uid: uid
    end

    def get_platform_sign
      _get '/auth/sign'
    end

    def verify_auth(yyw_id, time, sign)
      return false if yyw_id.nil? or time.nil? or sign.nil?

      data = _get('/auth/verify', {
        yoyow: yyw_id,
        time:  time,
        sign:  sign
      })
      data[:verify]
    end

    def _get(url, params={})
      begin
        resp = resource.get url, params
        json = MultiJson.load resp.body, :symbolize_keys => true
        raise MiddlewareRequestError.new(json[:message]) if json[:code] != 0
        json[:data]
      rescue MiddlewareRequestError => e
        puts "Error occurs while accessing yoyow middleware: "
        puts e.message
        raise e
      end
    end
  end
end
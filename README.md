# Omniauth YOYOW

[中文](./README.cn.md) [En](./README.md)

This is the official OmniAuth strategy for authenticating to YOYOW. To use it, a **platform** account is needed([what's platform](https://github.com/yoyow-org/yoyow-node-sdk/blob/master/middleware/README-EN.md#25-update-platform)), addtionally, you'll need to setup [yoyow-middleware](#setup-yoyow-middleware).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-yoyow'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-yoyow

## Usage

Change the url to yoyow-middleware server address in following code. 

```ruby
use OmniAuth::Builder do
  provider :yoyow, 'http://localhost:3000'
end
```


## Setup YOYOW Middleware

Clone the middleware code:

```bash
git clone https://github.com/yoyow-org/yoyow-node-sdk/tree/master/middleware
cd middleware
vim conf/config.js
```

YOYOW test-net configuration is recommended while developing your applaction, you can switch it to main-net when production ready.

Sample config for test-net:

```javascript
module.exports = {
    // yoyow full node api(test-net)
    apiServer: "ws://47.52.155.181:10011",
    // seconds before requests invaild
    secure_ageing: 120,
    // platform specified secure key
    secure_key: "",
    // active key of platform(optional)
    active_key: "",
    // secondary key of platform(required)
    secondary_key: "",
    // memo key of platform(optional)
    memo_key: "",
    // platform id(yoyow id)
    platform_id: "",
    // choose to use csaf when transfer token
    use_csaf: true,
    // transfer token to balance, otherwise to Tipping
    to_balance: false,
    // authorization URL
    wallet_url: "http://demo.yoyow.org:8000/#/authorize-service",
    // IP list allowed to access
    allow_ip: ["localhost", "127.0.0.1"]
};
```

Sample config for main-net:

```javascript
module.exports = {
    // yoyow full node api(main-net)
    apiServer: "wss://wallet.yoyow.org/ws",
    ...
    // authorization URL
    wallet_url: "http://wallet.yoyow.org/#/authorize-service",
    // IP list allowed to access
    allow_ip: ["localhost", "127.0.0.1"]
};
```

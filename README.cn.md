# OmniAuth YOYOW

[中文](./README.cn.md) [En](./README.md)

这是官方的OmniAuth YOYOW认证策略, 借助YOYOW的平台授权机制以实现账户授权认证. 在使用之前, 你需要一个平台账户[(如何成为平台)](https://github.com/yoyow-org/yoyow-node-sdk/tree/master/middleware#2-%E5%88%9B%E5%BB%BA%E5%B9%B3%E5%8F%B0), 并架设[YOYOW中间件服务](#架设中间件服务).

## 安装

在应用的Gemfile中添加:

```ruby
gem 'omniauth-yoyow'
```

然后执行:

    $ bundle

或者手动安装:

    $ gem install omniauth-yoyow

## 用法

将下方URL修改为YOYOW中间件的服务地址:

```ruby
use OmniAuth::Builder do
  provider :yoyow, 'http://localhost:3000'
end
```

## 架设中间件服务

将中间件代码clone到本地:

```bash
git clone https://github.com/yoyow-org/yoyow-node-sdk/tree/master/middleware
cd middleware
vim conf/config.js
```

在项目开发阶段, 可以借助YOYOW测试网进行测试, 待测试完成后再切换到正式网络.

测试网的配置示例如下:

```javascript
module.exports = {
    // yoyow全节点api服务器地址(测试网)
    apiServer: "ws://47.52.155.181:10011",
    // 请求有效时间，单位s
    secure_ageing: 120,
    // 平台安全请求验证key 由平台自定义
    secure_key: "",
    // 平台所有者active私钥(可选)
    active_key: "",
    // 平台所有者零钱私钥(必需)
    secondary_key: "",
    // 平台所有者备注私钥(可选)
    memo_key: "",
    // 平台id(yoyow id)
    platform_id: "",
    // 转账是否使用积分
    use_csaf: true,
    // 转账是否转到余额 否则转到零钱
    to_balance: false,
    // 钱包授权页URL
    wallet_url: "http://demo.yoyow.org:8000/#/authorize-service",
    // 允许接入的IP列表
    allow_ip: ["localhost", "127.0.0.1"]
};
```

正式网配置示例:
```javascript
module.exports = {
    // yoyow全节点api服务器地址(正式网)
    apiServer: "wss://wallet.yoyow.org/ws",
    ...
    // 钱包授权页URL
    wallet_url: "http://wallet.yoyow.org/#/authorize-service",
    // 允许接入的IP列表
    allow_ip: ["localhost", "127.0.0.1"]
};
```

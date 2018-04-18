class OpenIdService
  APP_ID     = 'wxdb46705d93bb66f7'
  APP_SECRET = 'ebdfc8e972a89bb8570253b7403c3965'

  def self.get(code:)
    url = url(code: code)
    response = HTTParty.get(url)
    JSON.parse(response.body).fetch('openid')
  end

  def self.url(code:)
    "https://api.weixin.qq.com/sns/jscode2session?appid=#{APP_ID}&secret=#{APP_SECRET}&js_code=#{code}&grant_type=authorization_code"
  end
end

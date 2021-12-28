$LOAD_PATH << File.dirname(__FILE__)

require "qbittorrent/api"
require "qbittorrent/core"
require 'http'
require 'json'
module Qbittorrent 
  class WebApi
    include Qbittorrent::Core
    include Qbittorrent::Api

    attr_accessor :host,:cookies,:headers,:username,:password
    def initialize(host,username,password,options = {})
      @host = host
      @username = username
      @password = password
      @headers = {}
      @config = options
    end

    def http
      @headers = @headers || {}
      @headers.merge(Referer: @host)
      @headers.merge!(Cookie: @cookies) if @cookies
      http = HTTP.headers(@headers)
      # http = http.use(logging: {logging: logger}) if logger
      #http = http.timeout(@config[:timeout]) if @config[:timeout]
      http
    end
    def wrap(action)
      url = "http://#{host}/api/v2/#{action}"
      yield(url) 
    end
  end
end


api = Qbittorrent::WebApi.new("127.0.0.1:8080","admin","adminadmin")
api.login

api.add_torrents 'magnet:?xt=urn:btih:30026fa738ca9975c4ea29c5311c5a2417fc089a&dn=hightown.s02e01.1080p.web.h264-glhf%5Beztv.re%5D.mkv%5Beztv%5D&tr=udp%3A%2F%2Ftracker.coppersurfer.tk%3A80&tr=udp%3A%2F%2Fglotorrents.pw%3A6969%2Fannounce&tr=udp%3A%2F%2Ftracker.opentrackr.org%3A1337%2Fannounce&tr=udp%3A%2F%2Fexodus.desync.com%3A6969'
data = api.maindata("0")
puts data
#torrents = data['torrents']
#torrents.each_key do |hash|
#  puts api.properties hash
#end


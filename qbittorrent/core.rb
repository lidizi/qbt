module Qbittorrent
  module Core
    VERSION = "0.1"
    def api(action)
      logger.info("get => #{url}")
      url = "http://#{host}/api/v2/#{action}"
      yield(url) 
    end
  end
end

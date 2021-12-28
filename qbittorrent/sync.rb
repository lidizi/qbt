module Qbittorrent
  module Api 
    module Sync 
      def maindata(rid)
        wrap('sync/maindata') do |api_url|
          http.get(api_url, params: {
            rid: rid
          })
        end
      end
    end
  end
end

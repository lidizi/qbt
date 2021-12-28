require "qbittorrent/auth"
require "qbittorrent/sync"
require "qbittorrent/torrent"
module Qbittorrent
  module Api 
    include Sync
    include Authentication
    include Torrent
  end
end

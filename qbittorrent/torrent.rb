module Qbittorrent
  module Api
    module Torrent
      def resume_torrent(hashes)
        wrap("/torrents/resume") do | url |
          http.get(url,params:{ 
            hashes: hashes
          })
        end
      end
      def pause_torrent(hashes)
        wrap("/torrents/pause") do | url |
          http.get(url,params:{ 
            hashes: hashes
          })
        end
      end
      def delete_torrent(hashes,delete_files = false)
        wrap("/torrents/delete") do | url |
          http.get(url,params:{ 
            hashes: hashes,
            deleteFiles: delete_files
          })
        end
      end
      def properties(hash)
        wrap('/torrents/properties') do |api_url|
          http.get(api_url, params: {
            hash: hash
          })
        end
      end

      def get_torrent(**options)
        wrap('/torrents/info') do |url|
          http.get(url, params: options)
        end
      end

      def add_torrents(url_or_file_path,options = {})
        wrap('/torrents/add') do |url|
          url_or_file_path.gsub!(/^\s+|\s+$/, '')
          if %r{^[http://|https://|magnet://]}i =~ url_or_file_path
            options.merge!(urls: url_or_file_path)
          else
            options.merge!(torrents: HTTP::FormData::File.new(url_or_file_path))
          end
          http.post(url, form: options)
        end
      end

      def delete_torrent(hashes, _delete_files = false)
        wrap('/torrents/delete') do |url|
          http.post(url, form: {
            hashes: hashes,
            deleteFiles: deletefiles
          })
        end
      end
    end
  end
end

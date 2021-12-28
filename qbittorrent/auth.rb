module Qbittorrent
  module Authentication
    def login
      return if cookies
      wrap("auth/login") do | url |
        response = http.get(url,params:{  
          username: username,
          password: password
        }) 
        @cookies = response.cookies
      end
    end
  end
end

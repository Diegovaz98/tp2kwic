require_relative '../modules.rb'
require 'rest-client'
require 'json'

class DblpAPI

    include Kwic
    include HandleString

    def search(string)
        url = "https://dblp.org/search/publ/api?q=#{string}&format=json"
        response = RestClient.get "#{url}"

    end

    def parseJSON(response)
        if response.class == RestClient::Response
            body = JSON.parse(response.body)
        end
        body
    end
end

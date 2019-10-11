require_relative '../modules/search.rb'
require_relative '../modules/handleString.rb'
require 'rest-client'
require 'json'

class DblpAPI

    include Search
    include HandleString

    # faz a requisição na api do dblp
    def search(string)
        url = "https://dblp.org/search/publ/api?q=#{string}&format=json&h=10"
        response = RestClient.get "#{url}"

    end

    # transforma a resposta da requisição em um json
    def parseJSON(response)
        if response.class == RestClient::Response
            body = JSON.parse(response.body)["result"]["hits"]["hit"]
        end
    end
end

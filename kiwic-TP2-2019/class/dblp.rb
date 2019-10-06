require 'rest-client'
require 'json'

class DblpAPI

    def search(q)
        url = "https://dblp.org/search/publ/api?q=#{q}&format=json"
        response = RestClient.get "#{url}"

    end

    def parseJSON(response)
        if response.class == RestClient::Response
            body = JSON.parse(response.body)
        end
        body
    end
end

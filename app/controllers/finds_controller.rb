class FindsController < ApplicationController

    def new
    end

    def index
        q = {
            'appid' => ENV['YAHOO_API'],
            'query' => params[:name],
            'results' => 20,
            'gc' => '01',
            'output' =>  'json'
          }
          client = HTTPClient.new
          
          request = client.get(ENV['YAHOO_URI'], q)
          @api_params = JSON.parse(request.body)
    end

end

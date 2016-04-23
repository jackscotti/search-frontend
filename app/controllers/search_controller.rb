class SearchController < ApplicationController

  def index
    if @search_params = params["q"]
      q = params.values.join("+")
      @results = Faraday.get('https://www.gov.uk/api/search.json?q=' + @search_params)
      @results = @results.body
      @results = JSON.parse(@results)
      @results = @results['results']
      @results = @results.map {|result| result["title"]}
    end
  end
end

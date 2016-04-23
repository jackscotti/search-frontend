class SearchController < ApplicationController

  def index
    if @search_params = params["q"]
      q = params.values.join("+")
      @results = Faraday.get('https://www.gov.uk/api/search.json?q=' + @search_params)
      @results = present(@results)
    end
  end


  def present(results)
    results = JSON.parse(results.body)
    results = results['results']
    results = results.map do |result|
      result["link"] = "https://www.gov.uk" + result["link"]
      result.select{|k,v| ["title", "link"].include?(k)}
    end
  end
end

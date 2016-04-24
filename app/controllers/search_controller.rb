class SearchController < ApplicationController

  def index
    if @search_params = params["q"]
      q = params.values.join("+")
      @results = Faraday.get('https://www.gov.uk/api/search.json?q=' + @search_params)
      results = JSON.parse(results.body)
      @results = present(@results)
    end
  end

  def show
    path = params["path"]
    @result = Faraday.get('https://www.gov.uk/api/content/' + path)
    if @result.status == 404
      flash[:notice] = 'No results for your query. Try again.'
      redirect_to "/"
    end
  end


  def present(results)
    results = results['results']
    results.map do |result|
      result["link"] = "https://www.gov.uk" + result["link"]
      result.select{|k,v| ["title", "link"].include?(k)}
    end
  end
end

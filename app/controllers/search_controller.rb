class SearchController < ApplicationController

  def index
    if @search_params = params["q"]
      q = params.values.join("+")
      @results = Faraday.get('https://www.gov.uk/api/search.json?q=' + @search_params)
      @results = JSON.parse(@results.body)
      @results = present_for_index(@results)
    end
  end

  def show
    path = params["path"]
    @result = Faraday.get('https://www.gov.uk/api/content/' + path)
    if @result.status == 404
      flash[:notice] = 'No results for your query. Try again.'
      redirect_to "/"
    else
      @result = JSON.parse(@result.body)
      @result = present_for_show(@result)
    end
  end

  def present_for_show(result)
    result.select{|k,v| ["title", "description"].include?(k)}
  end

  def present_for_index(results)
    results = results['results']
    results.map do |result|
      result["link"] = "/search" + result["link"]
      result.select{|k,v| ["title", "link"].include?(k)}
    end
  end
end

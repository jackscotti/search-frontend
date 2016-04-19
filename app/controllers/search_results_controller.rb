class SearchResultsController < ApplicationController
  before_action :set_search_result, only: [:show]

  def index
    @search_results = JSON.parse(Faraday.get('https://www.gov.uk/api/search.json?q=car+tow').body)['results']
  end

  def show
  end

private
  def set_search_result
  end

  def search_result_params
    params.fetch(:terms, {})
  end
end

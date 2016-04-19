class SearchResultsController < ApplicationController
  before_action :set_search_result, only: [:show]

  def index
    @search_results = SearchResult.all
  end

  def show
  end

private
  def set_search_result
    @search_result = SearchResult.find(params[:id])
  end

  def search_result_params
    params.fetch(:search_result, {})
  end
end

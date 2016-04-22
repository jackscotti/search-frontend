class ResultsController < ApplicationController
  def index
    @results = JSON.parse(Faraday.get('https://www.gov.uk/api/search.json?q=car+tow').body)['results']
  end

  def show
  end

private

  def result_params
    params.fetch(:terms, {})
  end
end

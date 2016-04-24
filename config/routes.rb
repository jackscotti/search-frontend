Rails.application.routes.draw do
  get "/" => redirect("/search")
  get "/search" => "search#index"
  get "/search/:path" => "search#show"
end

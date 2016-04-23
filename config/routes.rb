Rails.application.routes.draw do
  get "/" => redirect("/search")
  get "/search" => "search#index"
end

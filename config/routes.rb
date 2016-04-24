Rails.application.routes.draw do
  get "/" => redirect("/search")
  get "/search" => "search#index"

  # the `*` in `*path` serves as a wildcard and will handle
  # paths with slashes
  get "/search/*path" => "search#show"
end

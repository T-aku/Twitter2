Rails.application.routes.draw do
  # For details on throot 'welcome'
  root 'welcome#index'
  resources 'sessions'
  resources 'users'
  resources 'tweets'
  resources 'friendships'
end

Rails.application.routes.draw do
  get 'welcome/index'
  post 'welcome/create_url'
  get ':url', to: 'welcome#new_url', as: 'new_url'
  root to: 'welcome#index'
end

Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  root 'pages#vote'
  get 'get_member/:acid', to: 'members#get_member_by_identifier'
  get 'results', to: 'pages#results'
  post 'submit_votes', to: 'pages#submit_votes'
end

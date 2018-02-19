Rails.application.routes.draw do
  devise_for :users
  match '/login', to: 'login#user_login', constraints: { subdomain: /.+/ }, via: [:get], as: 'login'
  match '/login', to: 'login#user_sign_in', constraints: { subdomain: /.+/ }, via: [:post], as: 'sign_in'

  match '/dashboard', to: 'dashboard#index', constraints: { subdomain: /.+/ }, via: [:get]
  
  get '/subjects/:id/announcements/', to: 'subject#announcements', as: 'subject_announcements'
  get '/subjects/:id/documents/new', to: 'document#new', as: 'new_documents'
  post '/subjects/:id/documents/', to: 'document#create', as: 'documents'
  get '/subjects/:id/documents/:doc_id/download', to: 'document#download_file', as: 'download_document'
  delete '/subjects/:id/documents/:doc_id/download', to: 'document#delete_file', as: 'delete_document'
  
  get '/announcements', to: 'announcement#index'
  get '/announcements/new', to: 'announcement#new'
  get '/announcements/:id', to: 'announcement#show', as: 'announcement'
  post '/announcements/', to: 'announcement#create'
  delete '/announcements/:id', to: 'announcement#destroy', as: 'delete_announcement'
  get '/subjects/', to: 'subject#index'
  get '/subjects/:id', to: 'subject#show', as: 'subject'
  get '/about/', to: 'front#about'
  get '/gallery/', to: 'front#gallery'
  get '/contact/', to: 'front#contact'
  get '/faq/', to: 'front#faq'
  get '/service/', to: 'front#service'
  get '/material/', to: 'front#material'
  get '/users/register', to: 'login#admin_register', as: 'user_register'
  post '/users/register', to: 'login#admin_create'
  resources :admin_user, path: 'admin/admin_user'
  resources :admin_teacher, path: 'admin/admin_teacher'
  resources :admin_student, path: 'admin/admin_student'
  resources :admin_subject, path: 'admin/admin_subject'
  resources :admin_announcement, path: 'admin/admin_announcement'
  get 'admin/profile', to: 'admin_profile#show', as: 'admin_profile'
  get 'admin/profile/edit', to: 'admin_profile#edit', as: 'admin_profile_edit'
  patch 'admin/profile/edit', to: 'admin_profile#update'
  root to: 'front#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

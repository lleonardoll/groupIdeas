Rails.application.routes.draw do

  get "/", to: "welcome#index", as: :root

  get "/user/new", to: "user#new", as: :new_user
  post "/user/new", to: "user#create",as: false
  get "/user/edit", to: "user#edit", as: :edit_user
  patch "/user/edit", to: "user#update", as: false
  get "/user/:id", to: "user#show", as: :show_user

  get "/login", to: "login#new", as: :new_login
  post "/login", to: "login#create", as: false
  get "/login/destroy", to: "login#destroy", as: :destroy_login

  get "/ideas", to: "ideas#index", as: :ideas
  get "/ideas/new", to: "ideas#new", as: :new_idea
  post "/ideas/new", to: "ideas#create", as: false
  get "/ideas/:id", to: "ideas#show", as: :show_idea
  get "/ideas/edit/:id", to: "ideas#edit", as: :edit_idea
  patch "/ideas/edit/:id", to: "ideas#update", as: false
  get "/ideas/destroy/:id", to: "ideas#destroy", as: :destroy_idea

  post "/ideas/:id", to: "comments#create", as: false

  get "/ideas/like/:id", to: "votations#create_like", as: :votation_like
  get "/ideas/nlike/:id", to: "votations#create_nlike", as: :votation_nlike

  get "/ideas/collaborator/new/:id", to: "collaborators#create", as: :create_collaborators
  get "/ideas/collaborator/update/:id", to: "collaborators#update", as: :update_collaborators
  get "/ideas/collaborator/delete/:id", to: "collaborators#destroy", as: :destroy_collaborators
  get "/ideas/collaborator/show", to: "collaborators#show", as: :show_collaborators

  get "/like/user/:id", to: "likes#create_like", as: :like_like
  get "/nlike/user/:id", to: "likes#create_nlike", as: :like_nlike
end

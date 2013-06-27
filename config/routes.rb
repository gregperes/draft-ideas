DraftIdeas::Application.routes.draw do
  resources :drafts

  controller :user_sessions do
    get "signin" => :new
    post "signin" => :create
    delete "signout" => :destroy
  end

  root :to => "home#index"
end
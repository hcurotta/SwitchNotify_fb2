SwitchFB::Application.routes.draw do
  resources :users

  match "/auth/:provider/callback" => "sessions#create"

end

Rails.application.routes.draw do

  root "posts#index"
  
  get "/pages/about" => "pages#about" , as: :about          #la pagina rimane sempre pages/about ma il percorso del link diventa about_path
  get "/pages/contact" => "pages#contact" , as: :contact  

  #esempio altri modi (sinistra percorso http destra percorso controller-action ancora destra opzionale percorso visivo e richiamabile con _path finale)
  #get "pages/about" => "pages#about"
  #get "about" => "pages#about"
  #get "/pages/about" => "pages#about"
  #get "/pages/contact" => "pages#contact"
  #get "/pages/about" => "pages#about" , as: "risorsa_personale"          #la pagina rimane sempre pages/about ma il percorso del link diventa about_path
  
  
  #Tutto si semplifica con resources :posts
  #
  #get '/posts' => "posts#index" , as: :posts
  #get '/posts/new' => "posts#new" ,as: :new_post
  #post "/posts" => "posts#create"
  ##get "/post/show" => "posts#show" ,as: :show
  ##get "/post/:id" => "posts#show" ,as: :show   #id mi permette di passare qualsiasi parametro dopo post
  #get "/post/:id" => "posts#show" ,as: :post   #id mi permette di passare qualsiasi parametro dopo post
  #get "/post/:id/edit" => "posts#edit" , as: :edit_post
  #patch "post/:id" => "posts#update"
  #delete "post/:id" => "posts#destroy"
  #
  resources :posts do
    resources :comments
  end

end

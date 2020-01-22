Rails.application.routes.draw do
resources :games do
resources :notes, module: :games
end
resources:users, except:[:new]
resources:character_sheets
resources :dms do
    resources :notes, module: :dms
end

resources :players do
    resources :notes, module: :players
end


get 'signup', to: 'users#new'
get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'
delete 'logout', to: 'sessions#destroy'
root 'users#index'
end


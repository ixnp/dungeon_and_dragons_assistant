Rails.application.routes.draw do
    resources:users, except:[:new]
    resources:character_sheets
    resources :games do
        resources :notes, module: :games
    end

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
    
    root 'sessions#new'
end


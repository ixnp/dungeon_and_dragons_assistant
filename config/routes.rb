Rails.application.routes.draw do
resources:games
resources:users, except:[:new]
resources:character_sheets
resources:dms
resources:players

get 'signup', to: 'users#new'
get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'
delete 'logout', to: 'sessions#destroy'
end


class Players::NotesController < NotesController
    before_action :set_notable
    
    private 
    
        def set_notable
            @notable = Player.find(params[:player_id])
        end
    end
class Games::NotesController < NotesController
before_action :set_notable

def create
    super
    @notable.save
end 

private 
    def set_notable
        @notable = Game.find(params[:game_id])
    end
end
class Dms::NotesController < NotesController
before_action :set_notable

private 
    def set_notable
        @notable = Dm.find(params[:dm_id])
    end
end
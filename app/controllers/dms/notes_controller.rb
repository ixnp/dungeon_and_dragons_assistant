class Dms::NotesController < NotesController
before_action :set_notable

def create
    super
    @notable.save
    redirect_to @notable, notice: "your note was sucessfully saved dm"
end 
private 
    def set_notable
        @notable = Dm.find(params[:dm_id])
    end
end
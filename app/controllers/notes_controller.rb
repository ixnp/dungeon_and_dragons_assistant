class NotesController < ApplicationController
  def new
    @note = @notable.notes.new
  end

  def create
    @note = @notable.notes.new(note_params)

    @note.author = current_user.name
    @note.save
    @notable.save
    redirect_to @notable, notice: "Note Posted!"
  end

  private

  def note_params
    params.require(:note).permit(:content)
  end
end

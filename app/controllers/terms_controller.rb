class TermsController < ApplicationController

  def new
    @venture = current_user.ventures.last
    @term = @venture.terms.new

  end

  def create
    @venture = current_user.ventures.last
    snapshot = Snapshot.create(venture_id: @venture.id)
# binding.pry
    @term = @venture.terms.new(term_params)
    @term.update(venture_id: @venture.id, snapshot_id: snapshot.id)

    if @term.save
      redirect_to venture_path(@venture)
    else
      flash[:notice] = "Please try again"
      redirect_to new_term_path
    end

  end

  private
    def term_params
      params.require(:term).permit(:word_1, :word_2, :word_3, :word_4)
    end

end

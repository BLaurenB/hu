class TermsController < ApplicationController

  def index
    @venture = Venture.find(params[:venture_id])
    @terms = @venture.terms
  end

  def new
    @venture = current_user.ventures.last
    @term = @venture.terms.new

  end

  def create
    @venture = current_user.ventures.last
    snapshot = Snapshot.create(venture_id: @venture.id)

    @term = @venture.terms.new(term_params)
    @term.update(venture_id: @venture.id, snapshot_id: snapshot.id)
    # binding.pry
    if @term.save
      redirect_to venture_path(@venture)
    else
      flash[:notice] = "Please try again"
      redirect_to new_term_path
    end

  end

  def edit
    @term = Term.find(params[:id]) #need to namescpae this!

  end

  def update
    term = @venture.terms.find(params[:id])
    term.update(term_params)
    redirect_to ventures_path

  end

  private
    def term_params
      params.require(:term).permit(:words => [])
    end

end

class VenturesController < ApplicationController

  def index
    @ventures = current_user.ventures.all
  end


  def show
    @venture = Venture.where(user_id: current_user.id).find(params[:id])
    @terms = @venture.terms.last # ".last" will change based on whether the user has updated search terms
    @industry = Category.find(@venture.category_id)
    @hu_insight = HuInsights.insight_maker(@terms.words, @industry.code)


  end


  def new
    @venture = Venture.new
    @categories = Category.all
  end

  def create
    @venture = current_user.ventures.new(venture_params)
    if @venture.save
      redirect_to new_venture_term_path(@venture)
    else
      render :new
    end
  end

  private

    def venture_params
      params.require(:venture).permit(:title, :description, :notes, :category_id)
    end

end

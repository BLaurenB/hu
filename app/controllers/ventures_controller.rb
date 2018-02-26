class VenturesController < ApplicationController

  def index
    @ventures = current_user.ventures.all
  end


  def show

    # -------------------------------------------
    # Census Trends  - Overall US, Industry specific
    # -------------------------------------------

    @venture = Venture.where(user: 6).find(params[:id])
    @term = @venture.terms.first # ".first" will change based on whether the user has updated search terms
    industry = @venture.category_id
    @hu_insight = HuInsights.insight_maker(@term) #industry

  end


  def new
    @venture = Venture.new
    @categories = Category.all
  end

  def create
    venture = current_user.ventures.new(venture_params)
    if venture.save
      redirect_to new_term_path
    else
      render :new
    end
  end

  private

    def venture_params
      params.require(:venture).permit(:title, :description, :notes, :category_id)
    end

end

class DecisionsController < ApplicationController
  before_action :set_decision, only: [:show, :edit, :update, :destroy]

  def index
      @decisions = Decision.all.paginate(:page => params[:decision]).per_page(10)
  end

  def show
      @decision = @decisoin
  end

  def edit
  end

  def new
    @decision = Decision.new
  end

  def create
    @decision = Decision.new(decision_params)
    if @decision.save
      redirect_to decision_path(@decision), notice: "Decision was added to the system."
    else
      render action: 'new'
    end
  end

  def update
    @decision.update(decision_params)
    if @decision.save
      redirect_to decision_path(@decision), notice: "Decision was revised in the system."
    else
      render action: 'edit'
    end
  end

  def destroy
    @decision.destroy
    redirect_to decisions_url, notice: "Decision was removed from the system."
  end

  private
    def set_decision
      @decision = Decision.find(params[:id])
    end

    def decision _params
      params.require(:decision).permit(:decision_string)
    end
end
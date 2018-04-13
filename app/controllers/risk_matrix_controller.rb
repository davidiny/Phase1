class RiskMatricesController < ApplicationController
  before_action :set_risk_matrix, only: [:show, :edit, :update, :destroy]

  def index
      @risk_matrix = RiskMatrix.all.paginate(:page => params[:risk_matrix]).per_page(10)
  end

  def show
      @a_risk_matrix = @risk_matrix
  end

  def edit
  end

  def new
    @risk_matrix = RiskMatrix.new
  end

  def create
    @risk_matrix = RiskMatrix.new(risk_matrix_params)
    if @risk_matrix.save
      redirect_to risk_matrix_path(@risk_matrix), notice: "The risk matrix was added to the system."
    else
      render action: 'new'
    end
  end

  def update
    @risk_matrix.update(risk_matrix_params)
    if @risk_matrix.save
      redirect_to risk_matrix_path(@risk_matrix), notice: "The risk matrix was added to the system."
    else
      render action: 'edit'
    end
  end

  def destroy
    @risk_matrix.destroy
    redirect_to players_url, notice: "The risk matrix was removed to the system."
  end

  private
    def set_risk_matrix
      @risk_matrix = RiskMatrix.find(params[:id])
    end

    def risk_matrix_params
      params.require(:risk_matrix).permit(:risk_score)
    end
end
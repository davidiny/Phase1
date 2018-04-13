class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def index
      @players = Player.all.paginate(:page => params[:player]).per_page(10)
  end

  def show
      @a_player = @player
  end

  def edit
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to player_path(@player), notice: "#{@player.first_name} was added to the system."
    else
      render action: 'new'
    end
  end

  def update
    @player.update(player_params)
    if @player.save
      redirect_to player_path(@player), notice: "#{@player.first_name} was added to the system."
    else
      render action: 'edit'
    end
  end

  def destroy
    @player.destroy
    redirect_to players_url, notice: "#{@player.first_name} was added to the system."
  end

  private
    def set_player
      @player = Player.find(params[:id])
    end

    def player_params
      params.require(:player).permit(:first_name, :last_name, :email, :age, :gender, :occupation)
    end
end
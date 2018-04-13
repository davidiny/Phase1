class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  def index
      @characters = Character.all.paginate(:page => params[:character]).per_page(10)
  end

  def show
      @character = @character
  end

  def edit
  end

  def new
    @character = Characer.new
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      redirect_to character_path(@character), notice: "#{@character.first_name} was added to the system."
    else
      render action: 'new'
    end
  end

  def update
    @character.update(character_params)
    if @character.save
      redirect_to camp_path(@character), notice: "#{@character.first_name} was revised in the system."
    else
      render action: 'edit'
    end
  end

  def destroy
    @character.destroy
    redirect_to characters_url, notice: "#{@character.first_name} was removed from the system."
  end

  private
    def set_character
      @character = Character.find(params[:id])
    end

    def character_params
      params.require(:character).permit(:first_name, :last_name, :bio, :gender, :risk_id, :player_id, :decision_id)
    end
end
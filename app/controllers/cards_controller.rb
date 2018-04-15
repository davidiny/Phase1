class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def index
    @all_cards = Card.all.paginate(:page => params[:all_cards]).per_page(10)
  end

  def show
  end

  def edit
  end

  def new
    @card= Card.new
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to card_path(@card), notice: "#{@card.card_type} was added to the system."
    else
      render action: 'new'
    end
  end

  def update
    @card.update(card_params)
    if @card.save
      redirect_to camp_path(@card), notice: "#{@card.card_type} was revised in the system."
    else
      render action: 'edit'
    end
  end

  def destroy
    @card.destroy
    redirect_to cards_url, notice: "#{@card.card_type} was removed from the system."
  end

  private
    def set_card
      @card = Card.find(params[:id])
    end

    def card_params
      params.require(:card).permit(:instructions, :card_text, :act, :alert_text, :card_type)
    end
end
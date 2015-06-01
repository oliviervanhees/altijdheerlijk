class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy, :like, :unlike]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:destroy]

  def index
    @pins = Pin.all.order("created_at DESC")
  end

  def my_pins
    @pins = current_user.pins
  end

  def my_favorites
    @pins = current_user.find_liked_items
  end

  def like
    @pin.liked_by current_user
    redirect_to :back, notice: 'Je hebt dit recept nu toegevoegd aan jouw bewaarde recepten.'
    current_user_follower_ids = current_user.followers.pluck(:user_id)
    User.find(current_user_follower_ids).each do |follower|
    ModelMailer.new_like_notification(@pin, follower, current_user).deliver
  end
  end

  def unlike
    @pin.unliked_by current_user
    redirect_to :back, notice: 'Dit recept is verwijderd uit jouw bewaarde recepten.'
  end

  def show
  end

  def new
    @pin = current_user.pins.build
  end

  def edit
  end

  def create
    @pin = current_user.pins.build(pin_params)
    if @pin.save    
      redirect_to @pin, notice: 'Jouw recept is toegevoegd aan Altijd heerlijk.'
    else
      render action: 'new'
    end
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Recept is gewijzigd.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @pin.destroy
    redirect_to pins_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Het is alleen toegestaan om eigen recepten te wijzigen" if @pin.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:description, :image, :preparation, :ingredients2)
    end
end
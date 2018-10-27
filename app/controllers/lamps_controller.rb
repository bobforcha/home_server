class LampsController < ApplicationController
  def index
    @lamps = Lamp.all
  end

  def new
    @lamp = Lamp.new
  end

  def create
    @lamp = Lamp.new(lamp_params)
    @lamp.status = "disconnected"

    if @lamp.save
      flash[:success] = "Lamp successfully added!"
      redirect_to lamps_path
    else
      flash.now[:danger] = "Lamp not created!"
      render :new
    end
  end

  private

  def lamp_params
    params.require(:lamp).permit(:name, :ip_address)
  end
end

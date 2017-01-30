class BodyPartsController < ApplicationController
  def index
    @body_parts = BodyPart.order(:name)
  end

  def new
    @body_part = BodyPart.new
  end

  def create
    @body_part = BodyPart.new(body_part_params)
    if @body_part.save
      flash[:success] = "New Body Part created!"
      redirect_to body_parts_path
    else
      render 'new'
    end
  end

  private
    def body_part_params
      params.require(:body_part).permit(:name)
    end
end

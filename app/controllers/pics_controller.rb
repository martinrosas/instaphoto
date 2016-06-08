class PicsController < ApplicationController
  before_action :find_Pic, only: [:show, :edit, :update, :destroy]
    def index
    end

    def show
      # to show you a pic we must first find that pic
    end

    def new
      @pic = Pic.new
    end
    # once pic is created allows next steps
    def create
      @pic = Pic.new(pic_params)

      if @pic.save
        redirect_to @pic, notice: "Yes! It was posted!"
      else
        render 'new'
      end
    end

    private

    def pic_params
      params.require(:pic).permit(:title, :description)
    end

    def find_Pic
      @pic = Pic.find(params[:id])
    end

end

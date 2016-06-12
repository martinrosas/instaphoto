class PicsController < ApplicationController
  before_action :find_Pic, only: [:show, :edit, :update, :destroy]
    def index
      @pics = Pic.all.order("created_at DESC")
    end

    def show
      # to show you a pic we must first find that pic
    end

    def new
      # pics are being build from the current user
      @pic = current_user.pics.build
    end
    # once pic is created allows next steps
    def create
      @pic = current_user.pics.build(pic_params)

      if @pic.save
        redirect_to @pic, notice: "Yes! It was posted!"
      else
        render 'new'
      end
    end

    def edit
    end
    # update is to edit what create is to new
    def update
      if @pic.update(pic_params)
        redirect_to @pic, notice: "Congrats Pic was updated"
      else
        # this render prevents info from being lost
        render 'edit'
      end
    end

    def destroy
      @pic.destroy
      redirect_to root_path
    end

    private

    def pic_params
      params.require(:pic).permit(:title, :description)
    end

    def find_Pic
      @pic = Pic.find(params[:id])
    end

end

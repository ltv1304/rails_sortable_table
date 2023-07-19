class WfilesController < ApplicationController
  before_action :set_resourse, only: %i[show destroy edit update]

  def index
    ap params
    @files = Wfile.all
  end

  def new
    @file = Wfile.new
  end

  def create
    @file = Wfile.new files_params
    if @file.save
      flash[:success] = 'File created!'
      redirect_to wfiles_path
    else
      render :new
    end
  end

  def update
    if @file.update files_params
      flash[:success] = 'File updated!'
      redirect_to wfiles_path
    else
      render :edit
    end
  end

  def destroy
    @file.destroy
    flash[:success] = 'File deleted!'
    redirect_to wfiles_path
  end

  def show
    ap @file.children
    @content = @file.children
  end

  private

  def files_params
    params.require(:wfile).permit(:item_name, :parent, :item_type)
  end

  def set_resourse
    @file = Wfile.find(params[:id])
  end
end

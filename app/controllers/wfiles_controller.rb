class WfilesController < ApplicationController
  include Sortabl

  before_action :set_resourse, only: %i[show destroy edit update]
  before_action :set_scope, only: :index

  def index
    @sort_params = params[:sort]
  end

  def new
    ap params[:parent]
    @resourse = Wfile.new
    @resourse.parent = Wfile.find(params[:parent])
    ap @resourse
  end

  def create
    ap params
    @resourse = Wfile.new files_params
    if @resourse.save
      flash[:success] = 'File created!'
      redirect_to wfiles_path
    else
      render :new
    end
  end

  def update
    if @resourse.update files_params
      flash[:success] = 'File updated!'
      redirect_to wfiles_path
    else
      render :edit
    end
  end

  def destroy
    @resourse.destroy
    flash[:success] = 'File deleted!'
    redirect_to wfiles_path
  end

  def show
    @content = @resourse.children
  end

  def ex
  end
 
  private

  def set_scope
    @files = Wfile.all
  end

  def files_params
    params.require(:wfile).permit(:item_name, :parent, :item_type)
  end

  def set_resourse
    @resourse = Wfile.find(params[:id])
  end
end

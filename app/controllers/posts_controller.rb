class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :create, :new]
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(params_var)
    if @post.save
      redirect_to posts_path, notice: 'El post ha sido creado correctamente'
    else
      @errores = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    render :new
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params_var)
      redirect_to posts_path, notice: 'El post ha sido actualizado correctamente'
    else
      @errores = @post.errors.full_messages
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: 'El post ha sido eliminado de forma correcta'
  end

  private
  def params_var
    params.require(:post).permit(:title, :description, :user_id)
  end

end

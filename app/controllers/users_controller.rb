class UsersController < ApplicationController
  def index
    @users = User.all
    @posts = Post.all
    # if current_user
    #   pag = '/users/'
    #   pag.concat(current_user.id.to_s)
    #   redirect_to pag
    # end
  end
  
  def show
    @posts = Post.all
    @user = User.find(params[:id])
  end
  
  def edit
    @posts = Post.all
    @user = User.find(params[:id])
  end
  
  def update
    # @post = Post.find(params[:id])
    # numPosts = "1, 2, 3"
    # numPosts = current_user.prueba + ", " +  params[:user][:prueba]
    numPosts = current_user.prueba + ", " +  params[:name]
    # numPosts = params[:user][:prueba]
    pag = '/users/'
    pag.concat(current_user.id.to_s)
    # current_user.update_attributes(params[:user])
    current_user.update_attribute(:prueba, numPosts)
    redirect_to pag
  end
end

class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
  	#@posts=Post.all
    @posts=Post.all.order("created_at DESC")
  end

  def new
    @post=Post.new
  end

  def create
   @post=Post.new(post_params)
   #puts "EMILIANO TEST: #{post_params}"
   if @post.save  
     #redirect_to show_path
     #redirect_to show_path(@post)
     flash[:notice] = "Post successfully created"
     redirect_to post_path(@post)
   else
     render :new                #passa alla vista new portandosi dietro errori
     #redirect_to new_post_path #passa alla vista new senza portarsi errori 
   end
  end

  def show
  	@gino="test gino"
  	#@post=Post.find_by_id(params[:id])
    #@post = Post.find(params[:id])
  end

  def edit  #dopo edit passa attraverso update con metodo patch
  	#@post = Post.find(params[:id])
  end

  def update
  	#@post = Post.find(params[:id])
  	if @post.update(post_params)
    	#redirect_to @post
      flash[:notice] = "Post successfully updated"
    	redirect_to post_path(@post)
    else
      render :edit                       #passa alla vista edit portandosi dietro errori
      #redirect_to edit_post_path(@post)  #passa alla vista edit senza portarsi errori   
    end
  end

  def destroy
    #@post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post successfully destroyed"
    redirect_to posts_path #posts_path è stato creato in routes.rb  
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
  	   params.require(:post).permit(:title, :body)
  end

end

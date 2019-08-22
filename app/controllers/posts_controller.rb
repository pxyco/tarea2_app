class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @user = current_user
    reload=0
    @posts.each do |post|
      if post.expires_at != nil
        if post.expires_at <= DateTime.now  
          post.destroy
          reload=1
        end
      end  
    end
    if reload == 1
      redirect_to posts_path
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    if params[:days].to_i==0 && params[:hours].to_i==0 && params[:minutes].to_i==0 && params[:seconds].to_i==0
      @post.expires_at =  DateTime.now + 1.hours
    else
      @post.expires_at =  DateTime.now + params[:days].to_i.days + params[:hours].to_i.hours + 
                          params[:minutes].to_i.minutes + params[:seconds].to_i.seconds
    end
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def update_read_post
    numPosts = current_user.readed_posts
    if numPosts == nil
      numPosts = ""
    end
    numPosts +=  " " +  params[:value] + " "
    pag = '/users/'
    pag.concat(current_user.id.to_s)
    current_user.update_attribute(:readed_posts, numPosts)
    redirect_to posts_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :text, :user_id)
    end
end

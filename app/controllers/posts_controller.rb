class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

=begin
  # GET /posts
  def index
    @posts = Post.all
  end
=end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @board = Board.find params[:board_id]
    @post = @board.posts.new
    @post.user_id = current_user.id
  end

=begin
  # GET /posts/1/edit
  def edit
  end
=end

  # POST /posts
  def create
    @board = Board.find params[:board_id]
    @post = @board.posts.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to board_path(@board), notice: 'Post successfully created'
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

=begin
  # DELETE /posts/1
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
    end
  end
=end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :p_type, :data)
    end
end

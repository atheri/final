class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :downvote, :upvote]

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

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @board = Board.find params[:board_id]
    @post = @board.posts.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to board_path(@board), notice: 'Post successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to :back, notice: 'Post successfully deleted.'
  end

  def upvote
    @post.update_attribute(:score, @post.score+1)
    redirect_to :back
  end
  
  def downvote
    @post.update_attribute(:score, @post.score-1)
    redirect_to :back
  end

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

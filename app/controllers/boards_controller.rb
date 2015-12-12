class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  # GET /boards/1
  def show
    @posts = @board.posts
  end

  # GET /boards/new
  def new
    @board = current_user.boards.new
  end

  # POST /boards
  def create
    @board = current_user.boards.new(board_params)
    if @board.save
      redirect_to root_path, notice: 'Board successfully created.'
    else
      render :new
    end
  end

  # GET /boards/1/edit
  def edit
  end
  
  # PATCH/PUT /boards/1
  def update
    if @board.update(board_params)
      redirect_to @board, notice: "Board successfully updated."
    else
      render :edit
    end
  end

  # DELETE /boards/1
  def destroy
    @board.destroy
    redirect_to root_path
  end

  private
  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:name)
  end

end

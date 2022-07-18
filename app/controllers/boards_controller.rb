class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  def index
    #投稿内容を一覧で表示する
    @boards = Board.all
  end

  def show
  end

  def new
    #投稿失敗の際に入力した内容をフォームに残して表示させる
    @board = Board.new
  end

  def edit
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to @boards, notice: "投稿を作成しました"
    else
      render :new
    end
  end

  def update
    if @board.update(board_params)
      redirect_to @boards, notice: "投稿を編集しました"
    else
      render :edit
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_url, notice: "投稿を削除しました"
  end

  private

    def set_board
      @board = Board.find(params[:id])
    end

    def board_params
      params.require(:board).permit(:title, :body)
    end
end

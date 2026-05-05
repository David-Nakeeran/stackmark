class BookmarksController < ApplicationController
  before_action :user_bookmark, only: [ :show ]

  def index
    @bookmarks = Current.user.bookmarks
  end

  def show
  end

  def new
    @bookmark = Current.user.bookmarks.new
  end

  def create
    @bookmark = Current.user.bookmarks.new(bookmark_params)
    if @bookmark.save
      redirect_to @bookmark
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def user_bookmark
      @bookmark = Current.user.bookmarks.find_by!(id: params[:id])
    end

  private
    def bookmark_params
      params.expect(bookmark: [ :url, :title, :description, :notes ])
    end
end

class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [ :show, :edit, :update ]

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

  def edit
  end

  def update
    if @bookmark.update(bookmark_params)
      redirect_to @bookmark
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def set_bookmark
      @bookmark = Current.user.bookmarks.find_by!(id: params[:id])
    end

    def bookmark_params
      params.expect(bookmark: [ :url, :title, :description, :notes ])
    end
end

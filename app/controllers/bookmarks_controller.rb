class BookmarksController < ApplicationController
  before_action :user_bookmark, only: [ :show ]

  def index
    @bookmarks = Current.user.bookmarks
  end

  def show
  end

  private
    def user_bookmark
      @bookmark = Current.user.bookmarks.find_by!(params[:id])
    end
end

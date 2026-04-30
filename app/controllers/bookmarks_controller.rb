class BookmarksController < ApplicationController
  def index
    @bookmarks = Current.user.bookmarks
  end
end

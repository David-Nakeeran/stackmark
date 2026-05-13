class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [ :show, :edit, :update, :destroy ]

  def index
    @bookmarks = Current.user.bookmarks
  end

  def show
  end

  def new
    @bookmark = Current.user.bookmarks.new
  end

  def create
    filtered_params, tag_list = filtered_form_data
    @bookmark = Current.user.bookmarks.new(filtered_params)
    parsed_tags = parse_tags(tag_list)
    if @bookmark.save
      parsed_tags.each do |tag_name|
        tag = Tag.find_or_create_by(name: tag_name)
        @bookmark.bookmark_tags.create(tag: tag)
      end
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

  def destroy
    @bookmark.destroy
    redirect_to bookmarks_path
  end

  def fetch_metadata
    metadata = MetadataFetcherService.call(params[:url])
    render json: metadata
  end

  private
    def set_bookmark
      @bookmark = Current.user.bookmarks.find_by!(id: params[:id])
    end

    def bookmark_params
      params.expect(bookmark: [ :url, :title, :description, :notes, :tag_list ])
    end

    def filtered_form_data
      [
        bookmark_params.except(:tag_list),
        bookmark_params[:tag_list]
      ]
    end

    def parse_tags(tags)
      tags.downcase
        .split(",")
        .map { |item| item.strip }
        .reject { |item| item.empty? }
        .uniq
    end
end

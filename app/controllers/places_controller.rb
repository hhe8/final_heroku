class PlacesController < ApplicationController
  def index
      @places = Place.all
  end

  def show
      @place = Place.find_by(:id => params["id"])
  end

  def delete
      @place = Place.find_by(:id => params["id"])
      @place.delete
      redirect_to root_url # created new item in data so  item has changed.
  end

  def new
  end

  def create
      Place.create(:title => params["title"], :price => params["price"], :description=> params["description"] , :photourl => params["photourl"])
      redirect_to root_url
  end

  def edit
      @place = Place.find_by(:id => params["id"])
  end

  def update
      @place = Place.find_by(:id => params["id"])
      @place.title = params["title"]
      @place.price = params["price"]
      @place.description = params["description"]
      @place.photourl = params["photourl"]
      @place.save
      redirect_to "/places/#{params["id"]}"
  end

end

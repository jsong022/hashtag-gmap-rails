class PagesController < ApplicationController
  def home
  end

  def search
    location = params[:location]
    if location == "" then redirect_to '/' end
    qry="SELECT * FROM rails_gmap.mytable WHERE location = '"+location+"';"
    @records = ActiveRecord::Base.connection.select_all(qry);
    if not @records[0] then redirect_to '/' end
    @location = location
  end
end

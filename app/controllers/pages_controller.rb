class PagesController < ApplicationController
  def home
    @records = ActiveRecord::Base.connection.select_all("SELECT * FROM rails_gmap.mytable;")
  end
end

class PagesController < ApplicationController
  def home
    qry="SELECT * FROM rails_gmap.mytable WHERE location = 'Los Angeles, CA';"
    @records = ActiveRecord::Base.connection.select_all(qry)
  end
end

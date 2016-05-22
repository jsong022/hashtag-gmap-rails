class PagesController < ApplicationController
  def home
  end

  def search
    location = params[:location]
    if location == "" then 
      redirect_to '/',alert:'Location is required for the search' and return end
    @date = params[:date]
    if @date == "" then
      qry="SELECT * FROM cs179g.mytable WHERE location = '"+location+"' ORDER BY date DESC LIMIT 5;"
    elsif @date =~ /[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]/
      qry="SELECT * FROM cs179g.mytable WHERE location='"+location+"' AND date='"+@date+"';"
    else
      redirect_to '/',alert:'Date must be in YYYY-MM-DD format or blank!' and return
    end
    client = CassandraClient.new
    client.connect(['127.0.0.1'])
    @records = client.executeQuery(qry)
    client.close()
    if @records.length == 0 then
      redirect_to '/',alert:'No data available from '+location+'!\ntry Los Angeles, CA or Disneyland' and return
    end
    @location = location
  end
end

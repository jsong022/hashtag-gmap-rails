class PagesController < ApplicationController
  def home
  end

  def heatmap
    @hashtag = params[:hashtag]
    @date = params[:date]
    if @hashtag == "" then
      msg='Hashtag is required to create a heatmap'
      redirect_to '/', alert:msg and return
    end
    if @date == "" then
      msg='Date in YYYY-MM-DD format is required to create a heatmap'
      redirect_to '/', alert:msg and return
    elsif @date =~ /[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]/
      qry="SELECT long, lat FROM cs179g.htcrd" +
          " WHERE hashtag='" + @hashtag + "' AND date='" + @date +
          "' LIMIT 500000 ALLOW FILTERING;"
    else
      msg='Date must be in YYYY-MM-DD format to create a heatmap'
      redirect_to '/', alert:msg and return
    end
    client = CassandraClient.new
    client.connect(['127.0.0.1'])
    print "executing " + qry + "\n"
    @records = client.executeQuery(qry)
    print "returned " + @records.length.to_s + " rows\n"
    client.close()
    if @records.length == 0 then
      msg='#' + @hashtag + ' was not found for ' + @date + '.'
      redirect_to '/',alert:msg and return
    end
  end

  def search
    location = params[:location]
    if location == "" then 
      msg='Location is required for the search'
      redirect_to '/',alert:msg and return
    end
    @date = params[:date]
    pts = 0
    if @date == "" then
      qry="SELECT date, hashtag, count FROM cs179g.mytable" +
          " WHERE location = '" + location +
          "' ORDER BY date DESC LIMIT 5;"
    elsif @date =~ /[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]/
      qry="SELECT date, hashtag, count FROM cs179g.mytable" +
          " WHERE location='" + location + "' AND date='" + @date + "';"
      pts = 1
    else
      msg='Date must be in YYYY-MM-DD format or blank!'
      redirect_to '/',alert:msg and return
    end
    client = CassandraClient.new
    client.connect(['127.0.0.1'])
    print "Executing "+qry+"\n"
    @records = client.executeQuery(qry)
    print "Returned "+@records.length.to_s+" rows\n" 
    if pts != 0 and @records.length != 0 then
      hashtag = ''
      @records.each do |row|
        hashtag=row['hashtag']
      end
      qry2="SELECT id, lat, long FROM cs179g.htcrd" +
           " WHERE hashtag='" + hashtag + "' AND location='" + location +
           "' AND date='"+@date+"' ALLOW FILTERING;"
      print "Executing "+qry2+"\n"
      @points = client.executeQuery(qry2)
      print "Retruned "+@points.length.to_s+" rows\n"
    end
    client.close()
    if @records.length == 0 then
      if @date == "" then
        msg = ""
        msg2 = ""
      else 
        msg = ' for '+@date
        msg2 = ' or another date'
      end
      alert-msg='No data available from ' + location + msg +
                '!\ntry Los Angeles, CA or Disneyland' + msg2
      redirect_to '/',alert:alert-msg and return
    end
    @location = location
  end
end

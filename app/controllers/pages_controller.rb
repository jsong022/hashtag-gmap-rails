require 'cassandra'

class CassandraClient

  def initialize()
    @cluster = nil
    @session = nil
  end

  def connect(node)
    puts "Connecting to cluster."
    @cluster = Cassandra.cluster(hosts: node)
    @session = @cluster.connect
    puts "Cluster: #{@cluster.name}"
    @cluster.each_host do |host|
      puts "    Host #{host.ip}: id = #{host.id} datacenter = #{host.datacenter} rack = #{host.rack}"
    end
  end

  def executeQuery(qry)
    results = @session.execute(qry)
    return results
  end

  def close()
    @cluster.close
  end
end

class PagesController < ApplicationController
  def home
  end

  def search
    location = params[:location]
    if location == "" then redirect_to '/' and return end
    qry="SELECT * FROM cs179g.mytable WHERE location = '"+location+"' LIMIT 5;"
    client = CassandraClient.new
    client.connect(['127.0.0.1'])
    @records = client.executeQuery(qry)
    client.close()
    if @records.length == 0 then redirect_to '/' and return end
    @location = location
  end
end

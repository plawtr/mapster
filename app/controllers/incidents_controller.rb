class IncidentsController < ApplicationController

  def report

  	incident = Incident.new

  	#todo: if route is panic then type is panic else type is report
  	incident.type = params[:type]
  	incident.lng = params[:lng]
  	incident.lat = params[:lat]

  	#todo: optional
  	incident.message = params[:message]

  	if incident.save
  		render :json => {"result"=>"OK"}
  	else
  		render :json => {"result"=>"ERROR"}
  	end	
  	
  end

  def heatmap
  	#heatmap = Incident.within(5, :origin => [params[:lat], params[:lng]])
  	heatmap = Incident.all
  	render :json => {"result"=> heatmap}
  end	
end

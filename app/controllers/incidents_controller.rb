class IncidentsController < ApplicationController

  def report
  	incident = Incident.new
  	incident.lng = params[:lng]
  	incident.lat = params[:lat]

    if request.path.include? "report"
       incident.type = "report"
  	   incident.message = params[:message]
    else
      incident.type == "panic"
    end

  	if incident.save
  		render :json => {"result"=>"OK"}
  	else
  		render :json => {"result"=>"ERROR"}
  	end	
  	
  end

  def heatmap
  	heatmap = Incident.within(5, :origin => [params[:lat], params[:lng]])
  	render :json => {"result"=>heatmap}
  end	
end

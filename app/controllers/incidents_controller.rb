class IncidentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers  

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
   
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end
   
  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
      headers['Access-Control-Max-Age'] = '1728000'     
      render :text => '', :content_type => 'text/plain'
    end
  end

end

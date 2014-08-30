class FixIncidentType < ActiveRecord::Migration
  def change
  	rename_column :incidents, :incident_type, :type
  end
end

class FixIncident < ActiveRecord::Migration
  def change
  	rename_column :incidents, :type, :kind
  end
end

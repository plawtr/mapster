class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.float :lat
      t.float :lng
      t.string :incident_type
      t.text :message

      t.timestamps
    end
  end
end

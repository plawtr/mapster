class Incident < ActiveRecord::Base	
 acts_as_mappable :default_units => :kms               
end

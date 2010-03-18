class Product < ActiveRecord::Base
  belongs_to :rulemaking
  belongs_to :sector
end

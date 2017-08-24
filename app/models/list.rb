class List < ActiveRecord::Base
  has_many :buckets 
  belongs_to :user
end

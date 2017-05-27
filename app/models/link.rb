class Link < ActiveRecord::Base
  validates_presence_of :description, :url

  belongs_to :company
end

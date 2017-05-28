class Link < ActiveRecord::Base
  include PgSearch
  validates_presence_of :description, :url

  belongs_to :company

  pg_search_scope :search, :against => [:description, :url]
end

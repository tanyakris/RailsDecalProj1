class Pokemon < ActiveRecord::Base
  belongs_to :trainer
  validates :name, :uniqueness => {:message => "already exists"},
  :presence => {:message => "your Pokemon"}
end

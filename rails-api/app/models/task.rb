class Task
  include Mongoid::Document
  field :name, type: String
  field :done, type: Mongoid::Boolean
  belongs_to :list

  validates :name, presence: true
end

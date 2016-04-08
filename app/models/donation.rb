class Donation < ActiveRecord::Base
    validates :category, presence: true
    validates :quantity, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 15, greater_than: 0 }
    validates :organization, presence: true
    belongs_to :user
    belongs_to :organization
end

class Organization < ActiveRecord::Base
    mount_uploader :picture, PictureUploader
    validates :name, presence: true
    validates :category, presence: true
    validates :year, presence: true
    validates :contact_number, presence: true,length: {minimum: 10, maximum: 10}
    validates :description, presence: true
    has_many :donations
    has_many :users
end

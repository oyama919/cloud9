class Contact < ActiveRecord::Base
    validates :name,:email,:content, presence: true
    belongs_to :user
end

class Article < ApplicationRecord
belongs_to :user
validates :title, presence: true
validates :language, presence: true

end

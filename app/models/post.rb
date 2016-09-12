class Post < ActiveRecord::Base
    has_many :replies
    validates :title, presence: {message: "카테고리를 적어주세요"}
    
end

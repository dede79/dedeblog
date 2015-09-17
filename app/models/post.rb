class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: {:minimum => 5}
	validates :title, :uniqueness => {:message => "already taken"} #uniqueness validation don't need to specify true only, if putting message it already implies it should ne true.
	validates :body,  presence: true
end

class Post < ActiveRecord::Base
  
  has_many :comments, dependent: :destroy

  validates_presence_of :body, :title

  def post_params
    params.require(:post_id).permit(:body, :title, :comment)
  end

end

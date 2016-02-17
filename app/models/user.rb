class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name , :on => :create, :message => "can't be blank"
  has_many :fightposts, dependent: :destroy


  def feed
    Fightpost.where("user_id = ?", id)
  end
  
end

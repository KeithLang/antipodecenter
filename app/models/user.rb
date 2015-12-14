class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable


  # to allow registrations remove # from this section and comment out above devise lines.
   devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

end

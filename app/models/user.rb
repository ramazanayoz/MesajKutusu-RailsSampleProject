class User < ApplicationRecord
 has_many :messages##2# bir kullanıcının büssürü mesajı olabilir
 has_many :comments ##2## bir kullanıcının birçok yorumu olabilir
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

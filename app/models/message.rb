class Message < ApplicationRecord
	belongs_to:user ##2# bir mesajların sahibi tek bir kullanıcıdır
	has_many :comments #2# 1 mesajın birçok yorumu olabilir
end

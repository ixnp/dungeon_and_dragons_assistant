class User < ApplicationRecord
    EMAIL_VALIDATION = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    before_save {self.name = name.downcase}
    validates :name, presence: true, uniqueness:{ case_sensitive:false}, length:{minimum: 3, maximum:25}
    validates :email, presence: true, uniqueness:{ case_sensitive:false}, length:{minimum: 3, maximum:80},format: { with: EMAIL_VALIDATION }
    validates :password, presence: true, length:{minimum: 6, maximum:25}

end

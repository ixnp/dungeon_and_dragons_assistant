class User < ApplicationRecord
    has_secure_password
    has_many :user_games
    has_many :games, through: :user_games
    EMAIL_VALIDATION = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    before_save {self.name = name.downcase}
    before_save {self.email = email.downcase}
    validates :name, presence: true, length:{minimum: 3, maximum:25}
    validates :email, presence: true, uniqueness:{ case_sensitive:false}, length:{minimum: 3, maximum:80},format: { with: EMAIL_VALIDATION }
    validates :password, presence: true, length:{minimum: 6, maximum:25}

end

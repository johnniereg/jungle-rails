class User < ActiveRecord::Base
    has_secure_password

    has_many :reviews

    validates :first_name, :last_name, presence: true
    validates :email, uniqueness: { case_sensitive: false }, presence: true

    def self.authenticate_with_credentials(email, password)
        user = User.find_by(email: email).try(:authenticate, password)
    end

end

class User < ActiveRecord::Base
    has_secure_password

    has_many :reviews

    validates :first_name, :last_name, presence: true
    validates :email, uniqueness: { case_sensitive: false }, presence: true

    before_save :downcase_email

    def self.authenticate_with_credentials(email, password)
        user = User.find_by(email: email.strip.downcase).try(:authenticate, password)
    end

    def downcase_email
        self.email.downcase!
    end

end

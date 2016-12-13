class User < ApplicationRecord
  attr_accessor :activation_token
  before_save   :downcase_email
  before_create :create_activation_digest
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  
  has_many :stories, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :stories, through: :votes

  def canVoteMoreThanOnce?
    true
  end

  # Returns whether or not the user has voted on the given story
  def hasVotedOn?(story)
    if Vote.where("story_id = ? AND user_id = ?", story.id, self.id).count >= 1
      true
    else
      false
    end
  end

  #returns an array of all the stories the user has written, in order of newest to oldest
  def stories
    
  end
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  private

    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end

    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
end








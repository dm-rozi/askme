require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 20_000
  DIGEST = OpenSSL::Digest::SHA256.new

  attr_accessor :password

  has_many :questions, dependent: :destroy

  validates :username,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { maximum: 40 },
    format: { without: /\W+/ }
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: /[\w]+@[\w\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :password,
    presence: true, on: :create,
    confirmation: true
  validates :background_color,
    format: { with: /\A#?(?:[A-F0-9]{3}){1,2}\z/i }

  before_validation :downcase_username
  before_save :encrypt_password

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email)

    return nil unless user.present?

    hashed_password = User.hash_to_string(
      OpenSSL::PKCS5.pbkdf2_hmac(
        password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST
      )
    )
    return user if user.password_hash == hashed_password
    nil
  end

  private

  def encrypt_password
    if password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))
      # Создаем хэш пароля — длинная уникальная строка, из которой невозможно
      # восстановить исходный пароль. Однако, если правильный пароль у нас есть,
      # мы легко можем получить такую же строку и сравнить её с той, что в базе.
      self.password_hash = User.hash_to_string(
          OpenSSL::PKCS5.pbkdf2_hmac(
              password, password_salt, ITERATIONS, DIGEST.length, DIGEST
          )
      )
    end
  end

  def downcase_username
    self.username = self.username.downcase
  end
end

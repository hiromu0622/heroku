class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  #課題　パスワードの文字数制限を追加する 8~32
  validates :password, length: { in: 1..32 }
  #パスワードをアルファベット、数字の混合のみ可能にしてください
  VALID_PASSWORD_REGEX = /\A[a-zA-Z\d]+\z/
   validates :password,  format: { with:VALID_PASSWORD_REGEX}
  #メールアドレスの正規表現を追加してください ~ @ ~ . ~
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with:VALID_EMAIL_REGEX }
  #課題　名前の長さを制限する
  validates :name, length: { maximum: 15}
  
  has_secure_password
end

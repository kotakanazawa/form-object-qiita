class UserAddress
  include ActiveModel::Model
  attr_accessor :name, :name_kana, :nickname, :postal_code, :prefecture_id, :city, :house_number, :building_name

  with_options presence: true do
    validates :name, format: {with:/\A[ぁ-んァ-ン一-龥]/,  message: "is invalid. Please input full-width characters."}
    validates :name_kana, format: {with:/\A[ァ-ヶー－]+\z/,    message: "is invalid. Please input full-width katakana characters."}
    validates :nickname,  format: {with:/\A[a-z0-9]+\z/i,     message: "is invalid. Please input half-width characters."}
    validates :postal_code, format: {with: /\A[0-9]+\z/, message: "is invalid. Please input half-width characters."}
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  end

  def save
    user = User.create(name: name, name_kana: name_kana, nickname: nickname)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, user_id: user.id)
  end
end

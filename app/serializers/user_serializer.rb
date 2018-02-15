class UserSerializer < ActiveModel::Serializer
  has_many :tweets
  has_many :reviews

  attributes :id, :first_name, :last_name, :username, :created_at, :updated_at
end

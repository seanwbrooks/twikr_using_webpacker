class UserSerializer < ActiveModel::Serializer
  has_many :tweets
  has_many :reviews

  attributes :id, :username, :created_at, :updated_at
end

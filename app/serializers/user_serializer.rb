class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :password_digest

  has_many :playlists 
end

class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :title, :song_count, :user_id, :songs

  belongs_to :user
end

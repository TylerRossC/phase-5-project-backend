class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :title, :song_count, :user_id
end

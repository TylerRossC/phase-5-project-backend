class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :title, :song_count, :user_id

  belongs_to :user
end

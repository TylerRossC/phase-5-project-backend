class SongSerializer < ActiveModel::Serializer
  attributes :id, :title, :artist, :playlist_id
end

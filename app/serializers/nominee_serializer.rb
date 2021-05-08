class NomineeSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :imdbID
end
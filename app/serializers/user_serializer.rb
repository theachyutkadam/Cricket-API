class UserSerializer < ActiveModel::Serializer
  attributes :id, :password, :email, :status, :is_admin, :token, :user_type
end

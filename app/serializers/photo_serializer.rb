class PhotoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :image
end

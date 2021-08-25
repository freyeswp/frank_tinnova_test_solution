class MainSerializer
  include FastJsonapi::ObjectSerializer

  def collection_attr_array
    serializable_hash[:data].map {|k| k[:attributes]}
  end

  def data
    serializable_hash[:data][:attributes]
  end
end

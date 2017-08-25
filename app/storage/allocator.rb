# CLEAN ARCHITECTURE

module Storage
  # This is a convenience class, just so the services layer doesn't have to
  # keep calling SomeStorage.new
  #
  # For every storage class you create, just drop a corresponding method in here

  class Allocator
    def post_store
      Storage::PostStore.new
    end


  end
end

# CLEAN ARCHITECTURE
#
# This is a sample storage class, but minimimalist enough to move forward with.
#
# The idea is all data access happens in this layer.  These tend to be simple
# methods.  Applies to remote services too! If anything goes wrong,
# raise an exception

module Storage
  # Don't be afraid to create your own exceptions if desired
  class AccountNotFound < StandardError; end

  class PostStore

    def new_post
      Post.new
    end

    def create_post(params)
      @post = new_post
      @post.user_id = current_user.id
      @post.comment = params[:comment]
      @post.save
    end

  end
end

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

    def build_post
      Post.new
    end

    def create_post(post)
      post.save
      post
    rescue ActiveRecord::RecordInvalid
      raise ActiveRecord::RecordInvalid.new(post)
    end

    def get_following_users_post(user_ids)
      Post.eager_load(:user).where("users.id IN (?)", user_ids)
    end

    def get_user_posts(user)
      Post.where("user_id = ?", user.id)
    end

  end
end

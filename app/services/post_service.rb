module Services
  class PostService < BusinessService
    include Services

    def build_post
      post_store.build_post
    end

    def create_post(params)
      post = build_from_attrs(params)
      post_store.create_post(post)
    end

    def build_from_attrs(attrs)
      PostBuilder.new.from_attrs(attrs, user.id)
    end

    def get_following_users_post(user)
      user_ids = user.following.map(&:id) << user.id
      post_store.get_following_users_post(user_ids)
    end

    def get_user_posts(user)
      post_store.get_user_posts(user)
    end

  end
end
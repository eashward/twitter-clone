module Services
  class PostService < BusinessService
    include Services

    def create_post(params)
      @post = post_store.create_post(params)
    end

  end
end
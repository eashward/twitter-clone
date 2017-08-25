module Services
  class BusinessService
    attr_reader :user

    def initialize(user = nil, engine = nil)
      @user = user
      @engine = engine
    end

    def engine
      @engine ||= ::Storage::Allocator.new
    end

    def current_user
      @user
    end
    # Examples of how to make a storage object available.
    # Add one of these for every storage object
    def post_store
      engine.post_store
    end

  end
end
module Services
  extend ActiveSupport::Concern
  included do
    def post_service
      @posts_service ||= Services::PostService.new(current_user)
    end


  end
end
class PostBuilder

  def from_attrs(attrs, user_id)
    Post.new.tap{|post|
      post.attributes = attrs
      post.user_id = user_id
    }
  end
end

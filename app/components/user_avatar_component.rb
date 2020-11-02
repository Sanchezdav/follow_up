class UserAvatarComponent < ViewComponent::Base
  def initialize(user:, size:)
    @user = user
    @size = size
  end

  def avatar_attached
    @user.avatar.attached?
  end
end
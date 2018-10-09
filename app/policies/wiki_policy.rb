class WikiPolicy < ApplicationPolicy
  def destroy?
    user.role == 'admin' || record.user == user
  end
end

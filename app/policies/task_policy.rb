class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  # ajouter des politiques sur chaque action

  def new?
    true
  end
  def show?
    true
  end

end

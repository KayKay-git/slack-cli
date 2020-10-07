

class Workspace
  attr_reader :users, :channels

  def initialize
    @users = list.users
    @channels = []
  end

end
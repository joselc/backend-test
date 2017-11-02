class HomeController < ApplicationController
  def index
    # SELECT u.name,
    # COUNT(DISTINCT(g.id)) as gc,
    # string_agg(g.name, ', ') as groups_list
    # FROM users u
    # LEFT JOIN groups_users gu ON gu.user_id = u.id
    # LEFT JOIN groups g ON g.id = gu.group_id
    # GROUP BY u.id
    @users = Array.new
    User.select("users.name, users.created_at, count(distinct(groups.id)) as gc, string_agg(groups.name, ', ') as gl")
    .joins("LEFT JOIN groups_users ON groups_users.user_id = users.id LEFT JOIN groups ON groups.id = groups_users.group_id")
    .group("users.id")
    .find_each(:batch_size => 10) do |user|
      @users.push(user)
    end
    @users = @users.sort_by{|x| -x.gc}
  end
end

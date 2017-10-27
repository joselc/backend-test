class HomeController < ApplicationController
  def index
    # SELECT u.name,
    # COUNT(DISTINCT(g.id)) as gc,
    # string_agg(g.name, ', ') as groups_list
    # FROM users u
    # LEFT JOIN groups_users gu ON gu.user_id = u.id
    # LEFT JOIN groups g ON g.id = gu.group_id
    # GROUP BY u.id
    # ORDER BY gc ASC;
    @users = User.all

    # CHALLENGE 2
    # SELECT g.name, u.name, SUM(m.mapviews) as mv
    # FROM maps m
    # LEFT JOIN users u ON m.user_id = u.id
    # LEFT JOIN groups_users gu ON u.id = gu.user_id
    # LEFT JOIN groups g ON gu.group_id = g.id
    # GROUP BY g.name, u.name
    # ORDER BY g.name, mv DESC;

    # CHALLENGE 3
    # SELECT g.name, u.name, SUM(m.mapviews) as mv,
    # SUM(m.mapviews)/SUM(SUM(m.mapviews)) OVER (PARTITION BY g.id) *100 as mv2
    # FROM maps m
    # INNER JOIN users u ON m.user_id = u.id
    # LEFT JOIN groups_users gu ON u.id = gu.user_id
    # LEFT JOIN groups g ON gu.group_id = g.id
    # GROUP BY g.id, u.id
    # ORDER BY g.name, mv DESC;

  end
end

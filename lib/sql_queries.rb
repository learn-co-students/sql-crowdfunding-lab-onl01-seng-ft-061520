# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_title
  "SELECT projects.title, SUM(pledges.amount)
  FROM projects
  INNER JOIN pledges
  ON projects.id = pledges.project_id
  GROUP BY title ORDER BY title ASC;"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
  "SELECT users.name, users.age, SUM(pledges.amount)
  FROM users
  INNER JOIN pledges
  ON users.id = pledges.user_id
  GROUP BY users.name ORDER BY name;"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
  "SELECT projects.title, SUM(pledges.amount) - projects.funding_goal
  FROM projects
  INNER JOIN pledges
  ON projects.id = pledges.project_id
  GROUP BY projects.title
  HAVING SUM(pledges.amount) >= projects.funding_goal;"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_summed_amount
  "SELECT users.name, SUM(pledges.amount)
  FROM users
  INNER JOIN pledges
  ON users.id = pledges.user_id
  GROUP BY users.name
  ORDER BY SUM(pledges.amount);"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
  "SELECT projects.category, pledges.amount
  FROM projects
  INNER JOIN pledges
  ON projects.id = pledges.project_id
  
  GROUP BY pledges.id
  HAVING projects.category = 'music'
  ORDER BY pledges.id;"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
  "SELECT projects.category, SUM(pledges.amount)
  FROM projects
  INNER JOIN pledges
  ON projects.id = pledges.project_id
  GROUP BY projects.category
  HAVING projects.category = 'books';"
end













# def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
#   "SELECT projects.category, pledges.amount
#   FROM projects
#   INNER JOIN pledges
#   GROUP BY pledges.amount
#   HAVING projects.category = 'music'
#   ORDER BY pledges.amount;"
# end


# expected: [["music", 24], ["music", 34], ["music", 40], ["music", 12], ["music", 20], ["music", 40], ["music", 40], ["music", 230]]
#                got: [["music", 10.0], ["music", 12.0], ["music", 19.0], ["music", 20.0], ["music", 24.0], ["music", 34.0]...", 90.0], ["music", 100.0], ["music", 230.0], ["music", 450.0], ["music", 700.0], ["music", 1000.0]]














# def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
#   "SELECT projects.category, pledges.amount
#   FROM projects
#   INNER JOIN pledges
#   ON projects.id = pledges.project_id
#   INNER JOIN users
#   ON users.id = pledges.user_id
#   GROUP BY pledges.user_id
#   HAVING projects.category = 'music'
#   ORDER BY pledges.user_id;"
# end


# expected: [["music", 40], ["music", 24], ["music", 34], ["music", 12], ["music", 40], ["music", 40], ["music", 20], ["music", 230]]
#                got: [["music", 40.0], ["music", 34.0], ["music", 24.0], ["music", 12.0], ["music", 40.0]]
     
#           (compared using ==)
     
#        ...or:
     
#           expected: [["music", 24], ["music", 34], ["music", 40], ["music", 12], ["music", 20], ["music", 40], ["music", 40], ["music", 230]]
#                got: [["music", 40.0], ["music", 34.0], ["music", 24.0], ["music", 12.0], ["music", 40.0]]
     
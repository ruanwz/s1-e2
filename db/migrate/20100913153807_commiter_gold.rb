class CommiterGold < ActiveRecord::Migration
  $achievement_table_list =[
    :commiter_golds,
    :commiter_silvers,
    :commiter_bronzes,
    :contributter_golds,
    :contributter_silvers,
    :contributter_bronzes,
    :accepter_golds,
    :accepter_silvers,
    :accepter_bronzes,
    :reviewer_golds,
    :reviewer_silvers,
    :reviewer_bronzes,
    :bug_tracer_golds,
    :bug_tracer_silvers,
    :bug_tracer_bronzes,
    :bug_fixer_golds,
    :bug_fixer_silvers,
    :bug_fixer_bronzes,
    :fork_most_golds,
    :fork_most_silvers,
    :fork_most_bronzes,
    :project_owner_golds,
    :project_owner_silvers,
    :project_owner_bronzes,
    :friend_most_golds,
    :friend_most_silvers,
    :friend_most_bronzes,
    :interest_most_golds,
    :interest_most_silvers,
    :interest_most_bronzes,
    :watch_most_golds,
    :watch_most_silvers,
    :watch_most_bronzes,
  ]

  def self.up
    $achievement_table_list.each do |table|
      create_table table do |t|
        t.integer :user_id
        t.timestamps
      end
    end
 
  end

  def self.down
    $achievement_table_list.each do |table|
      drop_table table
    end
  end
end


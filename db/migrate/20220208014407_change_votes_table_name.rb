class ChangeVotesTableName < ActiveRecord::Migration[7.0]
  def change
    rename_table :memes_users, :votes
    add_column :votes, :id, :integer, primary_key: true
  end
end

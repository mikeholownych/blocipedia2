class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators, :id => false do |t|
      t.references :user, :wiki
    end

    add_index :collaborators, [:user_id, :wiki_id],
      name: "collaborators_index",
      unique: true
  end
end

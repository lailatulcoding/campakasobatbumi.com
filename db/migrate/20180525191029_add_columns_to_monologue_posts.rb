class AddColumnsToMonologuePosts < ActiveRecord::Migration[5.0]
  def change
    add_column :monologue_posts, :lead, :text
    add_column :monologue_posts, :image, :string
  end
end

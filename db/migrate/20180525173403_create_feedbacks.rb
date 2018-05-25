class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.text :message
      
      t.timestamps
    end
  end
end

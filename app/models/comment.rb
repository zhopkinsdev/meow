class Comment < ApplicationRecord
      t.text :message
      t.string :rating
      t.integer :user_id
      t.integer :cat_id
      t.timestamps
    end

    add_index :comments, [:user_id, :cat_id]
    add_index :comments, :cat_id
  end
end

class AddCommentToCasts < ActiveRecord::Migration[6.0]
  def change
    add_column :casts, :comment, :text
  end
end

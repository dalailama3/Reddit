class RemoveParentCommentIdIdFromComment < ActiveRecord::Migration
  def change
    remove_column :comments, :parent_comment_id_id
  end
end

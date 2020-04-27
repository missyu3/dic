class AddReferencesBlogsToUser < ActiveRecord::Migration[5.2]
  def change
    Blog.delete_all
    add_reference :blogs, :user, foreign_key: true , null: false
  end
end

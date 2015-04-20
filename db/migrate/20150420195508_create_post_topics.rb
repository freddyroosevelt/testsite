class CreatePostTopics < ActiveRecord::Migration
  def change
    create_table :post_topics do |t|
      t.integer :topic_id, :post_id
    end
  end
end

class PostTrends < ActiveRecord::Migration
  def change
    create_table :post_trends do |t|
      t.integer :trend_id, :post_id
    end
  end
end

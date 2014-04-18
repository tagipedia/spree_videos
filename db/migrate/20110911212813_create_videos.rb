class CreateVideos < ActiveRecord::Migration
  def change
    create_table :spree_videos do |t|
      t.string :youtube_ref
      t.integer :product_id
      t.integer :position

      t.timestamps
    end
  end
end

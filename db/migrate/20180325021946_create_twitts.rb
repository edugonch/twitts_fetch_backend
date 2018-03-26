class CreateTwitts < ActiveRecord::Migration[5.1]
  def change
    create_table :twitts do |t|
      t.bigint       :twitter_id, null: false
      t.string       :text, null: false
      t.string       :hashtag, null: false
      t.string       :lang, null: false
      t.string       :url, null: false
      t.bigint       :user_id, null: false
      t.string       :user_name, null: false
      t.string       :profile_image_url, null: false
      t.timestamps
    end

    add_index :twitts, :twitter_id, unique: true
    add_index :twitts, :hashtag
  end
end

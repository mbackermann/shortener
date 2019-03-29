class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.string :title
      t.string :url
      t.string :short_url
      t.string :sanitize_url
      t.integer :visits, default: 0

      t.timestamps
    end
  end
end

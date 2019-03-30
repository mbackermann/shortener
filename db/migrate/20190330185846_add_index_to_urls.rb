class AddIndexToUrls < ActiveRecord::Migration[5.1]
  def change
    add_index :urls, :short_url
    add_index :urls, :sanitize_url
  end
end

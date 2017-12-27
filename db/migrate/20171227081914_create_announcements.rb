class CreateAnnouncements < ActiveRecord::Migration[5.1]
  def change
    create_table :announcements do |t|
      t.string :title
      t.string :content
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end

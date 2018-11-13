class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.references :viewable, polymorphic: true
      t.string :name
      t.string :github_username
      t.string :bio

      t.timestamps
    end
  end
end

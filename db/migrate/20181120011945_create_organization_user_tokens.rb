class CreateOrganizationUserTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :organization_user_tokens do |t|
      t.references :organization, foreign_key: true
      t.string :email
      t.string :token_type
      t.string :token

      t.timestamps
    end
  end
end

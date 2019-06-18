class CreateSecretCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :secret_codes do |t|
      t.string :code,  null: false
      t.references :user, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end

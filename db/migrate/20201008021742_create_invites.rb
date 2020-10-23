class CreateInvites < ActiveRecord::Migration[6.0]
  def change
    create_table :invites do |t|
      t.string :email
      t.references :project, null: false, foreign_key: true
      t.integer :sender_id, null: false, foreign_key: true
      t.integer :recipient_id, null: true, foreign_key: true
      t.string :token

      t.timestamps
    end
  end
end

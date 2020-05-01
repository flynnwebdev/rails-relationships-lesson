class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :email, null: false
      t.string :password, null: false

      t.timestamps
    end
  end
end

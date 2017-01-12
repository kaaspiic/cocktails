class CreateUsers < ActiveRecord::Migration[5.0]
  def self.up
    create_table :users do |t|
      t.string  :email,              null: false, default: ''
      t.string  :encrypted_password, null: false, default: ''
      t.string  :first_name
      t.string  :last_name
      t.integer :age
      t.integer :favorites, array: true, default: []
      t.timestamp
    end

    add_index :users, :email, unique: true
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end

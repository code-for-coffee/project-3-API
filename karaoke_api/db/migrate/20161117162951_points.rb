class Points < ActiveRecord::Migration[5.0]
  def change
  	create_table :points do |table|
  		table.integer :score
  		table.integer :account_id, foreign_key: :account
  		# table.integer :account_id
  		# table.references :accounts, column: :id, index: true
  	end
  	# add_foreign_key :accounts, :accounts_id
  end
end

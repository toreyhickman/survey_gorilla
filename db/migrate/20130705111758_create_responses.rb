class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :session_id
      t.integer :option_id

      t.timestamps
    end    
  end
end

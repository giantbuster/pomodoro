class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :task
      t.string :result
      t.datetime :ended_at
      t.references :user, index: true

      t.timestamps
    end
  end
end

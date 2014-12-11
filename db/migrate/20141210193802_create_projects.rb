class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :format
      t.string :api_key
      t.decimal :system_capacity
      t.integer :module_type
      t.decimal :losses
      t.integer :array_type
      t.decimal :tilt
      t.decimal :azimuth
      t.string :address
      t.decimal :lat
      t.decimal :lon
      t.string :file_id
      t.string :dataset
      t.integer :radius
      t.string :timeframe
      t.decimal :dc_ac_ratio
      t.decimal :gcr
      t.decimal :inv_eff
      t.string :callback
      t.integer :npv
      t.decimal :irr
      t.integer :project_score
      t.string :status

      t.timestamps
    end
  end
end
30.7296954443036
176.812145110704




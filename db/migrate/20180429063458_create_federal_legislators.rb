class CreateFederalLegislators < ActiveRecord::Migration
  def change
    create_table :federal_legislators do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :enters_office_on
      t.datetime :leaves_office_on

      t.timestamps null: false
    end
  end
end

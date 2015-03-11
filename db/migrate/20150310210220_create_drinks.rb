class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :term
    end
  end
end

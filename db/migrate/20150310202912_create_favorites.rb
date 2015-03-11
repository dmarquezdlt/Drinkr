class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :place
      t.belongs_to :user

      t.timestamps
    end
  end
end

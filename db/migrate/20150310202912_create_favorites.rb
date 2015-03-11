class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :business_name
      t.string :business_url
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end

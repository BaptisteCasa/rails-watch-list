class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.references :list, foreign_key: true # Si les reviews appartiennent à une liste

      t.timestamps
    end
  end
end

class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :image_url, default: "https://foodrevolution.org/wp-content/uploads/blog-featured_healthy_foods-20180306.jpg" 
      t.string :page_url, null: true
      t.string :title
      t.string :instructions, null: true
      t.boolean :user_submitted, default: false
      t.string :author, null: true

      t.timestamps
    end
  end
end

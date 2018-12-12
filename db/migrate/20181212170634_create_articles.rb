class CreateArticles < ActiveRecord::Migration[5.1]

  def down
   drop_table :articles
 end
  def change
    create_table :articles do |article|
      article.string :title
      article.string :content
    end
  end
end

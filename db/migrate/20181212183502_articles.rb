class Articles < ActiveRecord::Migration[5.1]
    def change
   create_table :articles do |article|
     article.string :title
     article.string :content
 end
  end
end

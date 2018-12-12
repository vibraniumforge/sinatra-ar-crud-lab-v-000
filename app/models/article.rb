class Article < ActiveRecord::Base
  binding.pry
  def change
    create_table :articles do |t|
      t.string :title
      t.string :content
    end
  end
end

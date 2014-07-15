class ChangeCategoryPrivee < ActiveRecord::Migration
  def up
    cate = Category.find_by(name: "Privé")
    return unless cate
    cate.name = "Prive"
    cate.save
  end

  def down
    cate = Category.find_by(name: "Prive")
    return unless cate
    cate.name = "Privé"
    cate.save
  end
end

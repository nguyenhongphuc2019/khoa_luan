module ApplicationHelper
  def load_sub_category category_id
    Category.sub category_id
  end

  def load_main_category
    Category.main
  end
end

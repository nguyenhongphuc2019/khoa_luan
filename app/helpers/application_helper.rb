module ApplicationHelper
  def load_sub_category category_id
    Category.sub category_id
  end

  def load_main_category
    Category.main
  end

  def load_icon document_type
    "file-" << document_type << "-o"
  end

  def load_language id
    return "Tiếng việt" if id==1
    "English"    
  end

  def load_keyword category_id
    Verb.where group: category_id
  end

  def load_keywords
    Verb.take(10)
  end

  def load_status_user
    ["Học sinh", "Sinh viên", "Đi làm", "Kinh nghiệm dưới 1 năm", "Kinh nghiệm trên 5 năm"]
  end

  def load_major
    Category.all.pluck(:id, :name).to_h
  end
end

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

  # def load_state_user
  #   {1: "Student", 2: "Intern", 3: "Junior", 4: "Senior", 5: "Profesional", 6: "Expert"}
  # end

  def load_major
    Category.all.pluck(:id, :name).to_h
  end
end

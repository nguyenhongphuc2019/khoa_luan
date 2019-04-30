module ApplicationHelper
  def load_sub_category category_id
    Category.sub category_id
  end

  def load_main_category
    Category.main
  end

  def load_icon document_type
    "file-" << document_type << "-o" unless document_type.nil?
  end

  def load_language id
    return "Tiếng việt" if id==1
    "English"    
  end

  def load_keyword category_id
    Verb.where group: category_id
  end

  def main_category_ids
    [1,2,3,4,5,6]
  end

  def load_keywords
    Verb.take(10)
  end

  def load_major
    Category.all.pluck(:id, :name).to_h
  end

  def custom_bootstrap_flash
    flash_messages = []
    option = "{'closeButton': true}"
    flash.each do |type, message|
      type = "success" if type == "notice"
      type = "error" if type == "alert"
      text = "toastr.#{type}('#{message}', '', #{option});"
      flash_messages << text if message
    end
    flash_messages.join("\n")
  end
end

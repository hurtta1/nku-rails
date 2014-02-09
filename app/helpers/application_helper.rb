module ApplicationHelper
  def gravitar_url(student)  
    if student.gravitar.blank?
      gravitar_id = Digest::MD5.hexdigest(student.email.downcase)
      "http://gravatar.com/avatar/#{gravitar_id}.png?s=48"
     else
     gravitar_id = student.gravitar
    end
  end
end

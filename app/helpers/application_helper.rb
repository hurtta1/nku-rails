module ApplicationHelper
  def gravitar_url(student)  
    if student.Gravitar.blank?
      gravitar_id = Digest::MD5.hexdigest(student.Email.downcase)
      "http://gravatar.com/avatar/#{gravitar_id}.png?s=48"
     else
     gravitar_id = student.Gravitar
    end
  end
end

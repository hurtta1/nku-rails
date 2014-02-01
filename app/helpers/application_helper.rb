module ApplicationHelper
  def gravitar_url(student)
    gravatar_id = Digest::MD5.hexdigest(student.Email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end
end

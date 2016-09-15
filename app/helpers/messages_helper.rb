module MessagesHelper
  def recipients_options(chosen_recipient = nil)
    s = ''
    User.all.each do |user|
      s << "<option value='#{user.id}' data-img-src='#{gravatar_image_url(user.name, size: 50)}' #{'selected' if user == chosen_recipient}>#{user.name}</option>"
    end
    s.html_safe
  end

  # def auto_subject(project_name)
  #   if @project
  #     project_name = @project.name
  #   else
  #     project_name = nil
  #   end
  # end
end

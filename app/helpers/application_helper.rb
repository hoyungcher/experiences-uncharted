module ApplicationHelper

  def role_helper
    if controller.class == Devise::SessionsController
     "experience-seeker"
    elsif controller.class == SessionsController
      "host"
    else
    "stranger"
    end
  end
end

# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def default_body_id
    controller.controller_name.underscore
  end
end

module NavigationHelper
  # OPTIMIZE: improve this. See also layouts/_header.html.erb
  def current(controller, action = nil)
    if action
      ('class="current"').html_safe if controller_name == controller.to_s && action_name == action.to_s
    else
      ('class="current"').html_safe if controller_name == controller.to_s
    end
  end
end
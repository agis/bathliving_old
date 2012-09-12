module NavigationHelper
  # OPTIMIZE: improve this. See also layouts/_header.html.erb
  def current_controller(name)
    raw('class="current"') if controller_name == name.to_s
  end
end
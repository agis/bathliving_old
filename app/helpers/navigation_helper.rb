module NavigationHelper
  # OPTIMIZE: improve this
  def current_controller(name)
    raw('class="current"') if controller_name == name.to_s
  end
end
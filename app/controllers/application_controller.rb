class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  # Use to fetch the previous-next Product/Project records from each model respectively

  def neighboor(model, direction)
    begin
      return model.find(params[:id].to_i + 1) if direction == :previous
      return model.find(params[:id].to_i - 1) if direction == :next
    rescue
      "#"
    end
  end
end

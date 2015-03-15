class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user 
  helper_method :user_events
  def current_user
     User.where(id:session["user_id"]).first
  end
  def current_owner
     Owner.where(id:session["owner_id"]).first
  end
  def current_pilot
     Pilot.where(id:session["pilot_id"]).first
  end
  def user_events
    Event.where(user_id:current_user.id)
  end
end

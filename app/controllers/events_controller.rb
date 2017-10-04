class EventsController < ApplicationController
  before_action :authenticate_user_or_anonymous_user

  # POST /events
  def create
    @event = Event.new(event_params)

    user = current_user_or_anonymous_user
    if user.class.to_s == "User" && !user.nil?
      @event.relations["user_id"] = user.id
    end
    if user.class.to_s == "AnonymousUser" && !user.nil?
      @event.relations["anonymous_user"] = user.id
    end

    if @event.save
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit({:relations => {}}, {:context => {}}, {:meta => {}})
    end
end

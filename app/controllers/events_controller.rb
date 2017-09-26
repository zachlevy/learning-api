class EventsController < ApplicationController
  before_action :authenticate_user_or_anonymous_user, only: [:create]
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    @events = Event.all

    render json: @events
  end

  # GET /events/1
  def show
    render json: @event
  end

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

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit({:relations => {}}, {:context => {}}, {:meta => {}})
    end
end

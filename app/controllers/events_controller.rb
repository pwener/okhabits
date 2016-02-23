class EventsController < ApplicationController
  # include LoginFilters
  #
  # skip_before_filter :verify_authenticity_token, only: :create

  before_action :authenticate_user!, only: [:create, :index]

  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @event = Event.new
    @your_events = Event.where(author_id: current_user.id)
                        .paginate(page: params[:page])
                        .order('id DESC')

    @enemy = User.find(current_user.enemy_id)
    @enemy_events = Event.where(author_id: current_user.enemy_id)
                         .paginate(page: params[:page])
                         .order('id DESC')

    @score_that_have_more = @enemy_events if @enemy_events.size > 7
                            else @score_that_have_more = @your_events

  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.author_id = current_user.id
    @event.happen_in = Time.now

    if @event.save
      flash[:notice] = "Event has been created"
    else
      flash[:danger] = "Some error occurs and event was not created"
    end

    redirect_to events_path
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:event_type_id)
    end
end

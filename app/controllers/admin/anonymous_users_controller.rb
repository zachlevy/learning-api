class Admin::AnonymousUsersController < AdminController
  # GET /admin/anonymous_users
  def index
    # get all anonymous_users in reverse order
    @anonymous_users = AnonymousUser.all.order(id: :desc)
    render json: @anonymous_users
  end

  # GET /admin/anonymous_users/1
  def show
    render json: @anonymous_user
  end

  # POST /admin/anonymous_users
  def create
    @anonymous_user = AnonymousUser.new(anonymous_user_params)

    if @anonymous_user.save
      render json: @anonymous_user, status: :created, location: @anonymous_user
    else
      render json: @anonymous_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/anonymous_users/1
  def update
    if @anonymous_user.update(anonymous_user_params)
      render json: @anonymous_user
    else
      render json: @anonymous_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /admin/anonymous_users/1
  def destroy
    @anonymous_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anonymous_user
      @anonymous_user = AnonymousUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def anonymous_user_params
      params.fetch(:anonymous_user, {})
    end
end

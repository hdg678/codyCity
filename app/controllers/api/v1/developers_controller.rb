class Api::V1::DevelopersController < Api::V1::APIController
  include DeviseTokenAuth::Concerns::SetUserByToken

  # GET /api/v1/developers
  def index
    @developers = Developer.all
    render json: @developers
  end

  # GET /api/v1/developers/1
  def show
    render json: developer
  end

  private

  def developer_params
    params.require(:developer).permit(:first_name, :last_name, :email, :password, :github_username, :github_password, :is_teacher)
  end

  def developer
    @developer ||= Developer.find(params[:id])
  end

  def new_developer(attrs={})
    @developer ||= Developer.new(attrs)
  end
end

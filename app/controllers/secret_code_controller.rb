class SecretCodeController < ApplicationController
  before_action :authenticate_user!
  respond_to :html

  def index
    authorize! :manage, SecretCode
    @secret_codes = SecretCode.order(created_at: :desc).page(params[:page])
  end

  def create
    authorize! :manage, SecretCode
    SecretCode.create(code: SecureRandom.uuid)

    redirect_to secret_code_index_path, notice: 'Secret Code is created successfully'
  end
end

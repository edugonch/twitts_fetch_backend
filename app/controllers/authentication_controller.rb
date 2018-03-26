class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  # Generate Authentication Token
  #
  # @body_parameter [string] email
  # @body_parameter [string] password
  # @response_status 200
  # @response_root authenticate
  # @response_class string
  
  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
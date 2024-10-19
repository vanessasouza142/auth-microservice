class Api::V1::AuthenticationController < ApplicationController

  def register
    user = User.new(user_params)
    if user.save
      token = encode_token({ user_id: user.id })
      render json: { user: user, token: token }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = encode_token({ user_id: user.id })
      render json: { user: user, token: token }, status: :ok
    else
      render json: { error: 'Credenciais inválidas' }, status: :unauthorized
    end
  end

  def validate_token
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    begin
      decoded = JWT.decode(token, Rails.application.credentials.secret_key_base)[0]
      user = User.find(decoded["user_id"])
      render json: { user_id: user.id, user_name: user.name }, status: :ok
    rescue JWT::DecodeError, ActiveRecord::RecordNotFound
      render json: { errors: 'Token inválido ou usuário não encontrado' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end

  def encode_token(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

end
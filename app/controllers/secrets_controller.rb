class SecretsController < ApplicationController

  before_filter :require_current_user!

  def new
    @users = User.all
    render :new
  end

  def create
    @secret = Secret.new(params[:secret])
    @secret.author_id = current_user.id

    if @secret.save
      redirect_to @secret.recipient
    else
      redirect_to new_user_secret_url
    end
  end

end

class SecretsController < ApplicationController

  before_filter :require_current_user!

  def new
    @tags = Tag.all
    @users = User.all
    render :new
  end

  def create
    @secret = Secret.new(params[:secret])
    @secret.author_id = current_user.id

    @secret.tag_ids = params[:tag_ids].uniq

    if @secret.save
      respond_to do |format|
        format.html { redirect_to @secret.recipient }
        format.json { render json: [@secret] + @secret.tags }
      end
    else
      redirect_to new_user_secret_url
    end
  end

end

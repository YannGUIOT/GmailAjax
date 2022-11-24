class EmailsController < ApplicationController
  def index
    @emails=Email.all
  end

  def create 
    @email= Email.new(object:Faker::Games::Pokemon.move,body:Faker::ChuckNorris.fact)
    if @email.save
      respond_to do |format|
        format.html { 
          redirect_to root_path
          flash[:notice] = "Email created" 
        }
        format.js { }
      end
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end

  def show 
    @email = Email.find(params[:id])
    @email.update(read:true)
    p @email
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  def destroy 
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  def update 
    @email = Email.find(params[:id])
    @email.update(post_params)
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  private

  def post_params
    params.permit(:read,:object,:body,:id)
  end

end

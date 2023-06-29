class ClientsController < ApplicationController
  

  def show
    # @client = Client.find(params[:id])
    # if params[:status] == "activated"
    #   @clients = Client.activated
    # else
    #   @clients = Client.inactivated
    # end
    @client = Client.all

  end

  def new
    @client = Client.new
  end

  def create 
    # @client = Client.new(name: params[:client][:name],password: params[:client][:password],status: params[:client][:status])
    @client = Client.new(new_client)
    if @client.save 
      flash[:success]='User created Successfully...'
      redirect_to login_path
    else 
      render new
    end
  end
  
  def index
    # @client = params[:username]
    @client = Client.all
    unless session[:name].nil? 
      @client=session[:name]
      session.delete(:name)  
    else
      redirect_to login_path
    end
  end

  def login
  end

  def login1
    name = params[:name]
    password = params[:password]
    unless Client.find_by(name: name) && Client.find_by(password: password)
      session[:name] = name
      # username=name
      # redirect_to index_path(username: name)
      redirect_to index_path
    else
      redirect_to login_path
    end
  end

  private
  def new_client
    params.require(:client).permit(:name,:password,:status)
  end

end

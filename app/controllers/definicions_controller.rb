class DefinicionsController < ApplicationController
  before_filter :authenticate, :only => [:index]
  # GET /definicions
  # GET /definicions.json
  def index
    @definicions = Definicion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @definicions }
    end
  end

  # GET /definicions/1
  # GET /definicions/1.json
  def show
    @definicion = Definicion.all
    @random = [rand(@definicion.count), rand(@definicion.count)]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @definicion }
    end
  end

  # GET /definicions/new
  # GET /definicions/new.json
  def new
    @definicion = Definicion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @definicion }
    end
  end

  # GET /definicions/1/edit
  def edit
    @definicion = Definicion.find(params[:id])
  end

  # POST /definicions
  # POST /definicions.json
  def create
    @definicion = Definicion.new(params[:definicion])

    respond_to do |format|
      if @definicion.save
        format.html { redirect_to @definicion, notice: 'Definicion fue reada exitosamente.' }
        format.json { render json: @definicion, status: :created, location: @definicion }
      else
        flash[:alert] = "Revise los datos"
        format.html { render action: "new" }
        format.json { render json: @definicion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /definicions/1
  # PUT /definicions/1.json
  def update
    @definicion = Definicion.find(params[:id])

    respond_to do |format|
      if @definicion.update_attributes(params[:definicion])
        format.html { redirect_to @definicion, notice: 'Definicion fue actualizada exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @definicion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /definicions/1
  # DELETE /definicions/1.json
  def destroy
    @definicion = Definicion.find(params[:id])
    @definicion.destroy

    respond_to do |format|
      format.html { redirect_to definicions_url }
      format.json { head :no_content }
    end
  end


  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == "123456"
    end
  end
end

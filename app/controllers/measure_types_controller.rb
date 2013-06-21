class MeasureTypesController < ApplicationController
  # GET /measure_types
  # GET /measure_types.json
  def index
    @measure_types = MeasureType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @measure_types }
    end
  end

  # GET /measure_types/1
  # GET /measure_types/1.json
  def show
    @measure_type = MeasureType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @measure_type }
    end
  end

  # GET /measure_types/new
  # GET /measure_types/new.json
  def new
    @measure_type = MeasureType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @measure_type }
    end
  end

  # GET /measure_types/1/edit
  def edit
    @measure_type = MeasureType.find(params[:id])
  end

  # POST /measure_types
  # POST /measure_types.json
  def create
    @measure_type = MeasureType.new(params[:measure_type])

    respond_to do |format|
      if @measure_type.save
        format.html { redirect_to @measure_type, notice: 'Measure type was successfully created.' }
        format.json { render json: @measure_type, status: :created, location: @measure_type }
      else
        format.html { render action: "new" }
        format.json { render json: @measure_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /measure_types/1
  # PUT /measure_types/1.json
  def update
    @measure_type = MeasureType.find(params[:id])

    respond_to do |format|
      if @measure_type.update_attributes(params[:measure_type])
        format.html { redirect_to @measure_type, notice: 'Measure type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @measure_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measure_types/1
  # DELETE /measure_types/1.json
  def destroy
    @measure_type = MeasureType.find(params[:id])
    @measure_type.destroy

    respond_to do |format|
      format.html { redirect_to measure_types_url }
      format.json { head :no_content }
    end
  end
end

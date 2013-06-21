class MeasureConversionsController < ApplicationController
  # GET /measure_conversions
  # GET /measure_conversions.json
  def index
    @measure_conversions = MeasureConversion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @measure_conversions }
    end
  end

  # GET /measure_conversions/1
  # GET /measure_conversions/1.json
  def show
    @measure_conversion = MeasureConversion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @measure_conversion }
    end
  end

  # GET /measure_conversions/new
  # GET /measure_conversions/new.json
  def new
    @measure_conversion = MeasureConversion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @measure_conversion }
    end
  end

  # GET /measure_conversions/1/edit
  def edit
    @measure_conversion = MeasureConversion.find(params[:id])
  end

  # POST /measure_conversions
  # POST /measure_conversions.json
  def create
    @measure_conversion = MeasureConversion.new(params[:measure_conversion])

    respond_to do |format|
      if @measure_conversion.save
        format.html { redirect_to @measure_conversion, notice: 'Measure conversion was successfully created.' }
        format.json { render json: @measure_conversion, status: :created, location: @measure_conversion }
      else
        format.html { render action: "new" }
        format.json { render json: @measure_conversion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /measure_conversions/1
  # PUT /measure_conversions/1.json
  def update
    @measure_conversion = MeasureConversion.find(params[:id])

    respond_to do |format|
      if @measure_conversion.update_attributes(params[:measure_conversion])
        format.html { redirect_to @measure_conversion, notice: 'Measure conversion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @measure_conversion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measure_conversions/1
  # DELETE /measure_conversions/1.json
  def destroy
    @measure_conversion = MeasureConversion.find(params[:id])
    @measure_conversion.destroy

    respond_to do |format|
      format.html { redirect_to measure_conversions_url }
      format.json { head :no_content }
    end
  end
end

class CutoffsController < ApplicationController
  before_action :set_cutoff, only: [:show, :edit, :update, :destroy]

  # GET /cutoffs
  # GET /cutoffs.json
  def index
    @cutoffs = Cutoff.all
  end

  # GET /cutoffs/1
  # GET /cutoffs/1.json
  def show
  end

  # GET /cutoffs/new
  def new
    @cutoff = Cutoff.new
  end

  # GET /cutoffs/1/edit
  def edit
  end

  # POST /cutoffs
  # POST /cutoffs.json
  def create
    @cutoff = Cutoff.new(cutoff_params)

    respond_to do |format|
      if @cutoff.save
        format.html { redirect_to @cutoff, notice: 'Cutoff was successfully created.' }
        format.json { render :show, status: :created, location: @cutoff }
      else
        format.html { render :new }
        format.json { render json: @cutoff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cutoffs/1
  # PATCH/PUT /cutoffs/1.json
  def update
    respond_to do |format|
      if @cutoff.update(cutoff_params)
        format.html { redirect_to @cutoff, notice: 'Cutoff was successfully updated.' }
        format.json { render :show, status: :ok, location: @cutoff }
      else
        format.html { render :edit }
        format.json { render json: @cutoff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cutoffs/1
  # DELETE /cutoffs/1.json
  def destroy
    @cutoff.destroy
    respond_to do |format|
      format.html { redirect_to cutoffs_url, notice: 'Cutoff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cutoff
      @cutoff = Cutoff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cutoff_params
      params.require(:cutoff).permit(:cutoff_at)
    end
end

class KontoumsatzsController < ApplicationController
  before_action :set_kontoumsatz, only: [:show, :edit, :update, :destroy]

  # GET /kontoumsatzs
  # GET /kontoumsatzs.json
  def index
    @kontoumsatzs = Kontoumsatz.all
  end

  # GET /kontoumsatzs/1
  # GET /kontoumsatzs/1.json
  def show
  end

  # GET /kontoumsatzs/new
  def new
    @kontoumsatz = Kontoumsatz.new
  end

  # GET /kontoumsatzs/1/edit
  def edit
  end

  # POST /kontoumsatzs
  # POST /kontoumsatzs.json
  def create
    @kontoumsatz = Kontoumsatz.new(kontoumsatz_params)

    respond_to do |format|
      if @kontoumsatz.save
        format.html { redirect_to @kontoumsatz, notice: 'Kontoumsatz was successfully created.' }
        format.json { render :show, status: :created, location: @kontoumsatz }
      else
        format.html { render :new }
        format.json { render json: @kontoumsatz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kontoumsatzs/1
  # PATCH/PUT /kontoumsatzs/1.json
  def update
    respond_to do |format|
      if @kontoumsatz.update(kontoumsatz_params)
        format.html { redirect_to @kontoumsatz, notice: 'Kontoumsatz was successfully updated.' }
        format.json { render :show, status: :ok, location: @kontoumsatz }
      else
        format.html { render :edit }
        format.json { render json: @kontoumsatz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kontoumsatzs/1
  # DELETE /kontoumsatzs/1.json
  def destroy
    @kontoumsatz.destroy
    respond_to do |format|
      format.html { redirect_to kontoumsatzs_url, notice: 'Kontoumsatz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    Kontoumsatz.import(params[:file])
    redirect_to kontoumsatzs_path, notice: "Erfolgreich importiert"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kontoumsatz
      @kontoumsatz = Kontoumsatz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kontoumsatz_params
      params.require(:kontoumsatz).permit(:weg, :wertstellung, :umsatzart, :buchungsdetails, :auftraggeber, :empfaenger, :betrag, :saldo)
    end
end

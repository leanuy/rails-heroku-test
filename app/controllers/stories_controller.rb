require 'json'



class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.all
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
  end

  def accion
    # GET /lenny
    genders = ['putito', 'machote', 'maricota']
    result = genders[rand(genders.length)]
    render json: { genero: result}
  end

  def decidir
    #GET yes-no
    render json: { answer: ['yes', 'no'][rand(2)]}
  end

  def alguien
    # GET /alguien-tiene-un-gemfile
    # /home/leandro/Documents/ruby_projects/test_app
    contenido = "# GEMFILE QUE ANDA: \r\n\n"
    File.open(File.dirname(__FILE__) + "/GemfileTxt.txt").each do |line|
      contenido += line
    end
    render plain: contenido
  end

  def estimar
    numeros = ['1', '2', '3', '5', '8', 'cafe']
    render json: { estimation: numeros[rand(numeros.length)]}
  end

  # GET /stories/new
  def new
    @story = Story.new
  end

  # GET /stories/1/edit
  def edit
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(story_params)

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_url, notice: 'Story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:title, :content)
    end
end

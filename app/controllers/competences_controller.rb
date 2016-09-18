class CompetencesController < ApplicationController
  before_action :get_current, only: [ :edit, :update, :destroy ]

  def index
    @competences = Competence.paginate per_page: 5, page: params[:page]
  end

  def new
    @competence = Competence.new
  end

  def create
    @competence = Competence.new competence_params
    respond_to do |format|
      if @competence.save
        format.html { redirect_to competences_path, notice: 'Создана новая компетенция' }
        format.json { render :index, status: :created, location: competences_path }
      else
        format.html { render :new }
        format.json { render json: @competence.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    respond_to do |format|
      if @competence.update competence_params
        format.html { redirect_to competences_path, notice: 'Обновлена компетенция' }
        format.json { render :index, status: :ok, location: competences_path }
      else
        format.html { render :new }
        format.json { render json: @competence.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    respond_to do |format|
      if @competence.destroy
        format.html { redirect_to competences_path, notice: 'Удаление прошло успешно' }
        format.json { render :index, status: :ok, location: competences_path }
      else
        format.html { render :index, error: 'Не получилось удалить компетенцию' }
        format.json { render @competence.errors, status: :unprocessable_entity  }
      end
    end
  end

private
  def competence_params
    params.require(:competence).permit(:name)
  end

  def get_current
    @competence = Competence.find params[:id]
  end
end

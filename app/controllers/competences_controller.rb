class CompetencesController < ApplicationController
  before_action :get_current, only: [ :edit, :update, :destroy ]

  helper_method :sort_param, :direction_param, :safe_params

  # respond_to :html, :js, :json


  def index
    @competences = Competence.search(params[:search]).order("#{sort_param} #{direction_param}").paginate(per_page: 5, page: params[:page])
    respond_to do |format|
      format.html { render :index }
      format.js
      format.json { render @competences.to_json }
    end
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

  # По какому полю сортируем, на будущее
  def sort_param
    Competence.column_names.include?(params[:sort])? params[:sort] : 'name'
  end

  def direction_param
    %w(asc desc).include?(params[:direction])? params[:direction] : 'asc'
  end

  # См. https://github.com/rails/rails/issues/26289
  def safe_params
    params.except(:host, :port, :protocol).permit!
  end

end

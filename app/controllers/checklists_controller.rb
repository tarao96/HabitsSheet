class ChecklistsController < ApplicationController
  before_action :set_checklist, only: [:show, :edit, :update, :destroy]
  
  def index
    @checklists = Checklist.all.paginate(page: params[:page],per_page:5).order(created_at: :desc)
  end
  
  def new
    @checklist = Checklist.new
  end

  def show
  end

  def create
     @checklist = Checklist.new(checklist_params)
     @checklist.save!
     redirect_to checklists_url, notice: "チェックリスト「#{@checklist.date}」を登録しました"
  end
  
  def update
    @checklist.update!(checklist_params)
    redirect_to checklists_url, notice: "チェック表「#{@checklist.date}」を更新しました。"
  end

  def edit
  end

  def destroy
    @checklist.destroy
    redirect_to checklists_url, notice: "チェック表「#{@checklist.date}」を削除しました。"
  end
  
  private
  
  def checklist_params
    params.require(:checklist).permit(:date, :try, :review, :reason, :comment)
  end
  
  def set_checklist
    @checklist = Checklist.find_by(id: params[:id])
  end
  
  
end

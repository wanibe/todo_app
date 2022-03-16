class TasksController < ApplicationController
    # protect_from_forgery :except => [:destroy]

    #TODO一覧
    def index
        @tasks = Task.all
    end

    #TODO新規作成
    def new
        @task = Task.new
    end

    #DBに保存
    def create
        @task = Task.new(task_params)
        if @task.save
            redirect_to tasks_path
        else
            render 'new', status: :unprocessable_entity
        end
    end

    #詳細ページ
    def show
        @task = Task.find(params[:id])
    end

    #編集
    def edit
        @task = Task.find(params[:id])
    end

    #DB更新
    def update
        @task = Task.find(params[:id])

        if @task.update(task_params)
            redirect_to task_path
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    #削除
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to tasks_path
    end

    private
    def task_params
        params.require(:task).permit(:title, :body)
    end

end

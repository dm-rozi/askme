class UsersController < ApplicationController

  before_action :load_user, except: [:index, :create, :new]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_url, notice: 'Пользователь успешно зарегистрирован!'
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @questions = @user.questions.order(created_at: :desc)
    @questions_count = @questions.size

    # Для формы нового вопроса создаём заготовку, вызывая build у результата вызова метода @user.questions.
    @new_question = @user.questions.build
    # @new_question = Question.new
  end

  def update
    # пытаемся обновить юзера
    if @user.update(user_params)
      # Если получилось, отправляем пользователя на его страницу с сообщением
      redirect_to user_path(@user), notice: 'Данные обновлены'
    else
      # Если не получилось, как и в create, рисуем страницу редактирования
      # пользователя со списком ошибок
      render 'edit'
    end
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :username, :avatar_url)
  end
end

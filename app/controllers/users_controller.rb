class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      username: 'SpongeBob',
      email: 'sponge@bob.com',
      password: '12345',
      avatar_url: 'https://i.ibb.co/sRtBG7G/image.jpg'
    )

    @questions = [
      Question.new(text: 'Успеешь?', created_at: Date.parse('25.10.2020')),
      Question.new(text: 'Когда все сделать?', created_at: Date.parse('26.10.2020')),
      Question.new(text: 'Когда все это сделать?', created_at: Date.parse('26.10.2020')),
      Question.new(text: 'Ну привет?', created_at: Date.parse('27.10.2020')),
      Question.new(text: 'Когда все это сделать?', created_at: Date.parse('26.10.2020')),
      Question.new(text: 'Ну привет?', created_at: Date.parse('27.10.2020')),
      Question.new(text: 'Когда все это сделать?', created_at: Date.parse('26.10.2020')),
      Question.new(text: 'Ну привет?', created_at: Date.parse('27.10.2020')),
      Question.new(text: 'Когда все это сделать?', created_at: Date.parse('26.10.2020')),
      Question.new(text: 'Ну привет?', created_at: Date.parse('27.10.2020')),
      Question.new(text: 'Почитаешь доки?', created_at: Date.parse('27.10.2020'))
    ]

    @new_question = Question.new
    @questions_count = @questions.size
  end
end

get '/' do
  erb :index
end

post '/login' do
	user_info = params[:user_info]
	user = User.find_by_username(user_info[:username])

	if user && user.password == user_info[:password]
		session[:user_id] = user.id
		redirect '/surveys'
	else
		flash[:notice] = "Login failed"
		redirect '/'
	end
end

post '/register' do
	user_info = params[:user_info]
	user = User.create(username: user_info[:username], password: user_info[:password])
	session[:user_id] = user.id
	redirect '/'
end

get '/logout' do
	session.clear
	redirect '/'
end

post '/signform' do
	@action = params[:action]
	@submit_button = params[:button]

	if request.xhr?
		erb :_logform, layout: false
	else
		redirect '/'
	end
end

get '/make' do
	erb :make
end

post '/add_survey' do
	new_survey = Survey.create(name: params[:title])

	new_question = Question.create(text: params[:survey][:question][:text], survey_id: survey.id)
	new_question.options << Option.create(text: params[:survey][:question][:option][:text], question_id: question.id)

	survey = Survey.create(name: params[:survey][:title])
	# params[].each do |question|
	# survey.questions << Question.create(params[:question1])
	# end
	redirect '/'
end

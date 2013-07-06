get '/' do
  erb :index, :layout => :landing_page
end

post '/login' do
	user_info = params[:user_info]
	user = User.find_by_username(user_info[:username])

	if user
		if user.password == user_info[:password]
			session[:user_id] = user.id
			redirect '/'
		else
			flash[:notice] = "Login failed"
			redirect '/'
		end
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
	survey = Survey.create(name: params[:survey][:title])
	
	new_question = Question.create(text: params[:question1][:question_text], survey_id: survey.id)
	params[:question1][:options].keys.each do |option|
		Option.create(text: params[:question1][:options][option], question_id: new_question.id)
	end

end



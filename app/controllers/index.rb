get '/' do
  # Look in app/views/index.erb
  erb :index
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
		end
	else
		flash[:notice] = "Login failed"
		redirect '/'
	end
end

get '/logout' do
	session.clear
	redirect '/'
end
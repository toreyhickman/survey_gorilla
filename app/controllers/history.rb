get '/history' do
  @user = User.find(session[:user_id])
  erb :history
end

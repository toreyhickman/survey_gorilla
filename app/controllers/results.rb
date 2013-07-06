get '/survey_results/:survey_id' do
  @user = User.find(session[:user_id])
  @survey = Survey.find(params[:survey_id])
  @responses = Response.all
  erb :results
end

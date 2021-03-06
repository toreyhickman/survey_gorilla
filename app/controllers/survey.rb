get '/surveys' do
  @surveys = Survey.all
  erb :show_surveys
end

get '/surveys/:survey_id' do
  @survey = Survey.includes(:questions).find(params[:survey_id])

  @user = User.find(session[:user_id])

  if @user.answered_surveys.include?(@survey)
    @already_taken = { :message => "You have already completed this survey." }
  end

  erb :answer_survey
end

post '/surveys/:survey_id' do
  new_session = Session.create(:user_id => session[:user_id],
                     :survey_id => params[:survey_id]) 
  @survey = Survey.find(params[:survey_id])
  @survey.questions.each do |question|
    Response.create(:session_id => new_session.id,
                    :option_id => params[:options])
  end
  redirect '/surveys'
end

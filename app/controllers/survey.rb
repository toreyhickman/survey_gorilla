get '/surveys' do
  @surveys = Survey.all
  erb :show_surveys
end

get '/surveys/:survey_id' do
  @survey = Survey.include(:questions).include(:options).find(params[:survey_id])
  erb :answer_survey
end

post '/surveys/:survey_id' do
  new_session = Session.create(:user_id => session[:user_id],
                     :survey_id => params[:survey_id]) 
  @survey = Survey.find(params[:survey_id])
  @survey.questions.each do |question|
    Response.create(:session_id => new_session.id,
                    :option_id => params[question.id])
  end
  redirect '/surveys'
end

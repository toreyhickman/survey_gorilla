User.create(username: 'Rick',
            password: 'password')

User.create(username: 'Chris_L',
            password: 'password')

User.create(username: 'Chris_J',
            password: 'password')

User.create(username: 'Torey',
            password: 'password')

User.create(username: 'Karst',
            password: 'password')

users = User.all

users.each do |user|
  3.times do
    survey = user.created_surveys.create(name: Faker::Company.name)
    question = survey.questions.create(text: Faker::Company.catch_phrase)

    5.times do
      question.options.create(text: Faker::Company.bs)
    end
  end
end

15.times do
  User.create(username: Faker::Internet.user_name, password: "password")
end

users = User.all

users.each do |user|
  user_created_survey_ids = user.created_surveys.map { |survey| survey.id }

  surveys_to_answer = Survey.all.select { |survey| !user_created_survey_ids.include?(survey.id) }
  surveys_to_answer = surveys_to_answer.shuffle.values_at(* surveys_to_answer.each_index.select { |i| i.even? })


  surveys_to_answer.each do |survey|

    session = Session.create(user_id: user.id, survey_id: survey.id)

    questions = survey.questions

    questions.each do |question|

      option_selected = question.options.sample

      Response.create(session_id: session.id, option_id: option_selected.id)

    end
  end
end
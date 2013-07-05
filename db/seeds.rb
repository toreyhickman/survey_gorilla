#lines 1-5 are for 5 questions per survey the rest is 1 question per survey

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

5.times do
  User.create(username: Faker::Internet.user_name, password: "password")
end

15.times do
  Survey.create(name: Faker::Company.name, creator_id: rand(1..10))
end

count = 0
15.times do
	count += 1
	5.times do
  	Question.create(text: Faker::Company.catch_phrase, survey_id: count # puts 5 questions per survey
  end
end


count = 0
45.times do
	count += 1  #this makes sure that every question gets 5 options.
	5.times do
		Option.create(text: Faker::Company.bs, question_id: count)
	end
end

30.times do
	Session.create(user_id: rand(1..10), survey_id: rand(1..15))
end

counter = 0
count = 0
30.times do
	count += 1
	5.times do
		counter += 1
		Response.create(session_id: (count), opinion_id: ((counter * 5) - rand(0..4)))
	end
end

# _________________ above 5 questions per survey
# 375 / 5 = 75
# ---------------- Below one question per survey

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

5.times do
  User.create(username: Faker::Internet.user_name, password: "password")
end

15.times do
  Survey.create(name: Faker::Company.name, creator_id: rand(1..10))
end

count = 0
15.times do
	count += 1
  Question.create(text: Faker::Company.catch_phrase, survey_id: count)
end


count = 0
15.times do
	count += 1  #this makes sure that every question gets 5 options.
	5.times do
		Option.create(text: Faker::Company.bs, question_id: count)
	end
end

30.times do
	Session.create(user_id: rand(1..10), survey_id: rand(1..15))
end

counter = 0
15.times do
	counter += 1
	2.times
		Response.create(session_id: counter, opinion_id: ((counter * 5) - rand(5)))
	end
end

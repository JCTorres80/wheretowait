# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# add in default flagged words
FlaggedWord.create :word => 'alcoholic'
FlaggedWord.create :word => 'ass'
FlaggedWord.create :word => 'asshole'
FlaggedWord.create :word => 'balls'
FlaggedWord.create :word => 'bastard'
FlaggedWord.create :word => 'bitch'
FlaggedWord.create :word => 'cheater'
FlaggedWord.create :word => 'cocaine'
FlaggedWord.create :word => 'cock'
FlaggedWord.create :word => 'cokehead'
FlaggedWord.create :word => 'crack'
FlaggedWord.create :word => 'creep'
FlaggedWord.create :word => 'cunt'
FlaggedWord.create :word => 'dick'
FlaggedWord.create :word => 'dickhead'
FlaggedWord.create :word => 'drunkard'
FlaggedWord.create :word => 'faggot'
FlaggedWord.create :word => 'fuck'
FlaggedWord.create :word => 'fucker'
FlaggedWord.create :word => 'heroin'
FlaggedWord.create :word => 'homo'
FlaggedWord.create :word => 'homosexual'
FlaggedWord.create :word => 'junkie'
FlaggedWord.create :word => 'marijuana'
FlaggedWord.create :word => 'motherfucker'
FlaggedWord.create :word => 'porn'
FlaggedWord.create :word => 'queer'
FlaggedWord.create :word => 'retard'
FlaggedWord.create :word => 'shit'
FlaggedWord.create :word => 'shithead'
FlaggedWord.create :word => 'sleeping with'
FlaggedWord.create :word => 'slept with'
FlaggedWord.create :word => 'sex'
FlaggedWord.create :word => 'slut'
FlaggedWord.create :word => 'son of a bitch'
FlaggedWord.create :word => 'weed'
FlaggedWord.create :word => 'whore'

# add answers
a00 = Answer.create :title => 'Strongly Agree', :value => 5
a01 = Answer.create :title => 'Somewhat Agree', :value => 4
a02 = Answer.create :title => 'Neutral', :value => 3
a03 = Answer.create :title => 'Somewhat Disagree', :value => 2
a04 = Answer.create :title => 'Strongly Disagree', :value => 1

a05 = Answer.create :title => 'Yes', :value => 2
a06 = Answer.create :title => 'No', :value => 5


# add questions
q00 = Question.create :title => 'What are you averaging a week?', :answer_type => 'number', :group => 'Income', :unit => '$', :sub_group => 'Average income per week', :sub_group_unit => '$/week'
q01 = Question.create :title => 'How many hours a week do you work?', :answer_type => 'number', :group => 'Income', :unit => 'hrs', :sub_group => 'Average hours per week', :sub_group_unit => 'hr/week'
q02 = Question.create :title => 'Shifts are fairly distributed.', :answer_type => 'choice', :group => 'Management', :unit => '', :sub_group => 'Management'
q03 = Question.create :title => 'Managers behave professionally.', :answer_type => 'choice', :group => 'Management', :unit => '', :sub_group => 'Management'
q04 = Question.create :title => 'You feel comfortable approaching your managers.', :answer_type => 'choice', :group => 'Management', :unit => '', :sub_group => 'Management'
q05 = Question.create :title => 'Employees are cut in a timely manner.', :answer_type => 'choice', :group => 'Management', :unit => '', :sub_group => 'Management'
q06 = Question.create :title => 'What percentage does the average clientele tip?', :answer_type => 'number', :group => 'Clientele', :unit => '%', :sub_group => 'Clientele'
q07 = Question.create :title => 'The establishment has loyal regulars.', :answer_type => 'choice', :group => 'Clientele', :unit => '', :sub_group => 'Clientele'
q08 = Question.create :title => 'I like the clientele.', :answer_type => 'choice', :group => 'Clientele', :unit => '', :sub_group => 'Clientele'
q09 = Question.create :title => 'My uniform is comfortable.', :answer_type => 'choice', :group => 'Uniform', :unit => '', :sub_group => 'Uniform'
q10 = Question.create :title => 'I like the appearance of my uniform.', :answer_type => 'choice', :group => 'Uniform', :unit => '', :sub_group => 'Uniform'
q11 = Question.create :title => 'Do you have to pay for your uniform?', :answer_type => 'choice', :group => 'Uniform', :unit => '', :sub_group => 'Uniform'
q12 = Question.create :title => 'Do you have to dry clean your uniform?', :answer_type => 'choice', :group => 'Uniform', :unit => '', :sub_group => 'Uniform'
q13 = Question.create :title => 'There is a low turnover rate.', :answer_type => 'choice', :group => 'Employee Happiness', :unit => '', :sub_group => 'Happiness'
q14 = Question.create :title => 'I like the people that I work with.', :answer_type => 'choice', :group => 'Employee Happiness', :unit => '', :sub_group => 'Happiness'
q15 = Question.create :title => 'I enjoy my work environment.', :answer_type => 'choice', :group => 'Employee Happiness', :unit => '', :sub_group => 'Happiness'
q16 = Question.create :title => 'My time-off requests are fairly considered, and granted when possible.', :answer_type => 'choice', :group => 'Employee Happiness', :unit => '', :sub_group => 'Happiness'

# question answers map
QuestionAnswer.create :question => q02, :answer => a00
QuestionAnswer.create :question => q02, :answer => a01
QuestionAnswer.create :question => q02, :answer => a02
QuestionAnswer.create :question => q02, :answer => a03
QuestionAnswer.create :question => q02, :answer => a04

QuestionAnswer.create :question => q03, :answer => a00
QuestionAnswer.create :question => q03, :answer => a01
QuestionAnswer.create :question => q03, :answer => a02
QuestionAnswer.create :question => q03, :answer => a03
QuestionAnswer.create :question => q03, :answer => a04

QuestionAnswer.create :question => q04, :answer => a00
QuestionAnswer.create :question => q04, :answer => a01
QuestionAnswer.create :question => q04, :answer => a02
QuestionAnswer.create :question => q04, :answer => a03
QuestionAnswer.create :question => q04, :answer => a04

QuestionAnswer.create :question => q05, :answer => a00
QuestionAnswer.create :question => q05, :answer => a01
QuestionAnswer.create :question => q05, :answer => a02
QuestionAnswer.create :question => q05, :answer => a03
QuestionAnswer.create :question => q05, :answer => a04

QuestionAnswer.create :question => q07, :answer => a00
QuestionAnswer.create :question => q07, :answer => a01
QuestionAnswer.create :question => q07, :answer => a02
QuestionAnswer.create :question => q07, :answer => a03
QuestionAnswer.create :question => q07, :answer => a04

QuestionAnswer.create :question => q08, :answer => a00
QuestionAnswer.create :question => q08, :answer => a01
QuestionAnswer.create :question => q08, :answer => a02
QuestionAnswer.create :question => q08, :answer => a03
QuestionAnswer.create :question => q08, :answer => a04

QuestionAnswer.create :question => q09, :answer => a00
QuestionAnswer.create :question => q09, :answer => a01
QuestionAnswer.create :question => q09, :answer => a02
QuestionAnswer.create :question => q09, :answer => a03
QuestionAnswer.create :question => q09, :answer => a04

QuestionAnswer.create :question => q10, :answer => a00
QuestionAnswer.create :question => q10, :answer => a01
QuestionAnswer.create :question => q10, :answer => a02
QuestionAnswer.create :question => q10, :answer => a03
QuestionAnswer.create :question => q10, :answer => a04

QuestionAnswer.create :question => q11, :answer => a05
QuestionAnswer.create :question => q11, :answer => a06

QuestionAnswer.create :question => q12, :answer => a05
QuestionAnswer.create :question => q12, :answer => a06

QuestionAnswer.create :question => q13, :answer => a00
QuestionAnswer.create :question => q13, :answer => a01
QuestionAnswer.create :question => q13, :answer => a02
QuestionAnswer.create :question => q13, :answer => a03
QuestionAnswer.create :question => q13, :answer => a04

QuestionAnswer.create :question => q14, :answer => a00
QuestionAnswer.create :question => q14, :answer => a01
QuestionAnswer.create :question => q14, :answer => a02
QuestionAnswer.create :question => q14, :answer => a03
QuestionAnswer.create :question => q14, :answer => a04

QuestionAnswer.create :question => q15, :answer => a00
QuestionAnswer.create :question => q15, :answer => a01
QuestionAnswer.create :question => q15, :answer => a02
QuestionAnswer.create :question => q15, :answer => a03
QuestionAnswer.create :question => q15, :answer => a04

QuestionAnswer.create :question => q16, :answer => a00
QuestionAnswer.create :question => q16, :answer => a01
QuestionAnswer.create :question => q16, :answer => a02
QuestionAnswer.create :question => q16, :answer => a03
QuestionAnswer.create :question => q16, :answer => a04

# add in default users
u1 = User.new :email => 'test@test.com',
                 :password => 'test214s',
                 :password_confirmation => 'test214s',
                 :role => 'user',
                 :city => 'dallas',
                 :state => 'tx',
                 :zip_code => '75287',
                 :birthday => '1990-12-12',
                 :gender => 'male'
u1.skip_confirmation!
u1.skip_terms_of_service!
u1.save

u2 = User.new :email => 'admin@test.com',
                 :password => 'admin214s',
                 :password_confirmation => 'admin214s',
                 :role => 'admin',
                 :city => 'dallas',
                 :state => 'tx',
                 :zip_code => '75287',
                 :birthday => '1990-12-12',
                 :gender => 'male'
u2.skip_confirmation!
u2.skip_terms_of_service!
u2.save

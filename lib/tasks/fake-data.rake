namespace :db do
  namespace :development do
    desc "Create records in the development database."
    task :fake_data => :environment do
      require 'faker'

      @location_types = ['bar','restaurant']
      @truefalse = [true, false]
      @question_types = ['choice','number']
      @user_types = ['user','admin']
      @gender_types = ['male','female']
      @answer_values = [1, 2, 3, 4, 5]
      @answer_yn_values = [2, 5]

      def randomDate(params={})
        years_back = params[:year_range] || 5
        latest_year  = params [:year_latest] || 0
        year = (rand * (years_back)).ceil + (Time.now.year - latest_year - years_back)
        month = (rand * 12).ceil
        day = (rand * 31).ceil
        series = [date = Time.local(year, month, day)]
        if params[:series]
          params[:series].each do |some_time_after|
            series << series.last + (rand * some_time_after).ceil
          end
          return series
        end
        date
      end

      # location
      300.times do

        location = Location.new :name => Faker::Company.name,
            :phone => Faker::Number.number(10),
            :location_type => @location_types.sample,
            :website => Faker::Internet.url,
            :address => Faker::Address.street_address,
            :city => Faker::Address.city,
            :state => Faker::Address.state_abbr,
            :zip_code => Faker::Address.zip,
            :open_date => randomDate

        location.save!

      end

      300.times do

        user = User.new :email => Faker::Internet.email,
                      :password => 'fakepass1234',
                      :password_confirmation => 'fakepass1234',
                      :role => @user_types.sample,
                      :city => Faker::Address.city,
                      :state => Faker::Address.state_abbr,
                      :zip_code => Faker::Address.zip,
                      :birthday => randomDate,
                      :gender => @gender_types.sample
        user.skip_confirmation!
        user.skip_terms_of_service!
        user.save!

      end

      300.times do

        questionnaire = Questionnaire.new :user => User.order("RANDOM()").first,
                                          :location => Location.order("RANDOM()").first,
                                          :comment => Faker::Lorem.paragraph
        questionnaire.save

        questions = Question.all
        questions.each do |question|
          if question.title == 'What are you averaging a week?'
            value = Faker::Number.number(2)
          elsif question.title == 'How many hours a week do you work?'
              value = Faker::Number.number(1.5)
          elsif question.title == 'What percentage does the average clientele tip?'
            value = Faker::Number.number(1)
          elsif question.answers.length == 5
            value = @answer_values.sample
          else
            value = @answer_yn_values.sample
          end
          UserAnswer.create :question => question,
                         :questionnaire => questionnaire,
                         :value => value,
                         :location => questionnaire.location
        end

      end

    end
  end
end

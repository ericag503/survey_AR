require 'active_record'
require 'rspec'
require 'pg'
require 'shoulda-matchers'

require 'survey'
require 'question'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['test'])

RSpec.configure do | config |
  config.after(:each) do
    Survey.all.each{|survey| survey.destroy}
    Question.all.each{ |question| question.destroy }
  end
end

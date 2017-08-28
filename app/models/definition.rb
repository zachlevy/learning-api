# == Schema Information
#
# Table name: definitions
#
#  id          :integer          not null, primary key
#  body        :jsonb
#  word        :string
#  definitions :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'open-uri'
require 'json'

class Definition < ApplicationRecord
  after_create :load_api_data

  # oxford dictionary api
  def load_api_data
    language = "en"
    url = "https://od-api.oxforddictionaries.com:443/api/v1/entries/#{language}/#{self.word}"
    response = open(url,
      "app_id" => "2a51a54a",
      "app_key" => "9c373d7870302e60d108a4c892ddf9ee"
    ).read
    # save the response
    self.body = JSON.parse(response)
    puts self.body
    # parse the response
    definitions = []
    begin
      results = self.body["results"]
      lexicalEntries = results[0]["lexicalEntries"]
      lexicalEntries.each do |lexicalEntry|
        lexicalEntry["entries"].each do |entryInstance|
          entryInstance["senses"].each do |sense|
            puts "sense"
            puts sense
            sense["definitions"].each do |defin|
              definitions << "#{defin}"
            end
          end
        end
      end
    end

    self.definitions = definitions

    # save anyway
    self.save
  end
end

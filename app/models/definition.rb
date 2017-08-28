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
      "app_id" => ENV['OXFORD_DICTIONARY_APP_ID'],
      "app_key" => ENV['OXFORD_DICTIONARY_APP_KEY']
    ).read
    # save the response
    self.body = JSON.parse(response)
    puts self.body
    # parse the response
    definitions = []
    # in case we miss
    begin
      results = self.body["results"]
      lexicalEntries = results[0]["lexicalEntries"]
      lexicalEntries.each do |lexicalEntry|
        lexicalEntry["entries"].each do |entryInstance|
          entryInstance["senses"].each do |sense|
            sense["definitions"].each do |definition|
              definitions << "#{definition}"
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

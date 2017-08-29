# == Schema Information
#
# Table name: challenges
#
#  id                :integer          not null, primary key
#  description       :string
#  challenge_type_id :integer
#  body              :jsonb
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'nokogiri'
require 'open-uri'

class Challenge < ApplicationRecord
  belongs_to :challenge_type
  has_many :challenge_responses

  after_create :load_api_data

  # youtube api get captions
  def load_api_data
    if self.challenge_type.name == "youtube_video" && self.body["load_captions"]

      doc = Nokogiri::HTML(open("https://www.youtube.com/api/timedtext?lang=en&v=#{self.body["youtube_id"]}"))

      captions = []

      doc.css('text').each do |caption|
        captions << {
          start: caption.attr("start").to_f,
          duration: caption.attr("dur").to_f,
          end: caption.attr("start").to_f + caption.attr("dur").to_f, # easier math on the front end
          text: Nokogiri::HTML.parse(caption.content).text
        }
      end
      self.body["captions"] = captions
      self.save
    end

  end
end

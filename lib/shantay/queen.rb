require 'faraday'
require 'json'
API_URL = "http://www.nokeynoshade.party/api/queens"

module Shantay
  class Queen
    attr_reader :name, :winner, :miss_congeniality, :quote, :image_url
    def initialize(attributes)
      @name = attributes["name"]
      @winner = attributes["winner"]
      @miss_congeniality = attributes["missCongeniality"]
      @quote = attributes["quote"]
      @image_url = attributes["image_url"]
    end

    def self.find(id)
      response = Faraday.get("#{API_URL}/#{id}")
      attributes = JSON.parse(response.body)
      new(attributes)
    end

    def self.all
      response = Faraday.get("#{API_URL}/all")
      all_queens = JSON.parse(response.body)
      all_queens.map { |queen_attributes| Queen.new(queen_attributes)}
    end

  end
end

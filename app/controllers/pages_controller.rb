class PagesController < ApplicationController

  def home
  end

  def videos
    @videos = Video.find_all
  end

end

class ContentModel
  attr_reader :key, :title

  def self.data
    read_file = ->{ YAML.load_file(Rails.root.join('config/videos.yml')).with_indifferent_access }
    Rails.env.development? ? (@data = read_file.call) : (@data ||= read_file.call)
    @data
  end

  def self.find_all
    data[self.content_key].map do |atts|
      self.new(atts)
    end
  end

  def self.content_key
    self.to_s.tableize
  end

  def initialize(atts={})
    atts.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def key
    [ name, title ].compact.first.downcase.gsub(/ /, '_')
  end

  def link
    @link ||= "##{self.class.content_key}-#{key}"
  end

end

class Video < ContentModel
  attr_reader :title, :url, :date, :duration, :format
end

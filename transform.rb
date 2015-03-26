require 'nokogiri'
require 'byebug'
require 'erb'

doc = Nokogiri::XML(File.open("source/datacite-example-full-v3.1.xml"))

identifiers = []
doc.css('creator nameIdentifier').each do |identifier|
  identifiers << identifier.text
end

erb_file = File.join(File.dirname(__FILE__), 'template/output.xml.erb')
# The variables defined in this script are available as variables in the ERB
# template.
puts ERB.new(File.read(erb_file)).result(binding)

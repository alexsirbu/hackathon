Gem::Specification.new do |s|
  s.name        = 'format_data_converter'
  s.version     = '0.9.1'
  s.date        = '2012-10-28'
  s.summary     = "File Data Converter"
  s.description = "Detects input data(JSON,XML,CSV,Hash,Activerecord) and transforms it in a format chosen by the user (JSON,XML,Hash,CSV,Excel,YAML)"
  s.authors     = ["Catalin,Alex,Seby"]
  s.email       = 'alex.sirbu.best@gmail.com'
  s.files       = ["lib/format_data_converter.rb","lib/format_data_converter/detector.rb","lib/format_data_converter/converter.rb","lib/format_data_converter/hasher.rb","README.rdoc"]
  s.homepage    =
    'http://rubygems.org/gems/format_data_converter'
end

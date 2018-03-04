Gem::Specification.new do |s|
  s.name = 'detectfaces'
  s.version = '0.1.0'
  s.summary = 'Uses OpenCV to detect faces.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/detectfaces.rb', 'lib/haarcascade_frontalface_alt.xml']
  s.add_runtime_dependency('ruby-opencv', '~> 0.0', '>=0.0.18') 
  s.signing_key = '../privatekeys/detectfaces.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/detectfaces'
end

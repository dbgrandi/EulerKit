Pod::Spec.new do |s|
  s.name         = "JKBigInteger"
  s.version      = "0.0.1"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.summary      = "BigInteger"
  s.homepage     = "https://github.com/kirsteins/JKBigInteger"
  s.author             = { "Soto" => "p709723778@126.com" }
  s.source       = { :git => "https://github.com/kirsteins/JKBigInteger.git", :branch => 'master' }
  s.requires_arc = true
  s.description  = "BigInt"

  s.source_files = 'JKBigInteger/**/*.{c,h,m}'
end
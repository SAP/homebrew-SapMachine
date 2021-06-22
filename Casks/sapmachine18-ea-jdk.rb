
cask 'sapmachine18-ea-jdk' do
  version '18,2'
  sha256 'e2e35ce2ee0e2e162c4bd82cde78c47839d6b4150c2c9459e022506408d492db'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jdk-#{version.before_comma}-ea.#{version.after_comma}_macos-x64_bin.dmg"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jdk-#{version.before_comma}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}-ea.jdk"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

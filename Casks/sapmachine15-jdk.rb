
cask 'sapmachine15-jdk' do
  version '15.0.1'
  sha256 'dd95938bdf230c052e13819e6ddfd228001abc4fec3afbd82b007b6fe0df7d23'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jdk-#{version}_osx-x64_bin.dmg"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jdk-#{version}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jdk"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end


cask 'sapmachine11-jdk' do
  version '11.0.10'
  sha256 '9534d6ec89f1dd77615f20f0d3bff7dd4d3f76ba2a4fe2e29431485cd9131dbe'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jdk-#{version}_osx-x64_bin.dmg"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jdk-#{version}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jdk"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

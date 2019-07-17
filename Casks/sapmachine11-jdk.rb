
cask 'sapmachine11-jdk' do
  version '11.0.4'
  sha256 'f9652de02df593ed4d15ff14591548a8d2e84eab8453b594edaeb19d69cc5bd9'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jdk-#{version}_osx-x64_bin.tar.gz"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jdk-#{version}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jdk"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

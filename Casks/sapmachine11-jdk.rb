cask 'sapmachine11-jdk' do
  version '11.0.3'
  sha256 'c051f653e2a14b1e152ff20327200b4907fd8c9fda180ab7f2deb0a6b5242400'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jdk-#{version}_osx-x64_bin.tar.gz"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jdk-#{version}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-11.jdk"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

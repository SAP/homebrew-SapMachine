
cask 'sapmachine11-jdk' do
  version '11.0.14.1'
  sha256 '3593829895f30b96f3022f455de1482d7757a8fac4a2d6fd36b6b7b2f3be0393'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jdk-#{version}_osx-x64_bin.dmg"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jdk-#{version}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jdk"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

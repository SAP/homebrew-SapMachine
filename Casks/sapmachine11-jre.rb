
cask 'sapmachine11-jre' do
  version '11.0.14.1'
  sha256 '2762e3cae9f5a2021fab7358293c0b0cb0a8de0c9c4597e3ae737ded4ce48693'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jre-#{version}_osx-x64_bin.dmg"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jre-#{version}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jre"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

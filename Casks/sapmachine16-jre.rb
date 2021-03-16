
cask 'sapmachine16-jre' do
  version '16'
  sha256 '6544699901a2da6a929bf8751f3523ab6e47d480ad1ee7ce341e7c04b9b5f610'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jre-#{version}_osx-x64_bin.dmg"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jre-#{version}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jre"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end


cask 'sapmachine11-jre' do
  version '11.0.4'
  sha256 '3e0ba7a6f999ac781ee383c1e53749cbd12877cc173d1b380025995020382c0a'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jre-#{version}_osx-x64_bin.tar.gz"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jre-#{version}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jre"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

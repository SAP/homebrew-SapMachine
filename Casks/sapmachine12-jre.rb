cask 'sapmachine12-jre' do
  version '12.0.1'
  sha256 '6d12e108d34a2ece8236d498ead3affcada73b32c1e1957237d9fb8fc419866b'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jre-#{version}_osx-x64_bin.tar.gz"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jre-#{version}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-12.jre"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

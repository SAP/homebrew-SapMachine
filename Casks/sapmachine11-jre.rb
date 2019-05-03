cask 'sapmachine11-jre' do
  version '11.0.3'
  sha256 '63532b2c58d4b599d1f6edf92193572844f8fbe3449b50fad56c7636061f7aa1'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jre-#{version}_osx-x64_bin.tar.gz"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jre-#{version}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-11.jre"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

cask 'sapmachine11-ea-jdk' do
  version '11.0.4,1'
  sha256 '6fc6e31b9b83eefd880b238ad5bbc6bd96f095d3da5584dd7fb0dc8e040e438a'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jdk-#{version.before_comma}-ea.#{version.after_comma}_osx-x64_bin.tar.gz"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jdk-#{version.before_comma}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-11-ea.jdk"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

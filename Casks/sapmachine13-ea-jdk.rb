cask 'sapmachine13-ea-jdk' do
  version '13,19'
  sha256 '034d36bf935cf2db5117a1b2f2db80697e45718bdd1dfff897e173c7b0df57f2'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jdk-#{version.before_comma}-ea.#{version.after_comma}_osx-x64_bin.tar.gz"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jdk-#{version.before_comma}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-13-ea.jdk"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

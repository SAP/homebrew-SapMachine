cask 'sapmachine11-ea-jdk' do
  version '11.0.4,2'
  sha256 'bf6bc12790fca78f7f0085fefbb715e8db3ddfb5236a78e8bfb366f9e8209d1d'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jdk-#{version.before_comma}-ea.#{version.after_comma}_osx-x64_bin.tar.gz"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jdk-#{version.before_comma}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-11-ea.jdk"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

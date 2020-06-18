
cask 'sapmachine16-ea-jdk' do
  version '16,1'
  sha256 'db730f1d65b7877cc0fbb0fb663257163862f80f0dc4bbb5a71005e66ff600c8'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jdk-#{version.before_comma}-ea.#{version.after_comma}_osx-x64_bin.dmg"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jdk-#{version.before_comma}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}-ea.jdk"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

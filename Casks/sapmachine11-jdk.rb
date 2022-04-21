
cask 'sapmachine11-jdk' do
  version '11.0.15'
  sha256 '64bda337540c3aded3edf698921c0ae2c1f4064b932fbde0f2d7e30f8f9f3f5c'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jdk-#{version}_osx-x64_bin.dmg"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jdk-#{version}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jdk"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

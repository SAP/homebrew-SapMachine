
cask 'sapmachine11-jre' do
  version '11.0.11'
  sha256 'c4f864bffa0cfa1321621a6b1321081f21566b0b3035f32cfbd9f9f5b5fe0e43'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jre-#{version}_osx-x64_bin.dmg"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jre-#{version}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jre"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

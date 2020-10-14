
cask 'sapmachine16-ea-jre' do
  version '16,15'
  sha256 'fc8abd03be5e0b3375f3a4c06d9154bd76a653530b1ce5318be88acf4d777097'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jre-#{version.before_comma}-ea.#{version.after_comma}_osx-x64_bin.dmg"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jre-#{version.before_comma}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}-ea.jre"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

cask 'sapmachine11-ea-jre' do
  version '11.0.4,1'
  sha256 'c6db9234f1e548dcbd065fd0b83e00c2fe7708efc1753e9de5c2bac2b4b422c4'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jre-#{version.before_comma}-ea.#{version.after_comma}_osx-x64_bin.tar.gz"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jre-#{version.before_comma}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-11-ea.jre"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

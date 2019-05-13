cask 'sapmachine11-ea-jre' do
  version '11.0.4,2'
  sha256 '6f080c56d9be3b35fc136861f3d15caecbaa3a468a93b23108b443f75c8200d0'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jre-#{version.before_comma}-ea.#{version.after_comma}_osx-x64_bin.tar.gz"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jre-#{version.before_comma}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-11-ea.jre"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

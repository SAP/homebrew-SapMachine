cask 'sapmachine13-ea-jre' do
  version '13,18'
  sha256 'fa4259f417b1fdbf068a6f033edd91370aa5b9c80953e3844c003e4ef11c40b4'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jre-#{version.before_comma}-ea.#{version.after_comma}_osx-x64_bin.tar.gz"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jre-#{version.before_comma}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-13-ea.jre"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

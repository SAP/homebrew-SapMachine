cask 'sapmachine12-ea-jre' do
  version '12,33'
  sha256 'baa9f05594d1530bc85183d618b65d4ef2417df678e5f9bf22292a165d72e694'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jre-#{version.before_comma}-ea.#{version.after_comma}_osx-x64_bin.tar.gz"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jre-#{version.before_comma}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-12-ea.jre"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

cask 'sapmachine13-ea-jre' do
  version '13,19'
  sha256 'd2e3e2b4b4d738e403c3467d9b2348ab732d28bae2e9c6287d28a11476f9f148'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jre-#{version.before_comma}-ea.#{version.after_comma}_osx-x64_bin.tar.gz"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jre-#{version.before_comma}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-13-ea.jre"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

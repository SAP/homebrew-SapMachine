cask 'sapmachine12-ea-jdk' do
  version '12,33'
  sha256 'aa5732bf1de28e5389690222eac41dfef982838d0c2a52f5f39a67b411715a56'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jdk-#{version.before_comma}-ea.#{version.after_comma}_osx-x64_bin.tar.gz"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jdk-#{version.before_comma}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-12-ea.jdk"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

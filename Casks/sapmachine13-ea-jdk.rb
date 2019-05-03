cask 'sapmachine13-ea-jdk' do
  version '13,18'
  sha256 '6d58b5eb84e41567f55acbbd9995c5c574a49834a5022a2d0fa82f521f03254f'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jdk-#{version.before_comma}-ea.#{version.after_comma}_osx-x64_bin.tar.gz"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jdk-#{version.before_comma}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-13-ea.jdk"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

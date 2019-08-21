
cask 'sapmachine14-ea-jdk' do
  version '14,10'
  sha256 '218aee7be5512a48daebb428d1755adec2372f89444e7f1ec1f8937c3d6a2892'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jdk-#{version.before_comma}-ea.#{version.after_comma}_osx-x64_bin.tar.gz"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jdk-#{version.before_comma}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}-ea.jdk"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

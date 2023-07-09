
cask 'sapmachine12-jre' do
  version '12.0.2'
  sha256 '91f62145fa53771a3f3971dcb0ead4837dc534c9c62badc5fff51c7ad42a5a29'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jre-#{version}_osx-x64_bin.tar.gz"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jre-#{version}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jre"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

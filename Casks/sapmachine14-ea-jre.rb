
cask 'sapmachine14-ea-jre' do
  version '14.0.1,1'
  sha256 '7b15886ef4177c9c5f32eb1a1e9a36a8a7d96f9311dde826f87f9a21aa512ba8'

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jre-#{version.before_comma}-ea.#{version.after_comma}_osx-x64_bin.dmg"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jre-#{version.before_comma}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}-ea.jre"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

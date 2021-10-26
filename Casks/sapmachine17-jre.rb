
cask 'sapmachine17-jre' do
  version '17.0.1'

  if Hardware::CPU.intel?
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jre-#{version}_macos-x64_bin.dmg"
    sha256 '1739c62f05a1d9b67d521bd749689711a4fd789ecfe60b997a4c259b6963ea5e'
  else
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jre-#{version}_macos-aarch64_bin.dmg"
    sha256 '1974791da9773c5d96a2ca80c0ebb7d8aa5528b6cd5fc4fe4f5fbb993e8514b6'
  end

  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jre-#{version}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jre"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

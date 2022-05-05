
cask 'sapmachine18-ea-jre' do
  version '18.0.1.1,2'

  if Hardware::CPU.intel?
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jre-#{version.before_comma}-ea.#{version.after_comma}_macos-x64_bin.dmg"
    sha256 'd0fc2471a4028cc2018cffe0a17c646b2e0177d4972bcb81d9cb6857142bb4f7'
  else
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jre-#{version.before_comma}-ea.#{version.after_comma}_macos-aarch64_bin.dmg"
    sha256 '5b6693afd16a021a6f263fb6c63072f9e6d125a258fc1726bab18ac78c050ed1'
  end

  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jre-#{version.before_comma}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}-ea.jre"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

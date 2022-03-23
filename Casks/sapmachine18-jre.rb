
cask 'sapmachine18-jre' do
  version '18'

  if Hardware::CPU.intel?
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jre-#{version}_macos-x64_bin.dmg"
    sha256 'e341f46fbb04aa342549a24d837a255f37dbf4b67627f3ab34a5f90cf1138890'
  else
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jre-#{version}_macos-aarch64_bin.dmg"
    sha256 '3a6bb29f3ecb9683c5cd0214ada97777de7246107b0a4709936aafe956bafb22'
  end

  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jre-#{version}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jre"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

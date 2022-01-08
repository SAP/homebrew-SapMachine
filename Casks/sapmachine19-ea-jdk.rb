
cask 'sapmachine19-ea-jdk' do
  version '19,4'

  if Hardware::CPU.intel?
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jdk-#{version.before_comma}-ea.#{version.after_comma}_macos-x64_bin.dmg"
    sha256 '51caae6e946b3dd1129bbc97dc0deb9711484b65281d7b0e720dcb0614b1ee37'
  else
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jdk-#{version.before_comma}-ea.#{version.after_comma}_macos-aarch64_bin.dmg"
    sha256 'f444c07eb94369ff8d9945b75f72e00d892f806beb8e15b4d2a3c8b46cbeefd6'
  end

  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jdk-#{version.before_comma}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}-ea.jdk"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end

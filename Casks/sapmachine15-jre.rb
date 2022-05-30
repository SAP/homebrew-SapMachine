cask "sapmachine15-jre" do
  version "15.0.2"
  sha256 "61be4d4d557384d4b7221861c920e1b120df830a23c221bf7d1c311d4c9ba438"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jre-#{version}_osx-x64_bin.dmg",
      verified: "https://github.com/SAP/SapMachine"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK build from SAP"
  homepage "https://sapmachine.io/"

  artifact "sapmachine-jre-#{version}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jre"

  uninstall rmdir: "/Library/Java/JavaVirtualMachines"
end

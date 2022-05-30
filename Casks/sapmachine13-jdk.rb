cask "sapmachine13-jdk" do
  version "13.0.2"
  sha256 "12f84ff3f5be670520a404024b2d6eb9eec6bd9197b478bbd0af88faed25b48d"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jdk-#{version}_osx-x64_bin.dmg",
      verified: "https://github.com/SAP/SapMachine"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK build from SAP"
  homepage "https://sapmachine.io/"

  artifact "sapmachine-jdk-#{version}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jdk"

  uninstall rmdir: "/Library/Java/JavaVirtualMachines"
end

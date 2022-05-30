cask "sapmachine16-ea-jdk" do
  version "16.0.2,7"
  sha256 "c486ed86d3b57d605eb1ad36ed13e03df805ff6b0e8009bfb8f13b94308e10b8"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.csv.first}%2B#{version.csv.second}/sapmachine-jdk-#{version.csv.first}-ea.#{version.csv.second}_osx-x64_bin.dmg",
      verified: "https://github.com/SAP/SapMachine"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK build from SAP"
  homepage "https://sapmachine.io/"

  artifact "sapmachine-jdk-#{version.before_comma}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}-ea.jdk"

  uninstall rmdir: "/Library/Java/JavaVirtualMachines"
end

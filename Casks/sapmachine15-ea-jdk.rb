cask "sapmachine15-ea-jdk" do
  version "15.0.2,7"
  sha256 "8e07ded382a0d0a6e36b96ca339b9d1c34442b19605b6998c3604c429c1f5635"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.csv.first}%2B#{version.csv.second}/sapmachine-jdk-#{version.csv.first}-ea.#{version.csv.second}_osx-x64_bin.dmg",
      verified: "https://github.com/SAP/SapMachine"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK build from SAP"
  homepage "https://sapmachine.io/"

  artifact "sapmachine-jdk-#{version.before_comma}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}-ea.jdk"

  uninstall rmdir: "/Library/Java/JavaVirtualMachines"
end

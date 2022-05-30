cask "sapmachine13-ea-jdk" do
  version "13.0.2,8"
  sha256 "aa56b511b0dc70bfd2334035a9bf68e02401325dda5d84a938ee51560dbab7ee"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.csv.first}%2B#{version.csv.second}/sapmachine-jdk-#{version.csv.first}-ea.#{version.csv.second}_osx-x64_bin.dmg",
      verified: "https://github.com/SAP/SapMachine"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK build from SAP"
  homepage "https://sapmachine.io/"

  artifact "sapmachine-jdk-#{version.before_comma}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}-ea.jdk"

  uninstall rmdir: "/Library/Java/JavaVirtualMachines"
end

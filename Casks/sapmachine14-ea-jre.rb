cask "sapmachine14-ea-jre" do
  version "14.0.2,12"
  sha256 "4b6472b00a69bf4cf48a66b601165e24ab241dbad8757599a9d6940352023e91"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.csv.first}%2B#{version.csv.second}/sapmachine-jre-#{version.csv.first}-ea.#{version.csv.second}_osx-x64_bin.dmg",
      verified: "https://github.com/SAP/SapMachine"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK build from SAP"
  homepage "https://sapmachine.io/"

  artifact "sapmachine-jre-#{version.before_comma}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}-ea.jre"

  uninstall rmdir: "/Library/Java/JavaVirtualMachines"
end

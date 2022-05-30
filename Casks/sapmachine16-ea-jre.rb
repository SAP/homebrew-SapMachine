cask "sapmachine16-ea-jre" do
  version "16.0.2,7"
  sha256 "c231cdf03657678907c0902b8f2c454cb9f3365703bb23659589cb6c1145a12b"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.csv.first}%2B#{version.csv.second}/sapmachine-jre-#{version.csv.first}-ea.#{version.csv.second}_osx-x64_bin.dmg",
      verified: "https://github.com/SAP/SapMachine"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK build from SAP"
  homepage "https://sapmachine.io/"

  artifact "sapmachine-jre-#{version.before_comma}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}-ea.jre"

  uninstall rmdir: "/Library/Java/JavaVirtualMachines"
end

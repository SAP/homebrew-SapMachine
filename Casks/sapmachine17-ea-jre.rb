cask "sapmachine17-ea-jre" do
  version "17.0.13,8"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "b4d7fa55cf463e3fc62cbf4993c122d4a4077fe2696ad6fcd7bcd7e679b104f4",
         intel: "9f98e962ee77796b8fce11e835fe82bf0c71bc869e8c99bb5c76273daf9a808a"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jre-#{version.before_comma}-ea.#{version.after_comma}_macos-#{arch}_bin.dmg",
      verified: "github.com/SAP/SapMachine/"

  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK distribution from SAP"
  homepage "https://sapmachine.io/"

  # Check for latest version in SapMachine release data.
  livecheck do
    url "https://sap.github.io/SapMachine/assets/data/sapmachine-releases-latest.json"
    regex(/["']tag["']:\s*["']sapmachine[._-]v?(\d+(?:\.\d+)*)["']/i)
  end

  artifact "sapmachine-jre-#{version.before_comma}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}-ea.jre"
end

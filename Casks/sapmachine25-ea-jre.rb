cask "sapmachine25-ea-jre" do
  version "25,17"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "bb28d33f0dea808383ed51f3fe23cd8c0369a4a7b9f7fe416747b2dbc2177b4d",
         intel: "fbb4e32f920abc250edc59d1033e10c12a11bee8b8e9a61ad9d10fdd5b7e13ba"

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

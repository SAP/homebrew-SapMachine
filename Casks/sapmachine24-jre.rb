cask "sapmachine24-jre" do
  version "24.0.1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "abeb7d06e5aa5789d3f294846d2eb213ce76f4b5b96727b225e5c7162a0c0bc1",
         intel: "c29677f15b116a9b434228b0dabef8b40a52624fefb3aa4edd57b434623dc197"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jre-#{version}_macos-#{arch}_bin.dmg",
      verified: "github.com/SAP/SapMachine/"

  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK distribution from SAP"
  homepage "https://sapmachine.io/"

  # Check for latest version in SapMachine release data.
  livecheck do
    url "https://sap.github.io/SapMachine/assets/data/sapmachine-releases-latest.json"
    regex(/["']tag["']:\s*["']sapmachine[._-]v?(\d+(?:\.\d+)*)["']/i)
  end

  artifact "sapmachine-jre-#{version}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jre"
end

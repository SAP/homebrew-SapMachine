cask "sapmachine17-jre" do
  version "17.0.18"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "3059c8e54bd2ed4e7cec01c6be6d39804d6706a6b6c7082d36ef956171f4f4e5",
         intel: "7d42ad47cf17bdbc7f01bf3f5c8cf9a362a5ecc8472bf57ff7e0c2e507836b99"

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

cask "sapmachine17-jdk" do
  version "17.0.12"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "fa0a64846f882a7bdb036ecb93f994b32a7c4478c17b2be621133bb16c39b410",
         intel: "d5edf197d4f6ee8152d02d4f2c29b64504b6e292a57026b044c4ebef5dfef4ba"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jdk-#{version}_macos-#{arch}_bin.dmg",
      verified: "github.com/SAP/SapMachine/"

  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK distribution from SAP"
  homepage "https://sapmachine.io/"

  # Check for latest version in SapMachine release data.
  livecheck do
    url "https://sap.github.io/SapMachine/assets/data/sapmachine-releases-latest.json"
    regex(/["']tag["']:\s*["']sapmachine[._-]v?(\d+(?:\.\d+)*)["']/i)
  end

  artifact "sapmachine-jdk-#{version}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jdk"
end

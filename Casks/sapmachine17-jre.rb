cask "sapmachine17-jre" do
  version "17.0.17"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "ac8ed0a037a18fa0c39c5091b0a17396562e9d137179abd129473780f49fdd7a",
         intel: "a51d11258d9eb64c74132e9ed3c4a64833959d5d6cad3440bbfcb3d68c9ee37d"

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

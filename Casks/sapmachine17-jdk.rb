cask "sapmachine17-jdk" do
  version "17.0.11"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "fddd0f702a3fc6db4dec0567a56a72235cca4c396ef36d7d2e4fa34a943d78a0",
         intel: "44877f028d7ccf31b53d3e22e5fd45c66f8ea38434bd6f37a0c279da9b717c67"

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

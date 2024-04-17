cask "sapmachine22-jdk" do
  version "22.0.1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "79fef7b42f3b9e30752930684cc3691e5959bc1ed194978894f89d6364066522",
         intel: "f73313885216e9a0612524a0b5294632887b5b5cfb1121a5c315e78a0bcc8832"

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

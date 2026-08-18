cask "sapmachine17-jdk" do
  version "17.0.20.1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "697d1f6069ef8e446e6ac7829ebf570b8b0d4996b14c0ec949c1d9c658b4ca9d",
         intel: "67611a88096295df10c344f425e6d93b7995ba1d4d42de9035d19c5a1a15187f"

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

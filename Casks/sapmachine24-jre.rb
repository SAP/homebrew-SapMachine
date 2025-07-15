cask "sapmachine24-jre" do
  version "24.0.2"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "f0eb552d0fd03441eb1c587c337002af666fb0fcbf25d7eff4c534805ec76571",
         intel: "00bdb1cb59781b290303d758d84a14c29f41c8f7ab3e343c9b38058071027321"

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

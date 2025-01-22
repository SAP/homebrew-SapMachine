cask "sapmachine23-jre" do
  version "23.0.2"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "336c9c2fa06abe010f41102dc4ed720fae5d916fde0ff6ce1eaed69f30ed9928",
         intel: "b8f0b6dd13639fe0abbc51d4d1ac848bc76eebd46bb7e317a96f45600aa82759"

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

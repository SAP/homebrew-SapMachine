cask "sapmachine21-jdk" do
  version "21.0.12"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "cf5b274e73495bc453fc85d354c58d6604b0b37745d61490a0d2cf2260307906",
         intel: "c38e49d12cd275ad970c2ffe1da39eb1013378b9f10e48ec646661cd81f22e35"

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

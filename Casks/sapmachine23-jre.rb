cask "sapmachine23-jre" do
  version "23.0.1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "ea08a3779bf12aa9b9c6eaa0711067a7ee1193c2a1a315c7dfb74cbc33b80552",
         intel: "e4a3cd6abbd6b02abe93305b1704917b26148244eb0db0f7b2902d69b28a9619"

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

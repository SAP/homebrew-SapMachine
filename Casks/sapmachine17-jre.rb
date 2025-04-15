cask "sapmachine17-jre" do
  version "17.0.15"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "523b152430716ad4924c41aca2ded28ef933619d496f0189a4f0835bfd4af348",
         intel: "ba0faa0139bd62cf94903afa0b21ca7ea5d8de6d1609e9e77bd2e52e474365fa"

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

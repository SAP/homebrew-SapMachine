cask "sapmachine21-jre" do
  version "21.0.6"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "79769fd3653ae488c0483290fdefd6e56d8be6fccc28e55139cb3bb959d810e6",
         intel: "25bf83ab92d96597ed4d3119fcb065c7cfe63b55a147cd04bc5c83a8beec9f5b"

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

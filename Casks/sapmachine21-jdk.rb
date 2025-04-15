cask "sapmachine21-jdk" do
  version "21.0.7"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "7099f606f1182cbb4c957a24299810af5db6a2456f8eb21d738e0e56c0f2928a",
         intel: "b2d743deeb62144ce5d4f8d00d3cd657885c33465f14c457d950ffa3aeb11db2"

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

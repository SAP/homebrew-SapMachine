cask "sapmachine17-jdk" do
  version "17.0.15"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "c008dc5f1e98f0863f43da4713c951829529d85a2b13ec5b2d67779c9411de78",
         intel: "4a2342c30d2bb290021ddf30ce8e4a4449f0281b825ed17f70ca0062f6812d1e"

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

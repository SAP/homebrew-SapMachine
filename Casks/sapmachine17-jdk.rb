cask "sapmachine17-jdk" do
  version "17.0.17"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "14942e31dbebbf846580af2a5063b3c42491a3c031ebabc252b90fd96a4abe2d",
         intel: "5824ebe8d995ae0040463a338d4c3702fb801aed3d36d2f0d9d3e9caf91431bb"

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

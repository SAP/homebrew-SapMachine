cask "sapmachine21-jdk" do
  version "21.0.13.1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "504c494780f16c1ac716134be093d5cacbbd3a2107b864bafc01d965dc502fe8",
         intel: "a373d138977deaa21f2296e122492650968a28e952172dcb78ad6d4956d2e6f1"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jdk-#{version}_macos-#{arch}_bin.dmg"

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

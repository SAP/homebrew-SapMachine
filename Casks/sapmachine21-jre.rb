cask "sapmachine21-jre" do
  version "21.0.10.0.1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "6943a2bd2b6516184d3bc8480172f9479c3d312a40141ac39fcdde8e72a170e0",
         intel: "5563552255fb68bfcf0c8cb291e121709e5521e8a466d675c3384498b1765a63"

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

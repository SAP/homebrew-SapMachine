cask "sapmachine17-jre" do
  version "17.0.20.1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "195b7f56a11969fa72f8633e848a5b77af7a85d6fe089459d6e404416ca7bbc6",
         intel: "f2b56b904023816eb722c7883a0769c37b94d000fa1735ac29f24f49060c39e4"

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

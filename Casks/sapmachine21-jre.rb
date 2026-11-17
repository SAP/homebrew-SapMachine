cask "sapmachine21-jre" do
  version "21.0.13.1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "71ec718956237ed94586b89cd86aeee2657ab35edb6fe1100e66256f82ed3565",
         intel: "c9c780eebde2dc71c6e388140719806d81b2c73d784b72f2846c59f23318ecbd"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jre-#{version}_macos-#{arch}_bin.dmg"

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

cask "sapmachine11-jre" do
  version "11.0.25"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "575aa400e90836cef2dd16539e2e7785283103bb44f03b8cf2a52f5a1a667a81",
         intel: "06a490a5bcb4595611f9eaad2cdc37a7f65e1ef6ac8cad80e74c99c923e2ea7d"

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

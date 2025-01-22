cask "sapmachine17-jdk" do
  version "17.0.14"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "f9daeb6d3fc0357e132984a01363d7c38cf4502b17c981e2c03ce8999e8d1f45",
         intel: "b7fdfdb74f5f53768a5db0423724d1472ab3da4792d2bec1b6a61baab8baa7b4"

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

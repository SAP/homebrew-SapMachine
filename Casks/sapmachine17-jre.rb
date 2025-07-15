cask "sapmachine17-jre" do
  version "17.0.16"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "6ae2d7868ecb7aec5536829a8c7dfc98c153db5fe36a44ba15bb6a16b6f03207",
         intel: "cefb486a44a4c1e34c6e9b747a28cf4c1d8abf1d11ccdf5470a13be0c36d2c1f"

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

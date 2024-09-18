cask "sapmachine23-jre" do
  version "23"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "0b0a1d33c062f040e260e33c8e71d795f89a5b5e0088897ac0a79a61a911c2d8",
         intel: "85e4bad2a8b2f4c15d3e58723dd49cd1aeb72d3179f57b0690b22d76dbfae7ef"

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

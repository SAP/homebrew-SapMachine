cask "sapmachine11-jre" do
  version "11.0.23"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "791dab744700751da759a20e9059109d30341fd1ae715e252b9fa7683e8adf32",
         intel: "126c34f20b9264757b5567a7067173d69aafbc2aab59c2c0ba2b4d5859f684ad"

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

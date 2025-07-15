cask "sapmachine17-jdk" do
  version "17.0.16"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "2b3478b143421075ccd8a6480f16853b19be7273e301bb0c3aea76668435ba42",
         intel: "8bc429797b3dc4982b435c5eeafa3024c49c1240ad98f5c6bdd084f5305cff3e"

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

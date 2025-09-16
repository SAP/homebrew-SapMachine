cask "sapmachine25-jre" do
  version "25"
  sha256 "c0c69ffb7838ec46ce2b4f7bf88598087731ddce692ec426d02ca13e881cc37d"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jre-#{version}_macos-aarch64_bin.dmg",
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

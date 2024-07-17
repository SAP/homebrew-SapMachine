cask "sapmachine11-jre" do
  version "11.0.24"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "c685eb2461889008cce969c2cd8ac72fac0852f5068ff69abe5da1f08baf834a",
         intel: "c9642fd78860aad84b343cde73db07b7f54f6975d5b6afb5aa56082fa9b7f3ed"

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

cask "sapmachine21-jre" do
  version "21.0.7"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "721cecb77795d8720f2ab7af893725e67faf9792e687aa1a34286dcfc0ceb599",
         intel: "c3faf3d87f999d606fe06d838059e6439eb14e756b6523337ce6741100f8bd59"

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

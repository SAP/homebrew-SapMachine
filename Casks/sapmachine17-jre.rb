cask "sapmachine17-jre" do
  version "17.0.10"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "23d50cb52368eddcdd38553460e11e60e6e885d88a3842a2ed484634136bb073",
         intel: "f615f5dcefc43b517b2c5bcd2041ed94c5fdb7f13b57a43040933f8b391b94a1"

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

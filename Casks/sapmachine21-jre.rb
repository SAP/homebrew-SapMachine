cask "sapmachine21-jre" do
  version "21.0.10"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "ca6f35d3de038b96a98fd0d57f6066c7ce827d1c8fb945897bf7fde0a63c89d1",
         intel: "dd6040def8ceae4a044e2359bea28ecbcf6dab7196d6bd0c33e0b18180f7cdd0"

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

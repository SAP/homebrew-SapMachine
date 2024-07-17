cask "sapmachine22-jre" do
  version "22.0.2"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "6c3ed5ea85acdefd4df89c11b9c83d1aca0fa55b06827a032207b00ba403b67c",
         intel: "6603ca2a526e69467e52f697141be764c08f9772ec1863705011e05dfbcb14f3"

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

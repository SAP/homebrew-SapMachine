cask "sapmachine21-jdk" do
  version "21.0.8"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "fbd0bb30c3d16a7526d212fdad0a5488aca13abd00250111635e477d2aa82fac",
         intel: "8a390f1c3614725d849af7587ef7fb084860d7badf78c5d686628f0c47ad527d"

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

cask "sapmachine17-jre" do
  version "17.0.20"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "75561f602730b0b3053798d840353a66c45273a4637c45e8e7d11796ac9b623d",
         intel: "77d5002f15a44ecd4bc8bb3f7a112397702e55dfe4d484364587f2ca416b0c4d"

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

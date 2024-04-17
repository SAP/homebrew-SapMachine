cask "sapmachine17-jre" do
  version "17.0.11"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "ab887671d8a76bbc1f6e006adf74f4e64c792f9ed64318355bd9392e0b077daf",
         intel: "831cb3dd2f5534e85c9d36f4ec096d4ac0f484de11b39105b9bb9d83fdffd5f5"

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

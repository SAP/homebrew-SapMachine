cask "sapmachine21-jre" do
  version "21.0.11"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "832446066da0be0406755c0d6b6e06885b706b77f5b5ed4f20a48e7e3808f264",
         intel: "a1eb80b8bbe8107eccfa62366331187b53c2844432c98cafd2fff018ec5d09df"

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

cask "sapmachine22-jre" do
  version "22.0.1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "183700317f81a20ef5171b3011a979d3796b996c4233c10cdb6cd04c94eaeb57",
         intel: "cb1f157517d0e1a87875f4529d321bc8f7e0750eb95f860b97493899a21b7888"

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

cask "sapmachine21-ea-jre" do
  version "21.0.12,7"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "d10efb02ead0c7f839dc94ccb8e35b3ca2ab3fa0b009a91403904f6faeda40f9",
         intel: "666080c158f811b4a8e7527f8901c551f15d7eea5bb838c51bc2ac1fc0dcfd9e"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jre-#{version.before_comma}-ea.#{version.after_comma}_macos-#{arch}_bin.dmg",
      verified: "github.com/SAP/SapMachine/"

  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK distribution from SAP"
  homepage "https://sapmachine.io/"

  # Check for latest version in SapMachine release data.
  livecheck do
    url "https://sap.github.io/SapMachine/assets/data/sapmachine-releases-latest.json"
    regex(/["']tag["']:\s*["']sapmachine[._-]v?(\d+(?:\.\d+)*)["']/i)
  end

  artifact "sapmachine-jre-#{version.before_comma}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}-ea.jre"
end

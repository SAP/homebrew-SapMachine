cask "sapmachine17-ea-jdk" do
  version "17.0.17,1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "c3f25b655715f8934e391da73a3cac099f259410087a7fb8985bdd61cd04b331",
         intel: "6d07691864bb5baa8feb39c87534ff5f88fea8420c811c193b4d3b326e738aef"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jdk-#{version.before_comma}-ea.#{version.after_comma}_macos-#{arch}_bin.dmg",
      verified: "github.com/SAP/SapMachine/"

  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK distribution from SAP"
  homepage "https://sapmachine.io/"

  # Check for latest version in SapMachine release data.
  livecheck do
    url "https://sap.github.io/SapMachine/assets/data/sapmachine-releases-latest.json"
    regex(/["']tag["']:\s*["']sapmachine[._-]v?(\d+(?:\.\d+)*)["']/i)
  end

  artifact "sapmachine-jdk-#{version.before_comma}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}-ea.jdk"
end

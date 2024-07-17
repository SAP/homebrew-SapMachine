cask "sapmachine17-jre" do
  version "17.0.12"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "cf893e90d0d7e6ee6fa995db4ea7dc871776d7f1ad1b2f82b2db52831ca74c92",
         intel: "e23f11806ebd6418414f25a2820052d7f37dfcf6a2e21a2768980a7b364d36b3"

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

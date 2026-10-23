cask "sapmachine21-jre" do
  version "21.0.13.0.2"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "9d7a86c1809c9f06203cff1ab40e17ad6cf0db80eb53d64fcc45888cd9bb2096",
         intel: "6470d1f7594cb6f4792c9623f7c4bf9533863eed2ffe9e032ac23f4053554408"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jre-#{version}_macos-#{arch}_bin.dmg"

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

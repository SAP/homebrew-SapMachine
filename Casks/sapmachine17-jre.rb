cask "sapmachine17-jre" do
  version "17.0.13"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "0bc761fa680fb1dc3fb436eeff230860a6d5fe4abdedfbd03573fd9d8c7d9d72",
         intel: "8e52fb25ee74286f15e6bda8eb3ecb6274af19b90b09f5c8b9488592f8a4d964"

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

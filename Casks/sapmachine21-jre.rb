cask "sapmachine21-jre" do
  version "21.0.13.0.3"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "1f2ca0dcaf85ae9b5e429357c587fc25bc29d2e1a61096132ebcc11ef8a8c492",
         intel: "145c5563c8ab37c09952761361a59cffafd787e9c881476c8b9001f1f312d993"

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

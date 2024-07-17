cask "sapmachine21-jre" do
  version "21.0.4"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "16e3695ebd4f8b5a4e636c85768b3f2917c4c7384c109d3510993ce8043f05b0",
         intel: "ea49d76b80f14247c14097225b4944fc2ac213099c2cb643d8bea1ea181789dd"

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

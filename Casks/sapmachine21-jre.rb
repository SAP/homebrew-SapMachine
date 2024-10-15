cask "sapmachine21-jre" do
  version "21.0.5"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "3ff71543f394ce3ccd22b56d86df84743e302447c5ef4d079f9edd9fb0e7dd8a",
         intel: "b642f63057cec9e2a822628b1343885da24e2c40febb8fa77080d9109d76b631"

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

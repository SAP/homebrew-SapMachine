cask "sapmachine21-ea-jre" do
  version "21.0.3,6"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "ac2e45ceaaf151b3f92bb1fc4d818307dcdae029d89a9ea72f5f0d26e1ab7a3e",
         intel: "b505dda94cd01f5e000bb48984e30c9d25bcf564b7e7d30e41c82bcff92ee6bd"

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

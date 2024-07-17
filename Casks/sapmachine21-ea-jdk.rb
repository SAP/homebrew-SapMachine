cask "sapmachine21-ea-jdk" do
  version "21.0.4,7"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "8aa7018aa9964c578107dc40c86f1e1104c195d34b19cc1489beff118b0827ad",
         intel: "5cbd2c215bd48c94f1f95da7b1fe8b1c9da9e460a0c6c6dac7f3bcf3eb7ac306"

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

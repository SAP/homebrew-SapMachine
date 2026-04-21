cask "sapmachine17-jdk" do
  version "17.0.19"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "9888d6a427121f305093c1bdb7790c6b6c583461205d5abb78e32d4facf27b00",
         intel: "b3865c4fef0df9712d8f16bec8cff19f63f698a3934524d7dc0dc6e6d3a0a7c6"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jdk-#{version}_macos-#{arch}_bin.dmg",
      verified: "github.com/SAP/SapMachine/"

  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK distribution from SAP"
  homepage "https://sapmachine.io/"

  # Check for latest version in SapMachine release data.
  livecheck do
    url "https://sap.github.io/SapMachine/assets/data/sapmachine-releases-latest.json"
    regex(/["']tag["']:\s*["']sapmachine[._-]v?(\d+(?:\.\d+)*)["']/i)
  end

  artifact "sapmachine-jdk-#{version}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jdk"
end

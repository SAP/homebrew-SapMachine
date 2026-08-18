cask "sapmachine21-jdk" do
  version "21.0.12.1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "dc5cf08ac2a04e5c40c984d519dc24243eed8d62a3c7e27965a07d57522bbfab",
         intel: "cfb866ae0e16fa5325db2b5253e25ad928364fa4969b65f425d0f4f8569443aa"

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

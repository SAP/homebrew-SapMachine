cask "sapmachine21-jdk" do
  version "21.0.9"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "5d7ebd5d80b4cec4d02ecafb7ddb10a99237755ab42be22b848e964dcc33ac77",
         intel: "2e54b5d0a76cc24c8a7c5fcdcc5dec1c1937a1a372be7a8d6ddd135b35b7a3c3"

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

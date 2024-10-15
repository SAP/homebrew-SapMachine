cask "sapmachine17-jdk" do
  version "17.0.13"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "b4365b1b7cd6c6fca713c986d3762059164cd8a07e7a2c7900bbedf497fe6418",
         intel: "726bd0781c539144df266ad7208e5efc2dfb324f1ddddf0c29a6d44d08741d2c"

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

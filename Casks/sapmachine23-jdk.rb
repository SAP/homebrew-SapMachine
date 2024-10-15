cask "sapmachine23-jdk" do
  version "23.0.1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "2901ff85a1bf7a317a785acbd246a77d4cef1d0fb9c6914119319cf251d200bb",
         intel: "00c523153e3e9c115c6f2205b771a8d7da17132d92a3cf29b414cf5f16844077"

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

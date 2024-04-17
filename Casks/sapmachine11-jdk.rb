cask "sapmachine11-jdk" do
  version "11.0.23"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "2b4a5f56f0b2591694a1491d2bab2cc9ec91adf04fcde396a88f64c3032486d8",
         intel: "6a83157e9eb7752213e1371f9b36cd548438c5127e2d1eaa61f5f2ddc7f81d11"

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

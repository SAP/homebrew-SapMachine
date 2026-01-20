cask "sapmachine17-jdk" do
  version "17.0.18"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "009333fad7dc639e5d3f7f716b93586239be0b78ba66b49e35e6cada8d22da5a",
         intel: "8a3af62ddc7b7e1f661de1957679d06810a1ffdc7abc31bccfa168ec4d89ba08"

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

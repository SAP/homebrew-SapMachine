cask "sapmachine11-jdk" do
  version "11.0.25"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "92fe9521df812597c57017d0393c23d13198ea3b3139c83af3c36e336e210fcf",
         intel: "b339b3e5db110411ad4813ac0e6578c3040e429a157cb264a13ae825d527e8be"

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

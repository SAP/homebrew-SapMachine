cask "sapmachine24-jdk" do
  version "24.0.1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "54369f1ec902aa276c2461844783288ed538ab13869bcf02f113e0577cb22515",
         intel: "e34ea8916cecff0dfc034e8bae73107e76c3c32a1ef770bf9eaec0d9a7ee5a7b"

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

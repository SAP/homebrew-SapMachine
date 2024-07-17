cask "sapmachine11-jre" do
  version "11.0.24"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "572eacb2b25aa811d1c2892983e90f8a4ce59d7c47751dfd932b0d9cdd98f3b8",
         intel: "3cf2807f4d75ec79d37c7e3de3862f7f93f950049ed6a9548da44b71b14e1d01"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jre-#{version}_macos-#{arch}_bin.dmg",
      verified: "github.com/SAP/SapMachine/"

  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK distribution from SAP"
  homepage "https://sapmachine.io/"

  # Check for latest version in SapMachine release data.
  livecheck do
    url "https://sap.github.io/SapMachine/assets/data/sapmachine-releases-latest.json"
    regex(/["']tag["']:\s*["']sapmachine[._-]v?(\d+(?:\.\d+)*)["']/i)
  end

  artifact "sapmachine-jre-#{version}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jre"
end

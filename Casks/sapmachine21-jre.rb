cask "sapmachine21-jre" do
  version "21.0.12.1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "e208fddd8fe6415eee0287a4052e280fc76007c1f5ffcad91ad85b46c3869a13",
         intel: "7cf70dcd92a1773768849412e0d1a7ece4d727b6e77e4a7e3d58eaaacec51147"

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

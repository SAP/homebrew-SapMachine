cask "sapmachine21-jdk" do
  version "21.0.6"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "026f15b5e316e98a49e37df81b8fac74729b5844f18d1b07547b714d5a08805e",
         intel: "66d39a050b119d3a7a10e3b014fc8adc6919bfee65b6f03215069726e4390b19"

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

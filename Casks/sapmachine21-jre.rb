cask "sapmachine21-jre" do
  version "21.0.2"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "ce059f4b66affc81f053d81873c9313b08e5e9006fb9dfcc66e23bcfd2a6ae19",
         intel: "824431d9d9ba6453c3e85aa2692e117d3f9fad198abcc77a4a0eb06b59b789af"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jre-#{version}_macos-#{arch}_bin.dmg",
      verified: "github.com/SAP/SapMachine/"

  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK distribution from SAP"
  homepage "https://sapmachine.io/"

  # The version information on the homepage is rendered client-side from the
  # following JSON file, so we have to check it instead.
  livecheck do
    url "https://sap.github.io/SapMachine/assets/data/sapmachine_releases.json"
    regex(/["']tag["']:\s*["']sapmachine[._-]v?(\d+(?:\.\d+)*)["']/i)
  end

  artifact "sapmachine-jre-#{version}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jre"
end

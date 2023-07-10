cask "sapmachine17-jre" do
  version "17.0.7"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "922b7f7ef71331653e7555f3ff584922b8faef45341cd1c4eab2509e1b4491c7",
         intel: "26c1229df73e08369590ee07d74428791f02b7ea04e78dbe502b5e3d4e62a6c8"

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

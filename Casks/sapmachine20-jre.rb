cask "sapmachine20-jre" do
  version "20.0.1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "2eec57e1919cc135b1d3020443a091e706476c562d2632e8964b21af3304d1e4",
         intel: "47bf70c3f553c1b1d674e023f7967646cd09565b4f649a6ad2756c3831c193ca"

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

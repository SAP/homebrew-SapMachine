cask "sapmachine11-jdk" do
  version "11.0.20.1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "28b287ac3a137d55968c9e318909442e75adc26c6ed8d64074a5fabdc1340ace",
         intel: "df8def51297f40d7bc63e64a9f49808d6a281316ef1e78e214f06dbf4c67cb50"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jdk-#{version}_macos-#{arch}_bin.dmg",
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

  artifact "sapmachine-jdk-#{version}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jdk"
end

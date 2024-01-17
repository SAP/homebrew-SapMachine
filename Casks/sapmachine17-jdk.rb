cask "sapmachine17-jdk" do
  version "17.0.10"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "8849d4cdd83447050dc48ffc32374a1611fa3d2b345ff4f5f0bf57b18a7e0897",
         intel: "d28da6a312a09f72a0aab45cbecd479c1c00ab8da35dfbc1baa1849acd8bbb68"

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

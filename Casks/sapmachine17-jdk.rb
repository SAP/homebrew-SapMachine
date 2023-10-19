cask "sapmachine17-jdk" do
  version "17.0.9"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "6b2e16189ce41fa48cd237e942d58b7dbbb86c2f361271573510b45f3f286ffc",
         intel: "0d8e3ba48615fce3893cb4caf056edc75399469ac96c1d2764b8ed8f308707c8"

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

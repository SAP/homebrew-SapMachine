cask "sapmachine17-jdk" do
  version "17.0.7"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "ecaf8a1c2fe8fe2df00cba36c7c87678b9bf46d8428cffc66f7a1aa6b2c44883",
         intel: "3edf63f35a55ef6f906adab1985e2e85a2c3de13672970837428df1d29793128"

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

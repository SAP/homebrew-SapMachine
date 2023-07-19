cask "sapmachine17-jdk" do
  version "17.0.8"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "5096bd71f73d426180a6fdedbc0b79e3b6c07ab8608f0b371e3e8b21247f53b9",
         intel: "4082bf0a4c9d9f3661fc6beea53150973fbe78efbc550104cba9bf883dcbd42c"

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

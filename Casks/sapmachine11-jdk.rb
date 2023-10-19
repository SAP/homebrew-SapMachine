cask "sapmachine11-jdk" do
  version "11.0.21"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "90fcd8d3594aab06d7f33f4663e35f49a2e8ba08f85c99819aebeb13bfb7a7c9",
         intel: "b173e28aaf46abbcb9fe717365f1112b3b547f24b26232f610ad0c6a170bebd2"

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

cask "sapmachine11-jre" do
  version "11.0.21"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "c7f716930c31ede4a52ace2eea9011732b0b2529a2b13be7f681368808667251",
         intel: "81c6b42d6f6ea499785cce60a4eb383cbf5eac9da484d64ebe4e2e0a81c6c200"

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

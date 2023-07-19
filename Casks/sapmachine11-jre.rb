cask "sapmachine11-jre" do
  version "11.0.20"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "1e82c71fb4a18e7d077f9a32e2a851f2609dcaa9d820f045cf20bd7d2a4e9379",
         intel: "c29b02c44216920c390d560b2961ef94815ccee8c53181079555c9d980e68ef4"

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

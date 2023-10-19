cask "sapmachine21-jre" do
  version "21.0.1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "a337a9028831cdf6cdbf3ae9bc2685c7120155e0772b03e33f8e4dde8937368f",
         intel: "9e43d0035675c8639b6fbeb37a3c800f4dfeb26c9c7a2bbb3be0be21d4219464"

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

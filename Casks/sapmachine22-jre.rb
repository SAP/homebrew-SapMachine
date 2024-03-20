cask "sapmachine22-jre" do
  version "22"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "2826d2e25fec7737509fdc7c5465c5fbb8f4c54f5fca83454f2b272eeb5a5736",
         intel: "66d351c9cd0a7960c5be527ad8d4123910875501fecf6f7187ae9631188cced1"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jre-#{version}_macos-#{arch}_bin.dmg",
      verified: "github.com/SAP/SapMachine/"

  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK distribution from SAP"
  homepage "https://sapmachine.io/"

  # Check for latest version in SapMachine release data.
  livecheck do
    url "https://sap.github.io/SapMachine/assets/data/sapmachine-releases-latest.json"
    regex(/["']tag["']:\s*["']sapmachine[._-]v?(\d+(?:\.\d+)*)["']/i)
  end

  artifact "sapmachine-jre-#{version}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jre"
end

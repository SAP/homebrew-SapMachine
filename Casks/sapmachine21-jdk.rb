cask "sapmachine21-jdk" do
  version "21.0.11"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "aa88ff58384f9181bef01f633039436fe0f2e8c1d3fbc9674e2397625ac423ae",
         intel: "645529c46dcefad86f2addaed50c06a4476dd2c821447439d47488ea64de699d"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jdk-#{version}_macos-#{arch}_bin.dmg",
      verified: "github.com/SAP/SapMachine/"

  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK distribution from SAP"
  homepage "https://sapmachine.io/"

  # Check for latest version in SapMachine release data.
  livecheck do
    url "https://sap.github.io/SapMachine/assets/data/sapmachine-releases-latest.json"
    regex(/["']tag["']:\s*["']sapmachine[._-]v?(\d+(?:\.\d+)*)["']/i)
  end

  artifact "sapmachine-jdk-#{version}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jdk"
end

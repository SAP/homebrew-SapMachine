cask "sapmachine21-ea-jre" do
  version "21.0.11,6"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "0c1d21653a0d4f9c66b568f4fa13055f4037b9150242bf30dc6c92e3fa79cd9a",
         intel: "dc2ca4c3e0cf04078d046ad8c2e8bf57429ad82a2937a9851529f392daecf574"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jre-#{version.before_comma}-ea.#{version.after_comma}_macos-#{arch}_bin.dmg",
      verified: "github.com/SAP/SapMachine/"

  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK distribution from SAP"
  homepage "https://sapmachine.io/"

  # Check for latest version in SapMachine release data.
  livecheck do
    url "https://sap.github.io/SapMachine/assets/data/sapmachine-releases-latest.json"
    regex(/["']tag["']:\s*["']sapmachine[._-]v?(\d+(?:\.\d+)*)["']/i)
  end

  artifact "sapmachine-jre-#{version.before_comma}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}-ea.jre"
end

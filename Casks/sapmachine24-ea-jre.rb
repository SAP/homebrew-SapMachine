cask "sapmachine24-ea-jre" do
  version "24,6"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "01900ef7b92d9ca6e431cf01e6b7e670d9b7ff205a28d7cab3978884c1372ea2",
         intel: "a3d5c372a8301c9a689e9ddbb2a8f1c0ce41ca2cb6287b34add23a29c36aa10a"

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

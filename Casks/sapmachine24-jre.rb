cask "sapmachine24-jre" do
  version "24"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "d41256dbec6a43ff73ade2e167f02baa325e0b136715eb635e4d114e7f760325",
         intel: "bd4c04fd6a0dd7cc6c8ee2c71d8fa46291b5a41f8a1596240d921c9452c62805"

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

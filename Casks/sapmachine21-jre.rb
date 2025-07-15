cask "sapmachine21-jre" do
  version "21.0.8"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "daed13d2024aa7446fb8dc891518e6bde1488aabe7728d2302ceae76b5235ef3",
         intel: "feaf93a16e608d1e237e5dfd19b7255a30c0b0f0acfc5666164ba175b143efa5"

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

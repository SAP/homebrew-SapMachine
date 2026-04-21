cask "sapmachine17-jre" do
  version "17.0.19"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "097b493a8df6a0ccace78249008e18c9ba5948593419672204a3feb31c1ab3ff",
         intel: "0bbc819b19038da561772a385fcf2aefd707491557e3b0b86f9f567c64ea30c6"

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

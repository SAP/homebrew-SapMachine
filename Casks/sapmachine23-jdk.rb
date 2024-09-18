cask "sapmachine23-jdk" do
  version "23"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "5776c2f9af88c17dfeaffb706ae8d8747e945009a3c3df50021800dd57d271b8",
         intel: "130eff5d69d631be94b0f81829f9fee0e8f592e37c5d62878a147486c2a4bf39"

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

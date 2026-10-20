cask "sapmachine21-jdk" do
  version "21.0.13"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "0f9452ab6f7725723a80c673309f5a33ec491c34528d34777d231585012e14a1",
         intel: "a31237e21d269dd80c9fd5779ccf8ae2549e05f56f6008b47e2282846b4772e5"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jdk-#{version}_macos-#{arch}_bin.dmg"

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

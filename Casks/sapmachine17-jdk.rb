cask "sapmachine17-jdk" do
  version "17.0.20"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "9a322fc5fc4b3cff142664df090b7252d638bc4cf62d14b16dd2400899e4ba66",
         intel: "0f356ad1cd5fac21d697621015f1b019a76cb97aa22686ab518157c895bfb3cc"

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

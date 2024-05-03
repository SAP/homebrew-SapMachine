cask "sapmachine22-ea-jdk" do
  version "22.0.2,1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "f8e261203c31d4f73b8b09436c7ea58058d8f629d8a10a3a7374fe1f36f9b4b1",
         intel: "7f3a09bdeca99641ebf2ef9b98b7056d9e834e68a5d49bfed5e2808a030748a1"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jdk-#{version.before_comma}-ea.#{version.after_comma}_macos-#{arch}_bin.dmg",
      verified: "github.com/SAP/SapMachine/"

  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK distribution from SAP"
  homepage "https://sapmachine.io/"

  # Check for latest version in SapMachine release data.
  livecheck do
    url "https://sap.github.io/SapMachine/assets/data/sapmachine-releases-latest.json"
    regex(/["']tag["']:\s*["']sapmachine[._-]v?(\d+(?:\.\d+)*)["']/i)
  end

  artifact "sapmachine-jdk-#{version.before_comma}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}-ea.jdk"
end

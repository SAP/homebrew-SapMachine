cask "sapmachine25-ea-jre" do
  version "25,1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "653d23d0aa77cbf20ce5613f2c26d5f3f8392717c5f75fee8a78478b4c659fc4",
         intel: "d3b9fb249e51c3cc2b13ddff8aeb43359f9c60fb9400dae3590ede3a4a6de0fc"

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

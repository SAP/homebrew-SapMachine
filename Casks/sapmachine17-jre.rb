cask "sapmachine17-jre" do
  version "17.0.14"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "adf9a26dbef4d230b106ea3bbc728e0db3c5a6986418fe3d336220eeb0c56eaf",
         intel: "a00bdd112b10f0789d8a4860a1bf164305c816fb5c59fb09f5a4197d9f663b4a"

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

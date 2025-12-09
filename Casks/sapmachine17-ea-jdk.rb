cask "sapmachine17-ea-jdk" do
  version "17.0.18,5"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "1d114747c9fc88fffc4055dbcd9e1c090bbaca5c2b26fe4ccf95d95f5dd7652c",
         intel: "c0f1d9c8b41baf910e33630bbebbb0cab4d6dfc4cb8a82ed21f34dc57e660479"

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

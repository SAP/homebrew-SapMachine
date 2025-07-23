cask "sapmachine25-ea-jdk" do
  version "25,32"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "fb8ab8cdf0f0ae3fc508aa2f84b9af7d3911b9e954e1cbd53c520baf75f09477",
         intel: "5d5b33d2d7dfd66bd5b9645cae6b140152c3e3bb7bd9745c3788e163089ec6ab"

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

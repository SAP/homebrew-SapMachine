cask "sapmachine17-ea-jdk" do
  version "17.0.17,10"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "9e7dd47650dba65866c64757ce66f6321acdcefc89aa404bdbaba64aebe5db5f",
         intel: "f61b4f05b3c73aa9a8ec605dc0897a7f738ba76ea0ad1010d7d9d5f3647b7bbd"

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

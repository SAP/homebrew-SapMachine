cask "sapmachine24-ea-jdk" do
  version "24,30"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "64dd4f1afeec338cf2a3e1bbf332d6ef823d787e463f1590c370a5a9f95a0f62",
         intel: "97e2ef4af97326a2e47ac0cddb6a7ede88cdc8a6f0d9638df3469daf3e3ee3f0"

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

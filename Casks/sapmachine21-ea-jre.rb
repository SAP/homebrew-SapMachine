cask "sapmachine21-ea-jre" do
  version "21.0.10,7"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "b542cb8d9a71eb1ba62ec5c4f567baee7a4e679bfd170a944db575fc0adbee83",
         intel: "31f6d0eb22e3bdcb2d755b3445fbe66ed56d07a8d6f2c65b2dd18719d1cdb6f8"

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

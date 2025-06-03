cask "sapmachine21-ea-jre" do
  version "21.0.8,5"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "5a6cc1c451bdbbaf77f8e24ac76fcd6238a7f5a7e9cbdcc6fb2339d679ac9d25",
         intel: "a152f55706fac4e351f77adcef2b3172abfe91516b00d960b8aa975f3b811cbe"

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

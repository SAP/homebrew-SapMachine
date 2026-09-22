cask "sapmachine21-ea-jre" do
  version "21.0.13,7"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "39de844972e02bcb22a9191b8b2022fc81fdfedad57d587fa6ef05e0185e0cd8",
         intel: "c3ef879ca028ddb30b643396e34a9ee3cc00a7225e030e00d9ff9f2e58d13336"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jre-#{version.before_comma}-ea.#{version.after_comma}_macos-#{arch}_bin.dmg"

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

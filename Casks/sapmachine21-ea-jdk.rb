cask "sapmachine21-ea-jdk" do
  version "21.0.4,1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "a6f76d3ec1a224ecaa335898cf04e97a7d5ffd74e8753560aba77193dfabc7cf",
         intel: "b8309b297069d8cf148dba4faf5be5b4f89d74cc6758e0fbbd7c369a78a2fa84"

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

cask "sapmachine21-ea-jdk" do
  version "21.0.11,1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "640265add486e40feecae53960285a1e30da1c42b1e44fc1663d03eeffd9e2ad",
         intel: "3656d54fb5adb301a780c533ee4a38598d981515881ff72f22f87d2a3dd89906"

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

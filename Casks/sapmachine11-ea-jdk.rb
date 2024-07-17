cask "sapmachine11-ea-jdk" do
  version "11.0.24,8"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "b4c00ee4c8968047bb1c9a4469804a4da345f84bc4c34b29027f75f2ae0efe66",
         intel: "f618cb27e5ac8e7ee2a3c8974433d1f80d014a53c729dee59b11b1f5ea5dce5c"

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

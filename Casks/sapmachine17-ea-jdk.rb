cask "sapmachine17-ea-jdk" do
  version "17.0.19,2"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "292947a097767586bab2dac988e1b4294efe5f653e8fb1053cb0438b5e5adf84",
         intel: "461dba8011d57b69e8f9f6fe337157f3a3a484cfcbf2443a029c471642959e60"

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

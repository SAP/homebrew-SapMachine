cask "sapmachine21-ea-jdk" do
  version "21.0.13,8"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "c57722dd7d2a66b46f567febb8e704b4a30c16d8d4ea4eab4bf8f93dbfd7e791",
         intel: "f8b5243d45d0a3931b4247616df28e1cd319e75c49a601f031309cbcfc17fb08"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jdk-#{version.before_comma}-ea.#{version.after_comma}_macos-#{arch}_bin.dmg"

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

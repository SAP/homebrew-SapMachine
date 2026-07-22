cask "sapmachine17-ea-jdk" do
  version "17.0.20,8"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "f8972dab0ae6ed9953c0e83e8bc569f3997c500f7e6fa4f1d4530fbfbe92e81c",
         intel: "63dd64ce75e9e0ff99403d7f8be88f124e20e142dfe6fcc7c61d0b7f33127caa"

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

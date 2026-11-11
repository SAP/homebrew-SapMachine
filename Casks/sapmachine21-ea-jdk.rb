cask "sapmachine21-ea-jdk" do
  version "21.0.14,1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "78c93c2b7ffc4208f52ee4a43c3cbfdb8b143677ef5342a8ec556b6857451f43",
         intel: "349b72c7cd91493c0a0edafadceb5b8120ad9306e532ab24a6e4b68620f0f7f3"

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

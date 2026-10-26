cask "sapmachine21-jdk" do
  version "21.0.13.0.3"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "506a41810674dfca6c7c282db3f05b7c173d6de0057205e91fb1e3a0f7feaf05",
         intel: "9ef08ea0962d11f4978438c47a4578897aca4cdb9f47bd5dde7c111237dab8ac"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jdk-#{version}_macos-#{arch}_bin.dmg"

  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK distribution from SAP"
  homepage "https://sapmachine.io/"

  # Check for latest version in SapMachine release data.
  livecheck do
    url "https://sap.github.io/SapMachine/assets/data/sapmachine-releases-latest.json"
    regex(/["']tag["']:\s*["']sapmachine[._-]v?(\d+(?:\.\d+)*)["']/i)
  end

  artifact "sapmachine-jdk-#{version}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jdk"
end

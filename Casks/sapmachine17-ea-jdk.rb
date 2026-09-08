cask "sapmachine17-ea-jdk" do
  version "17.0.21,5"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "29ab548ce0077edf025d761436df8483c89c3b5a123e012c25a79fd5b46b1d8d",
         intel: "96fc5dcf39565a9aa599334d8203825e0a4be5dc1d5f78036d245c41aad92c2f"

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

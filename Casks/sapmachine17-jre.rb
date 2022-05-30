cask "sapmachine17-jre" do
  version "17.0.3.0.1"

  if Hardware::CPU.intel?
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jre-#{version}_macos-x64_bin.dmg",
        verified: "https://github.com/SAP/SapMachine"
    sha256 "fdf88e534d1f151b1f30c15471a1a064e9f7f373dfff435420fd1dec5f015861"
  else
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jre-#{version}_macos-aarch64_bin.dmg",
        verified: "https://github.com/SAP/SapMachine"
    sha256 "db05fef84a8e7d69dd791c2866d122cccb89349e1ff79da8e5eab6f513f72c08"
  end

  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK build from SAP"
  homepage "https://sapmachine.io/"

  artifact "sapmachine-jre-#{version}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jre"

  uninstall rmdir: "/Library/Java/JavaVirtualMachines"
end


cask "sapmachine11-jdk" do
  version "11.0.16.1"

  if Hardware::CPU.intel?
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jdk-#{version}_macos-x64_bin.dmg",
         verified: "https://github.com/SAP/SapMachine"
    sha256 "d23ec9f13f323b0510387fcad9916eeccca394889eb2e648669668bd0663a68b"
  else
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jdk-#{version}_macos-aarch64_bin.dmg",
         verified: "https://github.com/SAP/SapMachine"
    sha256 "0503a8f13a7b31dc1070cf2ab4bb660d9476c740051e6609f5871f8fa28c822e"
  end

  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK build from SAP"
  homepage "https://sapmachine.io/"

  artifact "sapmachine-jdk-#{version}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jdk"

  uninstall rmdir: "/Library/Java/JavaVirtualMachines"
end

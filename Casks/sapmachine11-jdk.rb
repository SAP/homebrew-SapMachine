
cask "sapmachine11-jdk" do
  version "11.0.18"

  if Hardware::CPU.intel?
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jdk-#{version}_macos-x64_bin.dmg",
         verified: "https://github.com/SAP/SapMachine"
    sha256 "c1aaae74d2079467a80f2b463550da8cc4cc6165059b0d372e55595d85472973"
  else
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jdk-#{version}_macos-aarch64_bin.dmg",
         verified: "https://github.com/SAP/SapMachine"
    sha256 "5aedb555e51952e1fe6b2253b58f8caa2928d94ba661168d9f6e68ffc512bfc7"
  end

  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK build from SAP"
  homepage "https://sapmachine.io/"

  artifact "sapmachine-jdk-#{version}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jdk"

  uninstall rmdir: "/Library/Java/JavaVirtualMachines"
end

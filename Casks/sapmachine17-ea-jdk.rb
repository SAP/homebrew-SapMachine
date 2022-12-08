
cask "sapmachine17-ea-jdk" do
  version "17.0.6,5"

  if Hardware::CPU.intel?
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jdk-#{version.before_comma}-ea.#{version.after_comma}_macos-x64_bin.dmg",
         verified: "https://github.com/SAP/SapMachine"
    sha256 "0bb566e5a41f410fae8de7d3cf20227707d84ba034df5d03a5f1e377877a2e45"
  else
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jdk-#{version.before_comma}-ea.#{version.after_comma}_macos-aarch64_bin.dmg",
         verified: "https://github.com/SAP/SapMachine"
    sha256 "380d0ba3a40b9dd4a657b073f47ef94627a90136b6e6dea3b618ac42fffd9ed2"
  end

  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK build from SAP"
  homepage "https://sapmachine.io/"

  artifact "sapmachine-jdk-#{version.before_comma}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}-ea.jdk"

  uninstall rmdir: "/Library/Java/JavaVirtualMachines"
end

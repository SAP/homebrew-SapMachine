cask "sapmachine11-ea-jdk" do
  version "11.0.16,4"

  if Hardware::CPU.intel?
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jdk-#{version.before_comma}-ea.#{version.after_comma}_macos-x64_bin.dmg",
        verified: "https://github.com/SAP/SapMachine"
    sha256 "c6354897bde429172a60e2e5455baef4804ce92fd37a1a791ced9dba5d06b8d1"
  else
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jdk-#{version.before_comma}-ea.#{version.after_comma}_macos-aarch64_bin.dmg",
        verified: "https://github.com/SAP/SapMachine"
    sha256 "624f5ebefbb471aef395eeaf7ead75cc17f9a8859c9666d5e83aa7a83af7449c"
  end

  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK build from SAP"
  homepage "https://sapmachine.io/"

  artifact "sapmachine-jdk-#{version.before_comma}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}-ea.jdk"

  uninstall rmdir: "/Library/Java/JavaVirtualMachines"
end

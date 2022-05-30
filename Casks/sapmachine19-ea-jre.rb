cask "sapmachine19-ea-jre" do
  version "19,24"

  if Hardware::CPU.intel?
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jre-#{version.before_comma}-ea.#{version.after_comma}_macos-x64_bin.dmg",
        verified: "https://github.com/SAP/SapMachine"
    sha256 "d89ddee8d0cf101a0daa6a620c97aa845b84b0ea645eb79ff20bdcbed7903096"
  else
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jre-#{version.before_comma}-ea.#{version.after_comma}_macos-aarch64_bin.dmg",
        verified: "https://github.com/SAP/SapMachine"
    sha256 "a435763a6410c26de9967a2300109b59ee60d38052d2117a14af336793431fd3"
  end

  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK build from SAP"
  homepage "https://sapmachine.io/"

  artifact "sapmachine-jre-#{version.before_comma}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}-ea.jre"

  uninstall rmdir: "/Library/Java/JavaVirtualMachines"
end

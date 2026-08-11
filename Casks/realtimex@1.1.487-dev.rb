cask "realtimex@1.1.487-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.487-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "14148fa2f90d7a1cf8281aacafccdec359f16b62c1f8de8e7bcd9e7014051a5c",
         intel: "a1e888111c4121bef3c042f4c26738c1b1189ffc7cc17f83344ef1cf27406d55"

  # Use the #{arch} variable in your URL
  url "https://github.com/therealtimex/realtimex/releases/download/v#{version}/RealTimeX.AI-#{version}#{arch}.dmg"

  name "RealTimeX"
  desc "Find powerful AI Agents for RealTimeX"
  homepage "https://realtimex.ai/"

  app "RealTimeX.AI.app"

  preflight do
    system_command "/usr/bin/osascript",
                   args: ["-e", 'tell application "RealTimeX.AI" to quit']
  end

  caveats <<~EOS
    RealTimeX.AI will be placed in Applications.
  EOS
end

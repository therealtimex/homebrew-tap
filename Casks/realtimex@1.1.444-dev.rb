cask "realtimex@1.1.444-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.444-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "1a51d75c19e5e5bb8f4b22fdc6040ebc0217003677ace63cccd54b9856a19a3c",
         intel: "66960b59eeeb39c3b2ef62b5b2b5b42db2676d1df382a5d2eabca7d7bfee15ba"

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

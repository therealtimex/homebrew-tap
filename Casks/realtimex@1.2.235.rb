cask "realtimex@1.2.235" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.235"

  # Provide both SHA256 hashes
  sha256 arm:   "9ac8f3bd833acf9e69f552ff4e23fe994d5d35abe9cf10bceab6bbd6244e3ff5",
         intel: "68106057ca48371732538d3f938c24ce634bfd4a094036c106c8dadddf84a695"

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

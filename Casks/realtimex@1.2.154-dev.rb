cask "realtimex@1.2.154-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.154-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c38c39e0d5b1f16baaf0320588fa5f7114c0a244fae55910fe5a63a421af71d8",
         intel: "7cc459dccf9b5b838b96aa8171cc1d0ad80a437ca2cf08b4f52b9edbdf768a60"

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

cask "realtimex@1.1.553-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.553-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "85bd1d29e4bf9963066359c33db9ba185e05deca71347c4f6913ae50e370f68b",
         intel: "26da48f381c70835c419d6b5a8a7902c78feb1f82da950c86c4a67fd157917ab"

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

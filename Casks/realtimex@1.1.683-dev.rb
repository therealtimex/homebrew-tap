cask "realtimex@1.1.683-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.683-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c18d48920b9012766dbb66756b2c2199f9cf236edb8d1a47d2ac9ea88d704adf",
         intel: "c52a2cb8c9bab628ecd2a07d5c5ad66ef43e1ee8e48280f115e490f4b2d4dcc2"

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

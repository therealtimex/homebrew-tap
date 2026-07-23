cask "realtimex@1.1.341-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.341-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7c16594eb4000a78bbeaf37e7b3a6287129fbd78eba411073f3a6cad4e8c9fda",
         intel: "e7210d72a655ea53f631b03c64b0510362f713da5e412299a2c027d292730952"

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

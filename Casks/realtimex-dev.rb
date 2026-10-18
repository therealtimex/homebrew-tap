cask "realtimex-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.63-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2daf77215f77a12aab22a091ece0d3db2b7cec6eed5e77ce12444db3ab0d9547",
         intel: "c1c873244c5a181bda3ab6ea6c28df33aa7abad9766db7fcda0da4bef4d37bf8"

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

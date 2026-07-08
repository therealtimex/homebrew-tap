cask "realtimex@1.1.208-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.208-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c265e1a41587c253ff5fff69d60b5df899cdc8c43584c9afb9d8c32f4ab6ffa7",
         intel: "1e37e5d4219c0056b09934e8ae792963867f627fe550a3339acb80bad014660b"

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

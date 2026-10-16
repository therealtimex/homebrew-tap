cask "realtimex@1.2.45-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.45-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "4cfef98257b1ae022d7eb3bdf86a1f517878d2551452159863a44a44651327be",
         intel: "a07f5aa718f356136ba4cabd5ee18f55befc7d5c2a4e25a6dd96fa7d90810784"

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

cask "realtimex@1.1.368-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.368-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "5171c6533261ed559c929d32df165e34366ddaead9697ab68e5ef6e570068dd7",
         intel: "cd8ab2639a5d73f7679df9543826fd7868a083f5b7077f17daf8c182a4f19022"

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

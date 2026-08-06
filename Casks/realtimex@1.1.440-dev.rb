cask "realtimex@1.1.440-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.440-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "6bd40141292658a588f39cd3b2cfb5c0703d034174de4138e2e3f80842c089fe",
         intel: "b4b660183a17f29a970926ed8fe5d6075b177599534dfa3a38e35ef6e81925c9"

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

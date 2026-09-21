cask "realtimex@1.1.639-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.639-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "3cdffecd9eb7ff893ba1f59c50304c80bbe9ee83eba007ed71ada4b1f11500df",
         intel: "1500225cb5405555f99a03df4439c198f7ffb8293433697bdd1881c142d33775"

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

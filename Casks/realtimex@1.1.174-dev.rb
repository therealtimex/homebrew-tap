cask "realtimex@1.1.174-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.174-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "4a331bdc128a2de2d2776211f4d5bcaa937100bf86704d588b4ddd7085c8a84b",
         intel: "3fc0fcd6e37e293c07dab5c13db3368a2c08f8188d7d893c72041b0556938162"

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

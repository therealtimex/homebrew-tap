cask "realtimex@1.1.288-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.288-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b799339031c52d4c7801c0fb49e9571562d247e8e603b9ca3b48aa889ac59f51",
         intel: "a3b34c98ebfd1f877339e6f60ce94f26173e491ebdd99cdd5225916116da07f3"

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

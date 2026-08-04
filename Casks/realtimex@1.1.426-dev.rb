cask "realtimex@1.1.426-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.426-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c1d222aecbd3626398bf89eba03a69c9b818cc50bc77747ee33c0a52b07d4d3b",
         intel: "06f982c796ba9af7a3540b16ef3e7b0e065175e7bca1785b005b49b5e2b134b4"

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

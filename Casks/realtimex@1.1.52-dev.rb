cask "realtimex@1.1.52-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.52-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "cfe29732f2cb553c742ed1d3a67682aeb0cd1d83205a7e2eae5654c133acc2bc",
         intel: "37b255a8850dfa5dff7d239684ed7892e817d840cc93c88ee443583eaccdd08f"

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

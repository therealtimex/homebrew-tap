cask "realtimex@1.1.582-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.582-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "83ab3432c51d3a15c85bd33b75133d5366e7c32c1749a1da6ea14f353cc46b17",
         intel: "393639abdecda179d623d475c5f69be805cc8cde9a812e61833e60e3c3c6001d"

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

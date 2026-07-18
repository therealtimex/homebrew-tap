cask "realtimex@1.1.285-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.285-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c43dac24350a470b01f6a2b7bfb83d0e5f9f597c165bbff61a5120a1e77db0f3",
         intel: "ade8d5ff24709abdb382064d107d3e2e0bba2ca6e71d963afbd46de990b5255e"

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

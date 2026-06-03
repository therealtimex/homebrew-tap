cask "realtimex@1.1.37-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.37-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "124ae341d67460c536843bca1f1e1484221ea1745c3a9d3f817ffef37491cc92",
         intel: "692e5639f4835741110ee707a2264d1ed1b1069e362382d84a70b003dabb4d10"

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

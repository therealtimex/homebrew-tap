cask "realtimex@1.2.121-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.121-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b3801df5bc64c6f5d3ffc3b51304501e53031d1309fd697d557396fb1ca31011",
         intel: "8c5f12e5978f0ae9edd9aca65320d8d0941226437e2309f05573b5fe30c33ada"

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

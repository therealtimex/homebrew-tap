cask "realtimex@1.1.593-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.593-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f6d74e55221a4ca2bf59771e585274ccacfb9630badeff8e2b8f8d61ce5cb1f0",
         intel: "69f5451d9d7d4d26dff6547334295135fd82864ee5d721dfc8c677f9a90f0ab6"

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

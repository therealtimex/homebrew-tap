cask "realtimex@1.1.315-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.315-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "8e2f8559ac4d503717337a0cff1fbbcacbdb6f542d95985367fd3ed42034c36f",
         intel: "843445d068adc5247580dc5f2d06e1213b4ef8ac7f975f3235e75a4f134dce64"

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

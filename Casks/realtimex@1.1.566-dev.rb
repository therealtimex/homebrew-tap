cask "realtimex@1.1.566-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.566-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "df39cab15e0b850db97e0e82adc550dc6f637246b920798be7dfeff841dca61d",
         intel: "2cd0ba7819f6e67cb787e257e7ecbf95bcc86d26949f77587e101ee92f155b2f"

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

cask "realtimex@1.2.273-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.273-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "78885db969b5013ac42f519a52df891c6920edb8dc9130cc16902efd9a748eef",
         intel: "9a3dccd9f4f4b4ed11f992f23f3d7c29497d684ed6bb05d49c5282d75f78496e"

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

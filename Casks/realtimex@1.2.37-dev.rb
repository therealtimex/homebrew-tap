cask "realtimex@1.2.37-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.37-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e77a4bcab46ddd61211c25c16c92c0f242a35a59db220357c464604b48b9e620",
         intel: "8626e26be8801c468c8e5a68e6d2aafd1428c03476eb109c4aa54a354d1b1bb8"

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

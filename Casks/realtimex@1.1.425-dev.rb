cask "realtimex@1.1.425-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.425-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9e5a7a91abe7b69d0f52f87484779da960304a68158daa67d7d2e7ce5c371b90",
         intel: "60a35ddbbe0d290231ca9881fbd31d41b0ec7c15d4d5f5ab13233e3bbe617c11"

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

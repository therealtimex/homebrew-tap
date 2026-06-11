cask "realtimex@1.1.78-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.78-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "563d71d321b1224e8f4cc8e594c8abbb8affc53b9b4a9d424a35190aa63f2e1a",
         intel: "58aae985fbbd68891559edbfd837d94238c15c6cea12339ab7ec4b666fe0680c"

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

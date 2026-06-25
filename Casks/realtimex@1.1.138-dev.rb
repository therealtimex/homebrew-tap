cask "realtimex@1.1.138-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.138-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "4dc7df42185ca857c087f028f0fdb595bc82c7781d6834b3180c17bb61b40716",
         intel: "f4c42dbdc1c9b86b085d26da7962209a4b4f5d89b83c2851ca627c86e004d81b"

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

cask "realtimex@1.1.589-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.589-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2379c89ada2ece565ac93386e563f99c9f2443596b7bcb813322936db73beda0",
         intel: "047a96f7aff22fed00d47427e8538a256bd89366d80fbba52b0c36db3b6344d1"

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

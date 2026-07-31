cask "realtimex@1.1.403-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.403-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "492b3bc9d6c252bd4ea3be8fed1d449ea5286874171102c74cf0c94ce8ca0e45",
         intel: "2c6a51fea597d1ea492203813f29848fa45d2be1864ae962b39fea451d8a7e89"

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

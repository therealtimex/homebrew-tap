cask "realtimex@1.2.7-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.7-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f06e29ead846fa0f340094cc6d2ecb5878556b97547a8796dcd7d5baf62974d9",
         intel: "e1b0da374520853ddacec5550d5c8a186a4286e59e324c039baba28e9f0f7de6"

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

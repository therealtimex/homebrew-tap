cask "realtimex@1.1.366-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.366-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b709df25acdf2317cfd395d805b24dc0f6650d767500d71e5bb58bb4a19c839e",
         intel: "747626a42d685fb5cc99a7b6fbb8fc528a79019e30ad25e4395edfc0d5514981"

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

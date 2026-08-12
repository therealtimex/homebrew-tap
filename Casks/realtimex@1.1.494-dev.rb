cask "realtimex@1.1.494-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.494-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "51f849782cb1db8a9fa3c8ba3acd4304067a2da9dc4fbe3bb10e0c1f797c6a66",
         intel: "2d512689a6180b444aa480bd7839e604d0fd39664e9edbacc03a51a847d2687d"

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

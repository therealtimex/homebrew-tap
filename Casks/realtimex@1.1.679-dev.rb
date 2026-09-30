cask "realtimex@1.1.679-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.679-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "6198e52aba67bd899556a4a1df12231951d7872a340212923c7e7e885210b80c",
         intel: "cd28e3d504b52484b0d0528a5af10638c467a28cd8e01f7ea9256a5878121b10"

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

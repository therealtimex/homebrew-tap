cask "realtimex@1.2.79-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.79-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "863fe0966cebdf86b51f8b35c89ba05208f25b2fa912e1fca6d51ff10ba52756",
         intel: "35e137280976f9a825ab1eb5c6effdc4dbe8783b849005d15439183a530879d9"

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

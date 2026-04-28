cask "realtimex@1.0.156-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.156-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "19f93d7ab355e7cb61daa651dd0a4f73fb84a1c0a5746cadd4f68fd3e3602019",
         intel: "c7d578e918c0625b4f4d3c6f3b0b2487a9e21dbc1eee24ced5dbab2b9b0da081"

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

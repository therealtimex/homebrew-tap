cask "realtimex@1.0.209-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.209-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0fc3e6c5dffe847d4c02aa02baf98467ae284830ffe278336f052a8764556687",
         intel: "ba2849bcc5e70993c776f9da0391cc6a0442963412deafd80d5d6e8b06d8737b"

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

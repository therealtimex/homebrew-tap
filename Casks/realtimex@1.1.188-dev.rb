cask "realtimex@1.1.188-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.188-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "fa4a0eac609ef6cb331cf6706713aa2f2f65c4f59533a9bab2eb83270365a87e",
         intel: "759e2139a72a452d5697a9e9ee4a7bd9cda5090cf1867e6bf2b2dbd63f70e7e9"

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

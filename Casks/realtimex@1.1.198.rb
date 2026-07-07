cask "realtimex@1.1.198" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.198"

  # Provide both SHA256 hashes
  sha256 arm:   "91ae01b0774b04efd1a81dd6fd313eac863d8c8b91dc538e92f1daac375f5521",
         intel: "043bfad6f67f1ec95e15d83c11dbd157725a4caefc2122b149c8ca4b6cfd49ad"

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

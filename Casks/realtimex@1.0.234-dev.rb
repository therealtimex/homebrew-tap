cask "realtimex@1.0.234-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.234-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a254a759d55210a8edf4e319a469b4dce6f263185caeb15a142e3035df47cf77",
         intel: "16b7ecfdf6fcbe5205dbbc92ad937de5454f815a7562a3d9cb6a423f10a7387c"

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

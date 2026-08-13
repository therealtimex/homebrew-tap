cask "realtimex@1.1.502-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.502-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "afb229588d210dab9c3ca67229662d5c38c8fcdffbf445048b4e82d1e1cbd0ce",
         intel: "d10ba6e9f58d01f870ae413264a0a3642d06b5e20a714a032b0d84bd13b899c6"

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

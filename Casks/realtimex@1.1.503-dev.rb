cask "realtimex@1.1.503-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.503-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "fafaadaf1b02f9aaff9f2f26c8738a48094a88c996053aeeedd0e1f9f3dbc0ba",
         intel: "7420b8c9d92209014acfc6807e90ac404e0f94d59a802912420601c3163c6fd3"

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

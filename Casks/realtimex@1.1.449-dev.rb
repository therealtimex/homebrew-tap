cask "realtimex@1.1.449-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.449-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f1f553c67c8767ab480384f2668d648a39c9cca22325f4d5d94f67efd16ad56f",
         intel: "80ceb274b3e04ec0d7b8f32c15c5b0a9c1992cfa8042b42fd856767cac602a33"

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

cask "realtimex@1.0.173-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.173-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a9b18408c23e7759332d1a14f679e9685bf386f8cfbfffc4f50e5e8691eddf8f",
         intel: "b45e671de27d0b1268d13337ea6f86d495c3602f22f3db69fb0adc8a99a1cb63"

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

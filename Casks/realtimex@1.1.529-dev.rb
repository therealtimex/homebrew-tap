cask "realtimex@1.1.529-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.529-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c57b8c16dc3659bc7c118ceb7e39c27abe9968cd510600845074d65f98e6cf94",
         intel: "0ed05241b287703e192114856327b77716b376960b217baaf87289c60adc7ff0"

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

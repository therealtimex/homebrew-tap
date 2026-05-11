cask "realtimex@1.0.198-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.198-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "450395b81687de43279439532ab070cf584d7da8a3299a0426c731e7af709857",
         intel: "9519d7fc7a282005de05a5f3fdf4c69addc664eb6f22a65c24f4e811652ba7e9"

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

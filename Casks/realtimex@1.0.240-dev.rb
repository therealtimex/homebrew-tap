cask "realtimex@1.0.240-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.240-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "bd179fddd670812f28cedecbaf3673d6ebf73a6b7f49d5faffa0f92dac9c9fc6",
         intel: "c9203f3f533f55aedb013bb43146e8256448d1543385ce66069e94bfc478de9c"

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

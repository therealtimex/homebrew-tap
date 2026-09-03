cask "realtimex@1.1.572-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.572-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a984d56f1f0665870cfa344006c969a6e5dd86eb0fcd924a4241ca1a9db32b63",
         intel: "b0d6feee4b545540734aa4d0710d2208035ce2c177a2d25599947b2c23a65aea"

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

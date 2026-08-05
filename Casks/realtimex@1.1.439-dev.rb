cask "realtimex@1.1.439-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.439-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "5b2ae4885a3596e469fd964611bf5408adc320af0ba2bcc7817eb690ec7d89a3",
         intel: "78b8e0b64b3ef24130073987407b56b2442b59823b0638e1f1c57afd4b744ff0"

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

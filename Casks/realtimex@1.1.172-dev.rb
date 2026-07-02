cask "realtimex@1.1.172-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.172-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7cf073c497600005c16664e55b1860a896bf16fae3c6c1de3bff01e0caf04fac",
         intel: "72da59a261380c1cbc8675e13b920e2910110bc02e74c265374d34b8214313e7"

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

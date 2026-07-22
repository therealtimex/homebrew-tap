cask "realtimex@1.1.329-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.329-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ec6059e46e3726c4d324109e1f08cb5a96dea0274a35ef2bc0cdac9db225c8a9",
         intel: "d2708f667765a2a3c92862862acaa8ed93537e92bcac75b3c1e51972dc4a123a"

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

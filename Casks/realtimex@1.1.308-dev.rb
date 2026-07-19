cask "realtimex@1.1.308-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.308-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "5ab8a3480c18ac4e6bc775411e7281b0e3c421c10094d86b4cba34a2bdfc208e",
         intel: "595e4402b8e25e3da1d8955d50c0b43f6f7eecf36c713d579b5c4a64cc7852d8"

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

cask "realtimex@1.1.689-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.689-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2a02ad8802380859e3cb541a97f0d2c1b303933b30d069882e9d730b3de899a3",
         intel: "c999bcd8a5ba7224b7bee65aae321c34b05240c474bcee3d60189b54ef597718"

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

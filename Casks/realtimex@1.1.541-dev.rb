cask "realtimex@1.1.541-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.541-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e22bf9b9949e4632f0957e94dc93fe8f6b1193f8be56c7627db90819b609d74f",
         intel: "ca04f173d1721ab6c2d1f0d15f037f50a65adbda16faa40b428efb8061ccfa5b"

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

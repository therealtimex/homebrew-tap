cask "realtimex@1.2.260-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.260-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "8663ee7be092f9e08e2c2b7f8f57eb9099fc0ad500ab5defb11d7857c9e7c134",
         intel: "2493456d87f8d3d08fb22be028be77f9b1871bc9607de9f2347a1ecc90b8dfb8"

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

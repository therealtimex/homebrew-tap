cask "realtimex@1.0.120-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.120-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "746330bd6a87d26317ef755cce49d3e7c8da1d19377906b42a5613874da5a40e",
         intel: "d867afb8bfee3a0da68817174a7578dc0c20cb18ba1f615cc41b1ed0a39f3d8e"

  # Use the #{arch} variable in your URL
  url "https://github.com/therealtimex/realtimex/releases/download/v#{version}/RealTimeX.AI-#{version}#{arch}.dmg"

  name "RealTimeX"
  desc "Find powerful AI Agents for RealTimeX"
  homepage "https://realtimex.ai/"

  depends_on formula: "redis"
  app "RealTimeX.AI.app"

  preflight do
    system_command "/usr/bin/osascript",
                   args: ["-e", 'tell application "RealTimeX.AI" to quit'],
    sleep 2
  end

  caveats <<~EOS
    RealTimeX.AI will be placed in Applications.
  EOS
end

cask "realtimex@1.1.231-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.231-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "d8fab3849c4f2590e97665ff5108c616b1cfc959bcf287a1fe9733075eabc275",
         intel: "6c7aa913916f53d1386e49fdd041bad2388fb8d07cd85e296cb86ff549960ff5"

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

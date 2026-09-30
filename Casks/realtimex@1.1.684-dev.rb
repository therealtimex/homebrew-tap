cask "realtimex@1.1.684-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.684-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "8baa49b500887382c19955cd3350dd5af16b068a63ae1d4204cb511d2c85efe3",
         intel: "476ee91a0d1988d5d431e356f1d44c67999921c2d19d469c621d77e7b5026a0f"

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

cask "realtimex@1.1.175-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.175-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "394df1a52a2d18cfe881d8e4f712f87607494af8df18fcf847abe2752c5ae15a",
         intel: "e612ad49fe30dddb19c6f005cff935302bf42e6740f55b25260b6c0d48d4d174"

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

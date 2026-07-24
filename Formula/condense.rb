# Formula auto-gérée : le workflow `publish` du repo PENRA-CORP/Condense met à jour
# `url` et `sha256` à chaque release (tag v*). Ne pas éditer à la main.
class Condense < Formula
  desc "CLI qui optimise les tokens envoyés à Claude & Codex"
  homepage "https://github.com/PENRA-CORP/Condense"
  url "https://registry.npmjs.org/@penra/condense/-/condense-0.1.31.tgz"
  sha256 "27e04485d9d27155101f9d2e5ccc79d04340469710d6d79995ff31cc69f3261e"
  license "MIT"
  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/condense --version")
  end
end

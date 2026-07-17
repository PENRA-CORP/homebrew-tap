# Formula auto-gérée : le workflow `publish` du repo PENRA-CORP/Condense met à jour
# `url` et `sha256` à chaque release (tag v*). Ne pas éditer à la main.
class Condense < Formula
  desc "CLI qui optimise les tokens envoyés à Claude & Codex"
  homepage "https://github.com/PENRA-CORP/Condense"
  url "https://registry.npmjs.org/@penra/condense/-/condense-0.1.19.tgz"
  sha256 "1627a3d0efd37ac76c4d84b82597e7e2e0378b149d4ed20c8c80cafd1885b755"
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

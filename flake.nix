{
  description = "My vscode";

  outputs = { self, nixpkgs }:

    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
      vscode = with pkgs;
        (vscode-with-extensions.override {
          vscodeExtensions =
            #
            # Generate SHA256 Hash with:
            #
            # nix-prefetch-url https://$P.gallery.vsassets.io/_apis/public/gallery/publisher/$P/extension/$E/$V/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
            #
            # With these variables:
            #
            # P="s3gf4ult"; E="monokai-vibrant";   V="0.4.0";
            # P="alanz";    E="vscode-hie-server"; V="0.0.40";
            #
            vscode-utils.extensionsFromVscodeMarketplace
              (
                [
                  {
                    name = "git-temporal-vscode";
                    publisher = "bee";
                    version = "1.0.0";
                    sha256 = "12wlxhw8k53rknjrlkkdpwcn4msq6h4n8almzcc30wrgpj4wfi8w";
                  }
                  {
                    name = "gitignore";
                    publisher = "codezombiech";
                    version = "0.7.0";
                    sha256 = "0fm4sxx1cb679vn4v85dw8dfp5x0p74m9p2b56gqkvdap0f2q351";
                  }
                  {
                    name = "git-tree-compare";
                    publisher = "letmaik";
                    version = "1.14.0";
                    sha256 = "0as76hzfsc9ssg7wv3swlsm0nv1n0hipzgxsswz70cry515dpz2j";
                  }
                  {
                    name = "git-project-manager";
                    publisher = "felipecaputo";
                    version = "1.8.2";
                    sha256 = "02d0hdqyd9pnad986ymjdgdma3g97mzrx6pa9fi8cn0pzkaxp6qz";
                  }
                  {
                    name = "git-graph";
                    publisher = "mhutchie";
                    version = "1.30.0";
                    sha256 = "000zhgzijf3h6abhv4p3cz99ykj6489wfn81j0s691prr8q9lxxh";
                  }
                  {
                    name = "gitless";
                    publisher = "maattdd";
                    version = "11.7.2";
                    sha256 = "05zbxi1f1jb53ijnxrj7ixm8xfsxmh8hlb6rwxsfc7gs3hs9k1xd";
                  }
                  {
                    name = "nix-env-selector";
                    publisher = "arrterian";
                    version = "1.0.9";
                    sha256 = "0kdfhkdkffr3cdxmj7llb9g3wqpm13ml75rpkwlg1y0pkxcnlk2f";
                  }
                  {
                    name = "open-file-from-path";
                    publisher = "jack89ita";
                    version = "1.3.4";
                    sha256 = "1wh7qnz5y18cg2b77h7frc4x6y7zjpjxyx2kfqny9vaqxpld63ck";
                  }
                  {
                    name = "path-autocomplete";
                    publisher = "ionutvmi";
                    version = "1.17.0";
                    sha256 = "1zg1li9zxprsawvdqawmb58vx3lfpxqs18wlc2q4x16fh9s71dl4";
                  }
                  {
                    name = "erlang-ls";
                    publisher = "erlang-ls";
                    version = "0.0.34";
                    sha256 = "sha256-O9bwOeSYT53oCEHUscCA61oRW9G+eSTfpzCs1IBNfM4="; # pkgs.lib.fakeSha256;
                  }
                ])
            ++
            (with vscode-extensions;
            [
              jnoortheen.nix-ide
              # b4dm4n.vscode-nixpkgs-fmt
              dhall.dhall-lang
              dhall.vscode-dhall-lsp-server
              formulahendry.auto-close-tag
              haskell.haskell
              justusadam.language-haskell
              ms-vsliveshare.vsliveshare
              ms-python.python
              ms-vscode.cpptools
              ms-azuretools.vscode-docker
              redhat.vscode-yaml
              davidanson.vscode-markdownlint
              donjayamanne.githistory
              matklad.rust-analyzer
            ]);
        });
    in
    {

      packages.x86_64-linux.vscode-sh = vscode;

      defaultPackage.x86_64-linux = vscode;

    };
}

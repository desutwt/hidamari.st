# flake.nix
{
  description = "Development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11"; # Or choose a specific release like nixos-23.11
  };

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = function: nixpkgs.lib.genAttrs supportedSystems (system: function system);
    in
    {
      devShells = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            name = "hidamarid-dev-shell";
            packages = [
              pkgs.hugo
              pkgs.pagefind
              pkgs.zed-editor
              pkgs.prettier-plugin-go-template
              pkgs.nodePackages.prettier
              pkgs.tailwindcss
              pkgs.autoprefixer
            ];
          };
        }
      );
    };
}

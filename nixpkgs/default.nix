{ customOverlays ? []}:

let

common-src = builtins.fetchTarball {
    name = "common-2023-08-26";
    url = https://github.com/avanov/nix-common/archive/1b61c084175678fa9f3d511758f0d8f1da861676.tar.gz;
    # Hash obtained using `nix-prefetch-url --unpack <url>`
    sha256 = "sha256:0rsnfk7bq6hl76bfkgy0y0vq5ybwk12ghfly7q5hq8qky2kswh4h";
};

in

import common-src { projectOverlays = customOverlays; }
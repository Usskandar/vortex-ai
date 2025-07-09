{ pkgs }: {
  deps = [
    pkgs.python311
    pkgs.python311Packages.flask
    pkgs.python311Packages.pillow
    pkgs.python311Packages.numpy
    pkgs.python311Packages.pandas
  ];
}
{
  lib,
  python3,
  shared,
}:
shared.python.buildAWSLambda { inherit python3; } {
  pname = "lambda-hello-world";
  version = "1.0.0";
  pyproject = true;

  src = lib.cleanSource ./.;

  nativeBuildInputs = with python3.pkgs; [ setuptools setuptools-scm ];

  nativeCheckInputs = with python3.pkgs; [ pytest mypy ];

  # checkPhase = ''
  #   mypy
  # '';
}

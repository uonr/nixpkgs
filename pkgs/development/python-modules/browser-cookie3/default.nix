{ stdenv
, lib
, fetchPypi
, buildPythonPackage
, pythonOlder
, lz4
, keyring
, pbkdf2
, pycryptodomex
, pyaes
}:

buildPythonPackage rec {
  pname = "browser-cookie3";
  version = "0.19.0";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-CtVPtMhX6pBW4rM+Hq68lfM6EocJX6fgXuROEfYshL0=";
  };

  propagatedBuildInputs = [
    lz4
    keyring
    pbkdf2
    pyaes
    pycryptodomex
  ];

  # No tests implemented
  doCheck = false;

  pythonImportsCheck = [
    "browser_cookie3"
  ];

  meta = with lib; {
    description = "Loads cookies from your browser into a cookiejar object";
    homepage = "https://github.com/borisbabic/browser_cookie3";
    changelog = "https://github.com/borisbabic/browser_cookie3/blob/master/CHANGELOG.md";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ borisbabic ];
    broken = stdenv.isDarwin;
  };
}

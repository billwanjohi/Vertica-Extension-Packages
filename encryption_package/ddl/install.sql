select version();

\set libfile '\''`pwd`'/lib/Encryption.so\'';

CREATE LIBRARY Encryption as :libfile;
CREATE OR REPLACE FUNCTION AESEncrypt as language 'C++' name 'AESEncryptFactory' library Encryption;
CREATE OR REPLACE FUNCTION AESDecrypt as language 'C++' name 'AESDecryptFactory' library Encryption;

GRANT ALL ON FUNCTION public.AESEncrypt (x varchar, y varchar) TO public;
GRANT ALL ON FUNCTION public.AESDecrypt (x varchar, y varchar) TO public;

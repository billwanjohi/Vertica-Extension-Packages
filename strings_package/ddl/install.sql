select version();

\set libfile '\''`pwd`'/lib/StringsLib.so\'';
CREATE LIBRARY StringsLib AS :libfile;

CREATE OR REPLACE FUNCTION EditDistance                   AS LANGUAGE 'C++' NAME 'EditDistanceFactory'         LIBRARY StringsLib;
CREATE OR REPLACE FUNCTION Stemmer                        AS LANGUAGE 'C++' NAME 'PorterStemmerFactory'        LIBRARY StringsLib;
CREATE OR REPLACE TRANSFORM FUNCTION StringTokenizer      AS LANGUAGE 'C++' NAME 'StringTokenizerFactory'      LIBRARY StringsLib;
CREATE OR REPLACE TRANSFORM FUNCTION StringTokenizerDelim AS LANGUAGE 'C++' NAME 'StringTokenizerDelimFactory' LIBRARY StringsLib;
CREATE OR REPLACE TRANSFORM FUNCTION TwoGrams             AS LANGUAGE 'C++' NAME 'TwoGramsFactory'             LIBRARY StringsLib;
CREATE OR REPLACE TRANSFORM FUNCTION ThreeGrams           AS LANGUAGE 'C++' NAME 'ThreeGramsFactory'           LIBRARY StringsLib;
CREATE OR REPLACE TRANSFORM FUNCTION FourGrams            AS LANGUAGE 'C++' NAME 'FourGramsFactory'            LIBRARY StringsLib;
CREATE OR REPLACE TRANSFORM FUNCTION FiveGrams            AS LANGUAGE 'C++' NAME 'FiveGramsFactory'            LIBRARY StringsLib;
CREATE OR REPLACE FUNCTION WordCount                      AS LANGUAGE 'C++' NAME 'WordCountFactory'            LIBRARY StringsLib;
CREATE OR REPLACE TRANSFORM FUNCTION gen_anagram          AS LANGUAGE 'C++' NAME 'AnagramFactory'              LIBRARY StringsLib;
CREATE OR REPLACE TRANSFORM FUNCTION group_concat         AS LANGUAGE 'C++' NAME 'GroupConcatFactory'          LIBRARY StringsLib;

GRANT ALL ON FUNCTION public.editdistance (x varchar, y varchar) TO public;
GRANT ALL ON FUNCTION public.wordcount(x varchar) TO public;
GRANT ALL ON FUNCTION public.stemmer (x varchar) TO public;
GRANT ALL ON TRANSFORM FUNCTION public.fivegrams (x varchar) TO public;
GRANT ALL ON TRANSFORM FUNCTION public.fourgrams (x varchar) TO public;
GRANT ALL ON TRANSFORM FUNCTION public.threegrams (x varchar) TO public;
GRANT ALL ON TRANSFORM FUNCTION public.twograms (x varchar) TO public; 
GRANT ALL ON TRANSFORM FUNCTION public.stringtokenizer (x varchar) TO public;
GRANT ALL ON TRANSFORM FUNCTION public.stringtokenizerdelim (x varchar, y varchar) TO public;
GRANT ALL ON TRANSFORM FUNCTION public.gen_anagram (x varchar) TO public;
GRANT ALL ON TRANSFORM FUNCTION public.group_concat (x varchar) TO public;


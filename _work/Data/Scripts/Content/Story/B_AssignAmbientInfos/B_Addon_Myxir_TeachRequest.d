///////////////////////////////////////////////////////////////////////
//	Info B_DIA_Addon_Myxir_TeachRequest
///////////////////////////////////////////////////////////////////////
func void B_DIA_Addon_Myxir_TeachRequest ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_TeachRequest_15_00"); //Naucz mnie tego dziwnego j�zyka.
}; 

func void B_DIA_Addon_Myxir_TeachL1 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_00"); //Zacznijmy od czego� prostego. Naucz� ci� j�zyka wie�niak�w.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_01"); //Teksty pisane w j�zyku wie�niak�w traktuj� zwykle o sprawach przyziemnych: pracy, mi�o�ci, zaopatrzeniu czy �ywno�ci.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_02"); //J�zyk ten by� powszechnie wykorzystywany w mie�cie. Tak wi�c b�dziesz w stanie zrozumie� wi�kszo�� tekst�w, kt�re tam znajdziesz.
};

func void B_DIA_Addon_Myxir_TeachL2 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_00"); //Znasz ju� j�zyk wie�niak�w. J�zyk wojownik�w jest nieco trudniejszy.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_01"); //Teksty pisane w j�zyku wojownik�w dotycz� zwykle wojny i broni. Nauczysz si� wielu przydatnych rzeczy.
};

func void B_DIA_Addon_Myxir_TeachL3 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_00"); //J�zyk kap�an�w jest bardzo trudny do zrozumienia, ale ch�tnie przeka�� ci jego zasady.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_01"); //W j�zyku kap�an�w spisane s� wszystkie �wi�te pisma obja�niaj�ce histori� i magi� budowniczych.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_02"); //Ka�dy z tych tekst�w to prawdziwy skarb, o ile kto� zrozumie ich znaczenie.
};

func void B_DIA_Addon_Myxir_TeachNoMore ()
{
	AI_Output 	(self, other,"DIA_Addon_Myxir_TeachNoMore_12_00"); //Nie mog� ci na razie pokaza� niczego wi�cej. Opanowa�e� j�zyk budowniczych.
};

func void B_DIA_Addon_Myxir_Teach_LANGUAGE_X ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_Teach_LANGUAGE_X_12_00"); //Id� i sprawd� swoj� now� wiedz�. Przekonasz si�, �e pisma budowniczych nie stanowi� ju� dla ciebie zagadki.
};




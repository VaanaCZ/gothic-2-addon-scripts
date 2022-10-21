///////////////////////////////////////////////////////////////////////
//	Info B_DIA_Addon_Myxir_TeachRequest
///////////////////////////////////////////////////////////////////////
func void B_DIA_Addon_Myxir_TeachRequest ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_TeachRequest_15_00"); //Naucz mnie tego dziwnego jêzyka.
}; 

func void B_DIA_Addon_Myxir_TeachL1 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_00"); //Zacznijmy od czegoœ prostego. Nauczê ciê jêzyka wieœniaków.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_01"); //Teksty pisane w jêzyku wieœniaków traktuj¹ zwykle o sprawach przyziemnych: pracy, mi³oœci, zaopatrzeniu czy ¿ywnoœci.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_02"); //Jêzyk ten by³ powszechnie wykorzystywany w mieœcie. Tak wiêc bêdziesz w stanie zrozumieæ wiêkszoœæ tekstów, które tam znajdziesz.
};

func void B_DIA_Addon_Myxir_TeachL2 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_00"); //Znasz ju¿ jêzyk wieœniaków. Jêzyk wojowników jest nieco trudniejszy.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_01"); //Teksty pisane w jêzyku wojowników dotycz¹ zwykle wojny i broni. Nauczysz siê wielu przydatnych rzeczy.
};

func void B_DIA_Addon_Myxir_TeachL3 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_00"); //Jêzyk kap³anów jest bardzo trudny do zrozumienia, ale chêtnie przeka¿ê ci jego zasady.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_01"); //W jêzyku kap³anów spisane s¹ wszystkie œwiête pisma objaœniaj¹ce historiê i magiê budowniczych.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_02"); //Ka¿dy z tych tekstów to prawdziwy skarb, o ile ktoœ zrozumie ich znaczenie.
};

func void B_DIA_Addon_Myxir_TeachNoMore ()
{
	AI_Output 	(self, other,"DIA_Addon_Myxir_TeachNoMore_12_00"); //Nie mogê ci na razie pokazaæ niczego wiêcej. Opanowa³eœ jêzyk budowniczych.
};

func void B_DIA_Addon_Myxir_Teach_LANGUAGE_X ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_Teach_LANGUAGE_X_12_00"); //IdŸ i sprawdŸ swoj¹ now¹ wiedzê. Przekonasz siê, ¿e pisma budowniczych nie stanowi¹ ju¿ dla ciebie zagadki.
};




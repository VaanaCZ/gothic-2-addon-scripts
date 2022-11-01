///////////////////////////////////////////////////////////////////////
//	Info B_DIA_Addon_Myxir_TeachRequest
///////////////////////////////////////////////////////////////////////
func void B_DIA_Addon_Myxir_TeachRequest ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_TeachRequest_15_00"); //Naucz mnie tego dziwnego języka.
}; 

func void B_DIA_Addon_Myxir_TeachL1 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_00"); //Zacznijmy od czegoś prostego. Nauczę cię języka wieśniaków.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_01"); //Teksty pisane w języku wieśniaków traktują zwykle o sprawach przyziemnych: pracy, miłości, zaopatrzeniu czy żywności.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_02"); //Język ten był powszechnie wykorzystywany w mieście. Tak więc będziesz w stanie zrozumieć większość tekstów, które tam znajdziesz.
};

func void B_DIA_Addon_Myxir_TeachL2 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_00"); //Znasz już język wieśniaków. Język wojowników jest nieco trudniejszy.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_01"); //Teksty pisane w języku wojowników dotyczą zwykle wojny i broni. Nauczysz się wielu przydatnych rzeczy.
};

func void B_DIA_Addon_Myxir_TeachL3 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_00"); //Język kapłanów jest bardzo trudny do zrozumienia, ale chętnie przekażę ci jego zasady.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_01"); //W języku kapłanów spisane są wszystkie święte pisma objaśniające historię i magię budowniczych.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_02"); //Każdy z tych tekstów to prawdziwy skarb, o ile ktoś zrozumie ich znaczenie.
};

func void B_DIA_Addon_Myxir_TeachNoMore ()
{
	AI_Output 	(self, other,"DIA_Addon_Myxir_TeachNoMore_12_00"); //Nie mogę ci na razie pokazać niczego więcej. Opanowałeś język budowniczych.
};

func void B_DIA_Addon_Myxir_Teach_LANGUAGE_X ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_Teach_LANGUAGE_X_12_00"); //Idź i sprawdź swoją nową wiedzę. Przekonasz się, że pisma budowniczych nie stanowią już dla ciebie zagadki.
};




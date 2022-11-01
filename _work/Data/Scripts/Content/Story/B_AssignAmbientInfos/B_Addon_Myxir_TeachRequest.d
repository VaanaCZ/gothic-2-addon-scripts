///////////////////////////////////////////////////////////////////////
//	Info B_DIA_Addon_Myxir_TeachRequest
///////////////////////////////////////////////////////////////////////
func void B_DIA_Addon_Myxir_TeachRequest ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_TeachRequest_15_00"); //Insegnami quella lingua.
}; 

func void B_DIA_Addon_Myxir_TeachL1 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_00"); //Cominceremo con qualcosa di facile. Innanzitutto posso insegnarti la lingua dei contadini.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_01"); //In linea di massima, i testi scritti nella lingua dei contadini trattano di temi quotidiani: il lavoro, l'amore o come procurarsi il cibo.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_02"); //Era la lingua comune in città. Riuscirai a capire gran parte dei testi che trovi qui, se la conosci.
};

func void B_DIA_Addon_Myxir_TeachL2 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_00"); //Conosci già la lingua dei contadini. La lingua dei guerrieri è un po' più difficile.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_01"); //I testi scritti nella lingua dei guerrieri trattano principalmente di armi e guerre. Potrai imparare alcune cose utili.
};

func void B_DIA_Addon_Myxir_TeachL3 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_00"); //La nobile lingua dei sacerdoti è veramente difficile da capire. Ma te la illustrerò con piacere.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_01"); //Sono scritte nella lingua dei sacerdoti soprattutto le sacre scritture, che spiegano la storia e la magia dei creatori.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_02"); //Ognuno di questi testi è un vero tesoro, se se ne comprende il significato.
};

func void B_DIA_Addon_Myxir_TeachNoMore ()
{
	AI_Output 	(self, other,"DIA_Addon_Myxir_TeachNoMore_12_00"); //Non posso mostrarti nient'altro. Ora padroneggi la lingua dei costruttori.
};

func void B_DIA_Addon_Myxir_Teach_LANGUAGE_X ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_Teach_LANGUAGE_X_12_00"); //Vai a mettere alla prova la tua conoscenza. Vedrai che le scritture dei costruttori non sono più un mistero insolubile per te.
};




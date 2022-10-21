////////////////////////////////////////////////////////
//		B_LastWarningVatras
////////////////////////////////////////////////////////

func void B_LastWarningVatras ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_00"); //Che cosa hai fatto, scellerato? 
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_01"); //Noi, nell'Ordine dell'Acqua, ti abbiamo ripetutamente messo in guardia contro il rischio di essere preso in trappola dal male.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_02"); //Tuttavia, ho saputo che ti sei allontanato dal cammino dell'equilibrio che tutto conserva.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_03"); //Hai ucciso e saccheggiato ovunque sei passato e sei colpevole di gravi crimini.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_04"); //Numerose persone innocenti hanno perso la vita per TUA mano.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_05"); //Ora ti sei alleato con i poteri delle tenebre.
};

func void B_VatrasPissedOff ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOffPerm_Add_05_00"); //Di conseguenza, non puoi più contare sul nostro sostegno. 
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOffPerm_Add_05_01"); //Vattene. Per me, ora sei un reietto.
	
	if (Vatras_IsOnBoard == LOG_SUCCESS)
	{
		crewmember_Count = (Crewmember_Count -1);
	};

	Vatras_IsOnBoard = LOG_FAILED;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	self.flags = 0;
	VatrasPissedOffForever = TRUE;

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"PRAY"); 
};

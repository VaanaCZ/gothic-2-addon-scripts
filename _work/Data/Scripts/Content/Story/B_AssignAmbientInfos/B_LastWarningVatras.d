////////////////////////////////////////////////////////
//		B_LastWarningVatras
////////////////////////////////////////////////////////

func void B_LastWarningVatras ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_00"); //Cos to udęlal, ty darebáku! 
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_01"); //Už nękolikrát tę lidé z âádu vody varovali, že se necháváš ovládat zlem.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_02"); //Jenže teë i já sám musím uznat, že jsi opustil cestu všeobjímající rovnováhy.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_03"); //Máš na svędomí vraždy a rabování a spáchal jsi četné vážné zločiny.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_04"); //TVOU rukou zahynula spousta nevinných.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_05"); //A nyní ses spolčil s temnými silami.
};

func void B_VatrasPissedOff ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOffPerm_Add_05_00"); //Proto od nynęjška už nepočítej s naší podporou. 
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOffPerm_Add_05_01"); //Ztraă se. Pro mne jsi obyčejný vyvrhel.
	
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

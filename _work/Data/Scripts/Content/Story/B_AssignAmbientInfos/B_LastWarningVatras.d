////////////////////////////////////////////////////////
//		B_LastWarningVatras
////////////////////////////////////////////////////////

func void B_LastWarningVatras ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_00"); //What have you done, wretch? 
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_01"); //We in the Order of Water have warned you repeatedly against becoming ensnared by evil.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_02"); //However, it has come to my attention that you have left the path of the all-preserving balance.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_03"); //You have murdered and plundered your way across the land and are guilty of serious crimes.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_04"); //Numerous innocent people have been carried off by YOUR hand.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_05"); //You are now allied with the powers of darkness.
};

func void B_VatrasPissedOff ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOffPerm_Add_05_00"); //Henceforth, you can no longer count on our support. 
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOffPerm_Add_05_01"); //Begone. To me you are now an outcast.
	
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

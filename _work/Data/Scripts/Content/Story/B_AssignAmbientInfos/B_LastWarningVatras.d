////////////////////////////////////////////////////////
//		B_LastWarningVatras
////////////////////////////////////////////////////////

func void B_LastWarningVatras ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_00"); //Co uczyniłeś, nieszczęśniku? 
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_01"); //W zakonie wody wiele razy ostrzegaliśmy cię, byś wyrzekł się zła.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_02"); //Doszły mnie jednak słuchy, że opuściłeś ścieżkę wszystkich, którzy podtrzymują równowagę.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_03"); //Wędrowałeś, mordując i łupiąc. Masz na sumieniu straszliwe zbrodnie.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_04"); //Z twojej ręki zginęła niezliczona liczba niewinnych ludzi!
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_05"); //A teraz sprzymierzyłeś się z siłami ciemności.
};

func void B_VatrasPissedOff ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOffPerm_Add_05_00"); //Odtąd nie możesz liczyć na moje poparcie. 
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOffPerm_Add_05_01"); //Odejdź. Dla mnie jesteś teraz wyrzutkiem.
	
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

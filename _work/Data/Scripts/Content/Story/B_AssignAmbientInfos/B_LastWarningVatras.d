////////////////////////////////////////////////////////
//		B_LastWarningVatras
////////////////////////////////////////////////////////

func void B_LastWarningVatras ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_00"); //Co uczyni�e�, nieszcz�niku? 
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_01"); //W zakonie wody wiele razy ostrzegali�my ci�, by� wyrzek� si� z�a.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_02"); //Dosz�y mnie jednak s�uchy, �e opu�ci�e� �cie�k� wszystkich, kt�rzy podtrzymuj� r�wnowag�.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_03"); //W�drowa�e�, morduj�c i �upi�c. Masz na sumieniu straszliwe zbrodnie.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_04"); //Z twojej r�ki zgin�a niezliczona liczba niewinnych ludzi!
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_05"); //A teraz sprzymierzy�e� si� z si�ami ciemno�ci.
};

func void B_VatrasPissedOff ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOffPerm_Add_05_00"); //Odt�d nie mo�esz liczy� na moje poparcie. 
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOffPerm_Add_05_01"); //Odejd�. Dla mnie jeste� teraz wyrzutkiem.
	
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

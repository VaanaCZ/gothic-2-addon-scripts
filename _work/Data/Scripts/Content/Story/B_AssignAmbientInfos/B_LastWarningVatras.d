////////////////////////////////////////////////////////
//		B_LastWarningVatras
////////////////////////////////////////////////////////

func void B_LastWarningVatras ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_00"); //Qu'avez-vous fait, malheureux ? 
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_01"); //La confr�rie de l'Ordre de l'eau vous a averti plusieurs fois au sujet de la corruption que peut engendrer le mal !
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_02"); //Toutefois, il a r�cemment �t� port� � mon attention que vous avez quitt� la voie de l'�quilibre garant de l'existence de ce monde...
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_03"); //Vous avez commis meurtres et pillages en traversant ces terres, et vous �tes rendu coupable de crimes odieux.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_04"); //De nombreux innocents sont morts de votre main.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_05"); //Vous �tes maintenant un alli� des puissances des t�n�bres.
};

func void B_VatrasPissedOff ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOffPerm_Add_05_00"); //Par cons�quent, vous ne pouvez d�sormais plus compter sur notre aide. 
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOffPerm_Add_05_01"); //Disparaissez. Vous �tes d�sormais banni de notre confr�rie.
	
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

////////////////////////////////////////////////////////
//		B_LastWarningVatras
////////////////////////////////////////////////////////

func void B_LastWarningVatras ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_00"); //Qu'avez-vous fait, malheureux ? 
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_01"); //La confrérie de l'Ordre de l'eau vous a averti plusieurs fois au sujet de la corruption que peut engendrer le mal !
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_02"); //Toutefois, il a récemment été porté à mon attention que vous avez quitté la voie de l'équilibre garant de l'existence de ce monde...
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_03"); //Vous avez commis meurtres et pillages en traversant ces terres, et vous êtes rendu coupable de crimes odieux.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_04"); //De nombreux innocents sont morts de votre main.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_05"); //Vous êtes maintenant un allié des puissances des ténèbres.
};

func void B_VatrasPissedOff ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOffPerm_Add_05_00"); //Par conséquent, vous ne pouvez désormais plus compter sur notre aide. 
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOffPerm_Add_05_01"); //Disparaissez. Vous êtes désormais banni de notre confrérie.
	
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

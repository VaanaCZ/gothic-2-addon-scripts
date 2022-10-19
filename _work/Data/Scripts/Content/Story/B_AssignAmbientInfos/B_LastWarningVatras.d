////////////////////////////////////////////////////////
//		B_LastWarningVatras
////////////////////////////////////////////////////////

func void B_LastWarningVatras ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_00"); //Was hast du getan, Elender? 
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_01"); //Wir vom Orden des Wassers haben dich mehrmals davor gewarnt, dem B�sen zu verfallen.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_02"); //Doch mir ist Ohren gekommen, dass du den Pfad des alles erhaltenen Gleichgewichts verlassen hast.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_03"); //Du bist mordend und pl�nderns durch die Lande gezogen und hast dich schwerer Verbrechen schuldig gemacht.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_04"); //Zahlreiche unschuldige Menschen sind durch DEINE Hand dahingerafft worden.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_05"); //Du stehst nun mit den M�chten der Finsternis im Bunde.
};

func void B_VatrasPissedOff ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOffPerm_Add_05_00"); //Von nun an kannst du nicht mehr mit meiner Unterst�tzung zu rechnen. 
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOffPerm_Add_05_01"); //Geh weg. Du bist jetzt ein Ausgesto�ener f�r mich.
	
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

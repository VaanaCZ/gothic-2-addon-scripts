////////////////////////////////////////////////////////
//		B_LastWarningVatras
////////////////////////////////////////////////////////

func void B_LastWarningVatras ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_00"); //¿Qué has hecho, desgraciado? 
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_01"); //La Orden del Agua te advirtió muchas veces que no te dejaras tentar por el mal.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_02"); //Sin embargo, no me ha pasado desapercibido que has abandonado el sendero del equilibrio conservador.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_03"); //Has saqueado y asesinado por toda la tierra y eres culpable de graves delitos.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_04"); //Mucha gente inocente ha perecido por TU mano.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_05"); //Ahora te has aliado con los poderes oscuros.
};

func void B_VatrasPissedOff ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOffPerm_Add_05_00"); //En adelante, no cuentes con nuestro apoyo. 
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOffPerm_Add_05_01"); //Márchate. En lo que a mí respecta, eres un desterrado.
	
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

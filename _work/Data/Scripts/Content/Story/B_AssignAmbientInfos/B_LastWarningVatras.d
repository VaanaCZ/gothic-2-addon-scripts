////////////////////////////////////////////////////////
//		B_LastWarningVatras
////////////////////////////////////////////////////////

func void B_LastWarningVatras ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_00"); //Cos to ud�lal, ty dareb�ku! 
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_01"); //U� n�kolikr�t t� lid� z ��du vody varovali, �e se nech�v� ovl�dat zlem.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_02"); //Jen�e te� i j� s�m mus�m uznat, �e jsi opustil cestu v�eobj�maj�c� rovnov�hy.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_03"); //M� na sv�dom� vra�dy a rabov�n� a sp�chal jsi �etn� v�n� zlo�iny.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_04"); //TVOU rukou zahynula spousta nevinn�ch.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_05"); //A nyn� ses spol�il s temn�mi silami.
};

func void B_VatrasPissedOff ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOffPerm_Add_05_00"); //Proto od nyn�j�ka u� nepo��tej s na�� podporou. 
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOffPerm_Add_05_01"); //Ztra� se. Pro mne jsi oby�ejn� vyvrhel.
	
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

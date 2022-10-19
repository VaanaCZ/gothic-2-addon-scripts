// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Marcos_EXIT(C_INFO)
{
	npc			= PAL_217_Marcos;
	nr			= 999;
	condition	= DIA_Marcos_EXIT_Condition;
	information	= DIA_Marcos_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Marcos_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Marcos_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};	
// ************************************************************
// 			  Hallo				 
// ************************************************************
INSTANCE DIA_Marcos_Hallo(C_INFO)
{
	npc			= PAL_217_Marcos;
	nr			= 2;
	condition	= DIA_Marcos_Hallo_Condition;
	information	= DIA_Marcos_Hallo_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       

FUNC INT DIA_Marcos_Hallo_Condition()
{	
	if (Kapitel == 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Marcos_Hallo_Info()
{	
	AI_Output (self, other, "DIA_Marcos_Hallo_04_00");//ST�T - jm�nem Innose! Jsem Marcos, kr�lovsk� paladin. �ekni, co chce�, a mluv pravdu!
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (other, self, "DIA_Marcos_Hallo_15_01");//Innos�v vyvolen� mluv� v�dycky pravdu.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_02");//Odpus�, ctihodn� m�gu. Neuv�domil jsem si, s k�m mluv�m.
		AI_Output (other, self, "DIA_Marcos_Hallo_15_03");//V po��dku, nic se nestalo.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_04");//Pokud se m��u zeptat - co t� sem p�iv�d�?
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (other, self, "DIA_Marcos_Hallo_15_05");//Uklidni se - jsem ve slu�b�ch lorda Hagena.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_06");//Jsi jeden z voj�k�. Na jak� rozkaz tu jsi?
	}
	else //SLD
	{
		AI_Output (other, self, "DIA_Marcos_Hallo_15_07");//Klid, pracujeme pro stejn�ho hlavouna - lorda Hagena.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_08");//Odkdy lord Hagen naj�m� �old�ky? Mluv! Co tady pohled�v�?
	};

};
// ************************************************************
// 			  Hagen			 
// ************************************************************
INSTANCE DIA_Marcos_Hagen(C_INFO)
{
	npc			= PAL_217_Marcos;
	nr			= 2;
	condition	= DIA_Marcos_Hagen_Condition;
	information	= DIA_Marcos_Hagen_Info;
	permanent	= FALSE;
	description	= "Mus�m p�in�st lordu Hagenovi d�kaz, �e draci existuj�.";
};                       

FUNC INT DIA_Marcos_Hagen_Condition()
{	
	if (Kapitel == 2)
	&& (Garond.aivar [AIV_TalkedToPlayer] == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Marcos_Hagen_Info()
{	
	AI_Output (other, self, "DIA_Marcos_Hagen_15_00");//Mus�m p�in�st lordu Hagenovi d�kaz, �e draci existuj�.
	AI_Output (self, other, "DIA_Marcos_Hagen_04_01");//Pak bys nem�l ztr�cet �as a zbyte�n� riskovat �ivot.
	AI_Output (self, other, "DIA_Marcos_Hagen_04_02");//Mysl�, �e tady najde� dra�� �upinu, kterou bys mu mohl p�in�st?
	AI_Output (self, other, "DIA_Marcos_Hagen_04_03");//Zkus se dostat do hradu a promluvit si s velitelem Garondem.
	AI_Output (self, other, "DIA_Marcos_Hagen_04_04");//Mus� se dozv�d�t, �e t� pos�l� lord Hagen! Postar� se o to, aby ses nevr�til s pr�zdnou.
};	

// ************************************************************
// 			  Garond			 
// ************************************************************
INSTANCE DIA_Marcos_Garond(C_INFO)
{
	npc			= PAL_217_Marcos;
	nr			= 2;
	condition	= DIA_Marcos_Garond_Condition;
	information	= DIA_Marcos_Garond_Info;
	permanent	= FALSE;
	description	= "P�ich�z�m od Garonda...";
};                       

FUNC INT DIA_Marcos_Garond_Condition()
{	
	if (Kapitel == 2)
	&& (MIS_OLDWORLD == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Marcos_Garond_Info()
{	
	AI_Output (other, self, "DIA_Marcos_Garond_15_00");//P�ich�z�m od Garonda. Pot�ebuje v�d�t, kolik rudy je p�ipraveno k p�evozu.
	AI_Output (self, other, "DIA_Marcos_Garond_04_01");//Vy�i� Garondovi, �e jsem musel opustit d�l, proto�e �toky sk�et� za�aly b�t p��li� nebezpe�n�.
	AI_Output (self, other, "DIA_Marcos_Garond_04_02");//Sna�il jsem se dostat ke hradu je�t� s n�kolika dal��mi, ale p�e�il jsem nakonec jen j�.
	AI_Output (self, other, "DIA_Marcos_Garond_04_03");//Ulo�il jsem rudu do bezpe��. Jsou to �TY�I truhly. B� za Garondem a nahlas mu to.
	AI_Output (self, other, "DIA_Marcos_Garond_04_04");//�ekni mu, �e budu rudu st�e�it vlastn�m �ivotem. Ale netu��m, za jak dlouho m� tu sk�eti vyp�traj�.
	AI_Output (self, other, "DIA_Marcos_Garond_04_05");//Vy�i� mu, aby mi poslal n�koho na pomoc.
	AI_Output (other, self, "DIA_Marcos_Garond_15_06");//Vy��d�m mu to.
	
	B_LogEntry (TOPIC_ScoutMine,"V mal�m �dol��ku st�e�� paladin Marcos �TY�I bedny rudy.");
	
	Log_CreateTopic (Topic_MarcosJungs,LOG_MISSION);
	Log_SetTopicStatus (Topic_MarcosJungs,LOG_RUNNING);
	B_LogEntry (Topic_MarcosJungs,"Marcos ��d�, aby mu Garond poslal n�jakou pomoc.");
	
	MIS_Marcos_Jungs = LOG_RUNNING;
	Marcos_Ore = TRUE;
	self.flags = 0;
};	
	
// ************************************************************
// 			Perm
// ************************************************************
INSTANCE DIA_Marcos_Perm(C_INFO)
{
	npc			= PAL_217_Marcos;
	nr			= 9;
	condition	= DIA_Marcos_Perm_Condition;
	information	= DIA_Marcos_Perm_Info;
	permanent	= TRUE;
	description	= "Jak se vede?";
};                       

FUNC INT DIA_Marcos_Perm_Condition()
{	
	if (Kapitel >= 2)
	&& (Npc_KnowsInfo (other, DIA_Marcos_Hagen)
	|| Npc_KnowsInfo (other, DIA_Marcos_Garond))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Marcos_Perm_Info()
{	

	AI_Output (other, self, "DIA_Marcos_Perm_15_00");//Jak to vypad�?
	
	if (self.attribute [ATR_HITPOINTS]) < (self.attribute [ATR_HITPOINTS_MAX] /2)  
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_01");//Pot�ebuju po��dn� lok l��iv�ho lektvaru!
		B_UseItem (self, ItPo_Health_03);  
		
	}
	else if (MIS_Marcos_Jungs == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_02");//Vydr��m - ale douf�m, �e mi Garond brzy po�le posily.
	}
	else if (MIS_Marcos_Jungs == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_03");//D�kuji ti za pomoc. Innos n�m d� s�lu, abychom st�li pevn� jako sk�la.
		
		if (Marcos_einmalig == FALSE)
		{
			B_GivePlayerXP(XP_Marcos_Jungs);
			Marcos_einmalig = TRUE;
		};
	}
	else 
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_04");//Budu st�t pevn�, proto�e je Innos se mnou!
	};
	
	AI_StopProcessInfos (self);
};		
	

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Marcos_PICKPOCKET (C_INFO)
{
	npc			= PAL_217_Marcos;
	nr			= 900;
	condition	= DIA_Marcos_PICKPOCKET_Condition;
	information	= DIA_Marcos_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Marcos_PICKPOCKET_Condition()
{
	C_Beklauen (65, 380);
};
 
FUNC VOID DIA_Marcos_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Marcos_PICKPOCKET);
	Info_AddChoice		(DIA_Marcos_PICKPOCKET, DIALOG_BACK 		,DIA_Marcos_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Marcos_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Marcos_PICKPOCKET_DoIt);
};

func void DIA_Marcos_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Marcos_PICKPOCKET);
};
	
func void DIA_Marcos_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Marcos_PICKPOCKET);
};


	
	
	
	
	
	

	

	
	

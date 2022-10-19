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
	AI_Output (self, other, "DIA_Marcos_Hallo_04_00");//STÁT - jménem Innose! Jsem Marcos, královský paladin. Âekni, co chceš, a mluv pravdu!
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (other, self, "DIA_Marcos_Hallo_15_01");//Innosùv vyvolený mluví vždycky pravdu.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_02");//Odpusã, ctihodný mágu. Neuvêdomil jsem si, s kým mluvím.
		AI_Output (other, self, "DIA_Marcos_Hallo_15_03");//V poâádku, nic se nestalo.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_04");//Pokud se mùžu zeptat - co tê sem pâivádí?
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (other, self, "DIA_Marcos_Hallo_15_05");//Uklidni se - jsem ve službách lorda Hagena.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_06");//Jsi jeden z vojákù. Na jaký rozkaz tu jsi?
	}
	else //SLD
	{
		AI_Output (other, self, "DIA_Marcos_Hallo_15_07");//Klid, pracujeme pro stejného hlavouna - lorda Hagena.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_08");//Odkdy lord Hagen najímá žoldáky? Mluv! Co tady pohledáváš?
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
	description	= "Musím pâinést lordu Hagenovi dùkaz, že draci existují.";
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
	AI_Output (other, self, "DIA_Marcos_Hagen_15_00");//Musím pâinést lordu Hagenovi dùkaz, že draci existují.
	AI_Output (self, other, "DIA_Marcos_Hagen_04_01");//Pak bys nemêl ztrácet èas a zbyteènê riskovat život.
	AI_Output (self, other, "DIA_Marcos_Hagen_04_02");//Myslíš, že tady najdeš draèí šupinu, kterou bys mu mohl pâinést?
	AI_Output (self, other, "DIA_Marcos_Hagen_04_03");//Zkus se dostat do hradu a promluvit si s velitelem Garondem.
	AI_Output (self, other, "DIA_Marcos_Hagen_04_04");//Musí se dozvêdêt, že tê posílá lord Hagen! Postará se o to, aby ses nevrátil s prázdnou.
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
	description	= "Pâicházím od Garonda...";
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
	AI_Output (other, self, "DIA_Marcos_Garond_15_00");//Pâicházím od Garonda. Potâebuje vêdêt, kolik rudy je pâipraveno k pâevozu.
	AI_Output (self, other, "DIA_Marcos_Garond_04_01");//Vyâië Garondovi, že jsem musel opustit dùl, protože útoky skâetù zaèaly být pâíliš nebezpeèné.
	AI_Output (self, other, "DIA_Marcos_Garond_04_02");//Snažil jsem se dostat ke hradu ještê s nêkolika dalšími, ale pâežil jsem nakonec jen já.
	AI_Output (self, other, "DIA_Marcos_Garond_04_03");//Uložil jsem rudu do bezpeèí. Jsou to ÈTYÂI truhly. Bêž za Garondem a nahlas mu to.
	AI_Output (self, other, "DIA_Marcos_Garond_04_04");//Âekni mu, že budu rudu stâežit vlastním životem. Ale netuším, za jak dlouho mê tu skâeti vypátrají.
	AI_Output (self, other, "DIA_Marcos_Garond_04_05");//Vyâië mu, aby mi poslal nêkoho na pomoc.
	AI_Output (other, self, "DIA_Marcos_Garond_15_06");//Vyâídím mu to.
	
	B_LogEntry (TOPIC_ScoutMine,"V malém údolíèku stâeží paladin Marcos ÈTYÂI bedny rudy.");
	
	Log_CreateTopic (Topic_MarcosJungs,LOG_MISSION);
	Log_SetTopicStatus (Topic_MarcosJungs,LOG_RUNNING);
	B_LogEntry (Topic_MarcosJungs,"Marcos žádá, aby mu Garond poslal nêjakou pomoc.");
	
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

	AI_Output (other, self, "DIA_Marcos_Perm_15_00");//Jak to vypadá?
	
	if (self.attribute [ATR_HITPOINTS]) < (self.attribute [ATR_HITPOINTS_MAX] /2)  
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_01");//Potâebuju poâádný lok léèivého lektvaru!
		B_UseItem (self, ItPo_Health_03);  
		
	}
	else if (MIS_Marcos_Jungs == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_02");//Vydržím - ale doufám, že mi Garond brzy pošle posily.
	}
	else if (MIS_Marcos_Jungs == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_03");//Dêkuji ti za pomoc. Innos nám dá sílu, abychom stáli pevnê jako skála.
		
		if (Marcos_einmalig == FALSE)
		{
			B_GivePlayerXP(XP_Marcos_Jungs);
			Marcos_einmalig = TRUE;
		};
	}
	else 
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_04");//Budu stát pevnê, protože je Innos se mnou!
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


	
	
	
	
	
	

	

	
	

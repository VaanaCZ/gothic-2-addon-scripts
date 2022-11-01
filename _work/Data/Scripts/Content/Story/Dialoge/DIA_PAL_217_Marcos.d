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
	AI_Output (self, other, "DIA_Marcos_Hallo_04_00");//STÁT - jménem Innose! Jsem Marcos, královský paladin. Řekni, co chceš, a mluv pravdu!
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (other, self, "DIA_Marcos_Hallo_15_01");//Innosův vyvolený mluví vždycky pravdu.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_02");//Odpusť, ctihodný mágu. Neuvědomil jsem si, s kým mluvím.
		AI_Output (other, self, "DIA_Marcos_Hallo_15_03");//V pořádku, nic se nestalo.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_04");//Pokud se můžu zeptat - co tě sem přivádí?
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (other, self, "DIA_Marcos_Hallo_15_05");//Uklidni se - jsem ve službách lorda Hagena.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_06");//Jsi jeden z vojáků. Na jaký rozkaz tu jsi?
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
	description	= "Musím přinést lordu Hagenovi důkaz, že draci existují.";
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
	AI_Output (other, self, "DIA_Marcos_Hagen_15_00");//Musím přinést lordu Hagenovi důkaz, že draci existují.
	AI_Output (self, other, "DIA_Marcos_Hagen_04_01");//Pak bys neměl ztrácet čas a zbytečně riskovat život.
	AI_Output (self, other, "DIA_Marcos_Hagen_04_02");//Myslíš, že tady najdeš dračí šupinu, kterou bys mu mohl přinést?
	AI_Output (self, other, "DIA_Marcos_Hagen_04_03");//Zkus se dostat do hradu a promluvit si s velitelem Garondem.
	AI_Output (self, other, "DIA_Marcos_Hagen_04_04");//Musí se dozvědět, že tě posílá lord Hagen! Postará se o to, aby ses nevrátil s prázdnou.
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
	description	= "Přicházím od Garonda...";
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
	AI_Output (other, self, "DIA_Marcos_Garond_15_00");//Přicházím od Garonda. Potřebuje vědět, kolik rudy je připraveno k převozu.
	AI_Output (self, other, "DIA_Marcos_Garond_04_01");//Vyřiď Garondovi, že jsem musel opustit důl, protože útoky skřetů začaly být příliš nebezpečné.
	AI_Output (self, other, "DIA_Marcos_Garond_04_02");//Snažil jsem se dostat ke hradu ještě s několika dalšími, ale přežil jsem nakonec jen já.
	AI_Output (self, other, "DIA_Marcos_Garond_04_03");//Uložil jsem rudu do bezpečí. Jsou to ČTYŘI truhly. Běž za Garondem a nahlas mu to.
	AI_Output (self, other, "DIA_Marcos_Garond_04_04");//Řekni mu, že budu rudu střežit vlastním životem. Ale netuším, za jak dlouho mě tu skřeti vypátrají.
	AI_Output (self, other, "DIA_Marcos_Garond_04_05");//Vyřiď mu, aby mi poslal někoho na pomoc.
	AI_Output (other, self, "DIA_Marcos_Garond_15_06");//Vyřídím mu to.
	
	B_LogEntry (TOPIC_ScoutMine,"V malém údolíčku střeží paladin Marcos ČTYŘI bedny rudy.");
	
	Log_CreateTopic (Topic_MarcosJungs,LOG_MISSION);
	Log_SetTopicStatus (Topic_MarcosJungs,LOG_RUNNING);
	B_LogEntry (Topic_MarcosJungs,"Marcos žádá, aby mu Garond poslal nějakou pomoc.");
	
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
		AI_Output (self, other, "DIA_Marcos_Perm_04_01");//Potřebuju pořádný lok léčivého lektvaru!
		B_UseItem (self, ItPo_Health_03);  
		
	}
	else if (MIS_Marcos_Jungs == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_02");//Vydržím - ale doufám, že mi Garond brzy pošle posily.
	}
	else if (MIS_Marcos_Jungs == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_03");//Děkuji ti za pomoc. Innos nám dá sílu, abychom stáli pevně jako skála.
		
		if (Marcos_einmalig == FALSE)
		{
			B_GivePlayerXP(XP_Marcos_Jungs);
			Marcos_einmalig = TRUE;
		};
	}
	else 
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_04");//Budu stát pevně, protože je Innos se mnou!
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


	
	
	
	
	
	

	

	
	

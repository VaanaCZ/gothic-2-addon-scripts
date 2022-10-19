//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_EXIT   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 999;
	condition   = DIA_Addon_Tom_EXIT_Condition;
	information = DIA_Addon_Tom_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Tom_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Tom_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Tom_PICKPOCKET (C_INFO)
{
	npc			= BDT_1080_Addon_Tom;
	nr			= 900;
	condition	= DIA_Addon_Tom_PICKPOCKET_Condition;
	information	= DIA_Addon_Tom_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Tom_PICKPOCKET_Condition()
{
	C_Beklauen (40, 52);
};
 
FUNC VOID DIA_Addon_Tom_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Tom_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Tom_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Tom_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Tom_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Tom_PICKPOCKET_DoIt);
};

func void DIA_Addon_Tom_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Tom_PICKPOCKET);
};
	
func void DIA_Addon_Tom_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Tom_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info HI
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_HI   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 1;
	condition   = DIA_Addon_Tom_HI_Condition;
	information = DIA_Addon_Tom_HI_Info;
	permanent   = FALSE;
	description = "Proè tu tak vysedáváš?";
};
FUNC INT DIA_Addon_Tom_HI_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Tom_HI_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_HI_15_00"); //Proèpak tu tak vysedáváš?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_01"); //Mám problémy. A protože je mi život milej, snažím se, abych se v táboâe nêjakou chvíli neukázal.
	AI_Output (other,self,"DIA_Addon_Tom_HI_15_02"); //Co se dêje?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_03"); //S pár pirátama jsem mêl fakt dobrý vztahy, chápeš?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_04"); //Vždycky jsem se s nima scházel za táborem a obchodovali jsme.
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_05"); //Jojo, kupoval jsem vêci pro pùlku tábora. 'Tome, pâines mi tohle, Tome, pâines mi támhleto.'
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_06"); //A pak se do toho vložil ten hajzl Esteban.
};
//---------------------------------------------------------------------
//	Info Juan
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_Juan   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 2;
	condition   = DIA_Addon_Tom_Juan_Condition;
	information = DIA_Addon_Tom_Juan_Info;
	permanent   = FALSE;
	description = "Co se stalo?";
};
FUNC INT DIA_Addon_Tom_Juan_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Tom_HI)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_Juan_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_Juan_15_00"); //Co se stalo?
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_01"); //Esteban poslal Juana – to je jeden z jeho hochù, aby si na nás poèíhal. Šmejd jeden.
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_02"); //Zrovna jsem mêl s pirátama rozjednanej kšeft, když se vyloupnul ze tmy a dvêma ranama mê sejmul!
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_03"); //Byl sakra rychlej, to ti povím! Ale ne dost – ještê jsem mu staèil zdrhnout.
	SC_Knows_JuanMurderedAngus = TRUE;
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Takže Hankovu a Angusovu vraždu má na svêdomí Juan. Poèkal si na oba dva a pak je zabil.");
};

//---------------------------------------------------------------------
//	Info Esteban
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_Esteban   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 3;
	condition   = DIA_Addon_Tom_Esteban_Condition;
	information = DIA_Addon_Tom_Esteban_Info;
	permanent   = FALSE;
	description = "A od toho pâepadení se ukrýváš tady?";
};
FUNC INT DIA_Addon_Tom_Esteban_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Tom_Juan)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_Esteban_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_Esteban_15_00"); //A od toho pâepadení se ukrýváš tady?
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_01"); //Napâed jsem se vrátil do tábora a âekl Fiskovi, Hunovi i ostatním, aby se rozlouèili s novým zbožím.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_02"); //A že to všecko spískal Esteban.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_03"); //Jestli Esteban zjistí, že jsem všem âek, že za tím vêzí ON, jsem mrtvej muž.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_04"); //A proto se nemùžu vrátit do tábora.
	
	Tom_tells = TRUE;
};

//---------------------------------------------------------------------
//	Info Dead
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_Dead   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 4;
	condition   = DIA_Addon_Tom_Dead_Condition;
	information = DIA_Addon_Tom_Dead_Info;
	permanent   = FALSE;
	description = "Esteban je mrtvý.";
};
FUNC INT DIA_Addon_Tom_Dead_Condition()
{	
	if (Npc_IsDead (Esteban))
	&& (Npc_KnowsInfo (other,DIA_Addon_Tom_Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_Dead_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_Dead_15_00"); //Esteban je mrtvý.
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_01"); //Vážnê? No èoveèe, to je ale klika!
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_02"); //Kdo to udêlal?
	AI_Output (other,self,"DIA_Addon_Tom_Dead_15_03"); //(zlomyslnê) No, âeknême že nêkdo, koho znáš.
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_04"); //Dík, že jsi za mnou zašel. Teë se teda mùžu vrátit do tábora...
	
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"LAGER");
};

//---------------------------------------------------------------------
// PERM
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_PERM   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 5;
	condition   = DIA_Addon_Tom_PERM_Condition;
	information = DIA_Addon_Tom_PERM_Info;
	permanent   = TRUE;
	description = "Co jinak?";
};
FUNC INT DIA_Addon_Tom_PERM_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Tom_Esteban))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_PERM_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_PERM_15_00"); //Co jinak?

	if (Npc_GetDistToWP (self,"BL_INN_05_B") <= 500)
	{
		AI_Output (self,other,"DIA_Addon_Tom_PERM_11_01"); //Teë už mùžu zase v klidu popíjet Luciinu koâalku.
	}
	else
	{	
		if (Npc_KnowsInfo (other, DIA_Addon_Tom_Dead))
		{
			AI_Output (self,other,"DIA_Addon_Tom_PERM_11_02"); //Teë už se zase mùžu ukázat v táboâe!
		}
		else
		{
			AI_Output (self,other,"DIA_Addon_Tom_PERM_11_03"); //Jinak? Jinak tu budu sedêt a poèítat šutráky.
		};
	};
};





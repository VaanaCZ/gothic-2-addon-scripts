///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Sancho_EXIT   (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 999;
	condition   = DIA_Addon_Sancho_EXIT_Condition;
	information = DIA_Addon_Sancho_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Sancho_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Sancho_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Sancho_PICKPOCKET (C_INFO)
{
	npc			= BDT_1073_Addon_Sancho;
	nr			= 900;
	condition	= DIA_Addon_Sancho_PICKPOCKET_Condition;
	information	= DIA_Addon_Sancho_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Sancho_PICKPOCKET_Condition()
{
	C_Beklauen (50, 40);
};
 
FUNC VOID DIA_Addon_Sancho_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Sancho_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Sancho_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Sancho_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Sancho_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Sancho_PICKPOCKET_DoIt);
};

func void DIA_Addon_Sancho_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Sancho_PICKPOCKET);
};
	
func void DIA_Addon_Sancho_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Sancho_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info HI
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Sancho_HI   (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 2;
	condition   = DIA_Addon_Sancho_HI_Condition;
	information = DIA_Addon_Sancho_HI_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Sancho_HI_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Sancho_HI_Info()
{	
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_00"); //A sakra, novej hoch. (smęje se) Seš tu kvůli zlatu, co?
	AI_Output (other,self,"DIA_Addon_Sancho_HI_15_01"); //Kvůli zlatu?
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_02"); //(smęje se) Nedęlej si ze mę šoufky.
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_03"); //Všichni noví chlapi vždycky chtęli do dolu.
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_04"); //Ale nemysli si, že je to ŕáká brnkačka!

	if (SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry (TOPIC_Addon_RavenKDW, LogText_Addon_RavensGoldmine); 
		Log_AddEntry (TOPIC_Addon_Sklaven, LogText_Addon_RavensGoldmine); 
		B_LogEntry (TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};

	
	SC_KnowsRavensGoldmine = TRUE;
};

//---------------------------------------------------------------------
//	Lager
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Sancho_Lager   (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 2;
	condition   = DIA_Addon_Sancho_Lager_Condition;
	information = DIA_Addon_Sancho_Lager_Info;
	permanent   = FALSE;
	description = "Jak se dostanu do tábora?";
};
FUNC INT DIA_Addon_Sancho_Lager_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Sancho_Lager_Info()
{	
	AI_Output (other,self,"DIA_Addon_Sancho_Lager_15_00"); //Jak se dostanu do tábora?
	AI_Output (self,other,"DIA_Addon_Sancho_Lager_06_01"); //Prostę bęž po chodníku.
	if (!Npc_IsDead(Franco))
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Lager_06_02"); //Ale pokud chceš do dolu, musíš se napâed dostat pâes Franca.
		AI_Output (self,other,"DIA_Addon_Sancho_Lager_06_03"); //Čeká, že všichni noví chlapi tu nejdâív budou chvíli otročit.
	};
	
	Log_CreateTopic (Topic_Addon_Franco,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Franco,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Franco,"Všichni novę pâíchozí musí napâed pracovat v bažinę. Teprve potom můžou vstoupit do dolu.");
};

//---------------------------------------------------------------------
//	Mine
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Sancho_Mine   (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 3;
	condition   = DIA_Addon_Sancho_Mine_Condition;
	information = DIA_Addon_Sancho_Mine_Info;
	permanent   = FALSE;
	description = "Povęz mi nęco o dolu.";
};
FUNC INT DIA_Addon_Sancho_Mine_Condition()
{	
	if (!Npc_IsDead(Franco))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Sancho_Mine_Info()
{	
	AI_Output (other,self,"DIA_Addon_Sancho_Mine_15_00"); //Povęz mi o dolu nęco víc.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_01"); //Dám ti dobrou radu: jestli se tam chceš dostat, snaž se dobâe vycházet s Francem. To je zdejší šéf.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_02"); //Rozhoduje, kdo další půjde dovnitâ.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_03"); //Ale dovnitâ tę pustí, jenom když dokážeš, že nejsi úplný lemro.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_04"); //Tak bęž za ním, aă ti dá ŕákou práci.
	
	B_LogEntry (Topic_Addon_Franco,"FRANCO rozhoduje, kdo se dostane do tábora. Také zadává úkoly.");
};

//---------------------------------------------------------------------
// Wo Franco
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Sancho_Franco (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 4;
	condition   = DIA_Addon_Sancho_Franco_Condition;
	information = DIA_Addon_Sancho_Franco_Info;
	permanent   = FALSE;
	description = "A kde bych toho Franca našel?";
};
FUNC INT DIA_Addon_Sancho_Franco_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Sancho_Mine))
	&& (!Npc_IsDead(Franco))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Sancho_Franco_Info()
{	
	AI_Output (other,self,"DIA_Addon_Sancho_Franco_15_00"); //Kde bych toho Franca našel?
	AI_Output (self,other,"DIA_Addon_Sancho_Franco_06_01"); //Vętšinou postává na dvoâe naproti táboru.
	AI_Output (self,other,"DIA_Addon_Sancho_Franco_06_02"); //Koukej s ním dobâe vycházet, jinak skončíš u ŕáký mizerný dâiny jako já.
	
	B_LogEntry (Topic_Addon_Franco,"Franco se prochází po dvorku pâed táborem.");
};

//---------------------------------------------------------------------
//	Spitzel
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Sancho_Spitzel (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 5;
	condition   = DIA_Addon_Sancho_Spitzel_Condition;
	information = DIA_Addon_Sancho_Spitzel_Info;
	permanent   = FALSE;
	description = "To to tu budeš takhle obcházet poâád?";
};
FUNC INT DIA_Addon_Sancho_Spitzel_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Sancho_Franco))
	|| (Npc_IsDead(Franco))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Sancho_Spitzel_Info()
{	
	AI_Output (other,self,"DIA_Addon_Sancho_Spitzel_15_00");//To tu chceš takhle obcházet poâád?
	AI_Output (self,other,"DIA_Addon_Sancho_Spitzel_06_01");//Mám zkontrolovat všecky nový chlapy, abych vidęl, jestli mezi nima není žádnej špión.
	AI_Output (self,other,"DIA_Addon_Sancho_Spitzel_06_02");//Ale na to můžeš zapomenout, když jsme v takovýhle díâe uprostâed bažiny.
	AI_Output (self,other,"DIA_Addon_Sancho_Spitzel_06_03");//Nikdo nás tu nenajde – a proč by se vůbec nękdo obtęžoval posíláním zvędů?
};

//---------------------------------------------------------------------
//	Info Perm
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Sancho_Perm   (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 99;
	condition   = DIA_Addon_Sancho_Perm_Condition;
	information = DIA_Addon_Sancho_Perm_Info;
	permanent   = TRUE;
	description = "Co je nového?";
};
FUNC INT DIA_Addon_Sancho_Perm_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Sancho_Spitzel)
	{	
		return TRUE;
	};
};
var int Comment_Franco;
var int Comment_Esteban;
FUNC VOID DIA_Addon_Sancho_Perm_Info()
{	
	AI_Output (other,self,"DIA_Addon_Sancho_Perm_15_00");//Co je nového?
	
	if Npc_IsDead (Franco)
	&& (Comment_Franco == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_01");//Doneslo se mi, že jsi zabil Franca. Výbornę.
		
		if !Npc_IsDead (Carlos)
		{
			AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_02");//Ale teë máme za zadkem pro zmęnu Carlose. A ten nedęlá žádný blbosti.
		}
		else
		{
			AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_03");//Tys to vyâídil i s Carlosem? Čoveče, ty seš fakt hnusnej zabiják! Radši mę nech bejt.
		};
		
		Comment_Franco = TRUE;
	}
	else if Npc_IsDead (Esteban)
	&& (Comment_Esteban == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_04");//Slyšel jsem, že jsi zabil Estebana. Ty máš určitę nęco v plánu, co?
		
		Comment_Esteban = TRUE;
	}
	else
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_05");//Zatím se nic novýho nepâihodilo.
	};
	
};






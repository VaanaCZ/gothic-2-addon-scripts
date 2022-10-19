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
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_00"); //A sakra, novej hoch. (smêje se) Seš tu kvùli zlatu, co?
	AI_Output (other,self,"DIA_Addon_Sancho_HI_15_01"); //Kvùli zlatu?
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_02"); //(smêje se) Nedêlej si ze mê šoufky.
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_03"); //Všichni noví chlapi vždycky chtêli do dolu.
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_04"); //Ale nemysli si, že je to àáká brnkaèka!

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
	AI_Output (self,other,"DIA_Addon_Sancho_Lager_06_01"); //Prostê bêž po chodníku.
	if (!Npc_IsDead(Franco))
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Lager_06_02"); //Ale pokud chceš do dolu, musíš se napâed dostat pâes Franca.
		AI_Output (self,other,"DIA_Addon_Sancho_Lager_06_03"); //Èeká, že všichni noví chlapi tu nejdâív budou chvíli otroèit.
	};
	
	Log_CreateTopic (Topic_Addon_Franco,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Franco,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Franco,"Všichni novê pâíchozí musí napâed pracovat v bažinê. Teprve potom mùžou vstoupit do dolu.");
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
	description = "Povêz mi nêco o dolu.";
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
	AI_Output (other,self,"DIA_Addon_Sancho_Mine_15_00"); //Povêz mi o dolu nêco víc.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_01"); //Dám ti dobrou radu: jestli se tam chceš dostat, snaž se dobâe vycházet s Francem. To je zdejší šéf.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_02"); //Rozhoduje, kdo další pùjde dovnitâ.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_03"); //Ale dovnitâ tê pustí, jenom když dokážeš, že nejsi úplný lemro.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_04"); //Tak bêž za ním, aã ti dá àákou práci.
	
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
	AI_Output (self,other,"DIA_Addon_Sancho_Franco_06_01"); //Vêtšinou postává na dvoâe naproti táboru.
	AI_Output (self,other,"DIA_Addon_Sancho_Franco_06_02"); //Koukej s ním dobâe vycházet, jinak skonèíš u àáký mizerný dâiny jako já.
	
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
	AI_Output (self,other,"DIA_Addon_Sancho_Spitzel_06_01");//Mám zkontrolovat všecky nový chlapy, abych vidêl, jestli mezi nima není žádnej špión.
	AI_Output (self,other,"DIA_Addon_Sancho_Spitzel_06_02");//Ale na to mùžeš zapomenout, když jsme v takovýhle díâe uprostâed bažiny.
	AI_Output (self,other,"DIA_Addon_Sancho_Spitzel_06_03");//Nikdo nás tu nenajde – a proè by se vùbec nêkdo obtêžoval posíláním zvêdù?
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
		AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_01");//Doneslo se mi, že jsi zabil Franca. Výbornê.
		
		if !Npc_IsDead (Carlos)
		{
			AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_02");//Ale teë máme za zadkem pro zmênu Carlose. A ten nedêlá žádný blbosti.
		}
		else
		{
			AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_03");//Tys to vyâídil i s Carlosem? Èoveèe, ty seš fakt hnusnej zabiják! Radši mê nech bejt.
		};
		
		Comment_Franco = TRUE;
	}
	else if Npc_IsDead (Esteban)
	&& (Comment_Esteban == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_04");//Slyšel jsem, že jsi zabil Estebana. Ty máš urèitê nêco v plánu, co?
		
		Comment_Esteban = TRUE;
	}
	else
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_05");//Zatím se nic novýho nepâihodilo.
	};
	
};






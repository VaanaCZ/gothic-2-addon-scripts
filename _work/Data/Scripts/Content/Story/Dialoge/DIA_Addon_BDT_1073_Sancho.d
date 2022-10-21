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
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_00"); //A sakra, novej hoch. (smÏje se) Seö tu kv˘li zlatu, co?
	AI_Output (other,self,"DIA_Addon_Sancho_HI_15_01"); //Kv˘li zlatu?
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_02"); //(smÏje se) NedÏlej si ze mÏ öoufky.
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_03"); //Vöichni novÌ chlapi vûdycky chtÏli do dolu.
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_04"); //Ale nemysli si, ûe je to Ú·k· brnkaËka!

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
	description = "Jak se dostanu do t·bora?";
};
FUNC INT DIA_Addon_Sancho_Lager_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Sancho_Lager_Info()
{	
	AI_Output (other,self,"DIA_Addon_Sancho_Lager_15_00"); //Jak se dostanu do t·bora?
	AI_Output (self,other,"DIA_Addon_Sancho_Lager_06_01"); //ProstÏ bÏû po chodnÌku.
	if (!Npc_IsDead(Franco))
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Lager_06_02"); //Ale pokud chceö do dolu, musÌö se nap¯ed dostat p¯es Franca.
		AI_Output (self,other,"DIA_Addon_Sancho_Lager_06_03"); //»ek·, ûe vöichni novÌ chlapi tu nejd¯Ìv budou chvÌli otroËit.
	};
	
	Log_CreateTopic (Topic_Addon_Franco,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Franco,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Franco,"Vöichni novÏ p¯ÌchozÌ musÌ nap¯ed pracovat v baûinÏ. Teprve potom m˘ûou vstoupit do dolu.");
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
	description = "PovÏz mi nÏco o dolu.";
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
	AI_Output (other,self,"DIA_Addon_Sancho_Mine_15_00"); //PovÏz mi o dolu nÏco vÌc.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_01"); //D·m ti dobrou radu: jestli se tam chceö dostat, snaû se dob¯e vych·zet s Francem. To je zdejöÌ öÈf.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_02"); //Rozhoduje, kdo dalöÌ p˘jde dovnit¯.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_03"); //Ale dovnit¯ tÏ pustÌ, jenom kdyû dok·ûeö, ûe nejsi ˙pln˝ lemro.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_04"); //Tak bÏû za nÌm, aù ti d· Ú·kou pr·ci.
	
	B_LogEntry (Topic_Addon_Franco,"FRANCO rozhoduje, kdo se dostane do t·bora. TakÈ zad·v· ˙koly.");
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
	description = "A kde bych toho Franca naöel?";
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
	AI_Output (other,self,"DIA_Addon_Sancho_Franco_15_00"); //Kde bych toho Franca naöel?
	AI_Output (self,other,"DIA_Addon_Sancho_Franco_06_01"); //VÏtöinou post·v· na dvo¯e naproti t·boru.
	AI_Output (self,other,"DIA_Addon_Sancho_Franco_06_02"); //Koukej s nÌm dob¯e vych·zet, jinak skonËÌö u Ú·k˝ mizern˝ d¯iny jako j·.
	
	B_LogEntry (Topic_Addon_Franco,"Franco se proch·zÌ po dvorku p¯ed t·borem.");
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
	description = "To to tu budeö takhle obch·zet po¯·d?";
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
	AI_Output (other,self,"DIA_Addon_Sancho_Spitzel_15_00");//To tu chceö takhle obch·zet po¯·d?
	AI_Output (self,other,"DIA_Addon_Sancho_Spitzel_06_01");//M·m zkontrolovat vöecky nov˝ chlapy, abych vidÏl, jestli mezi nima nenÌ û·dnej öpiÛn.
	AI_Output (self,other,"DIA_Addon_Sancho_Spitzel_06_02");//Ale na to m˘ûeö zapomenout, kdyû jsme v takov˝hle dÌ¯e uprost¯ed baûiny.
	AI_Output (self,other,"DIA_Addon_Sancho_Spitzel_06_03");//Nikdo n·s tu nenajde ñ a proË by se v˘bec nÏkdo obtÏûoval posÌl·nÌm zvÏd˘?
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
	description = "Co je novÈho?";
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
	AI_Output (other,self,"DIA_Addon_Sancho_Perm_15_00");//Co je novÈho?
	
	if Npc_IsDead (Franco)
	&& (Comment_Franco == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_01");//Doneslo se mi, ûe jsi zabil Franca. V˝bornÏ.
		
		if !Npc_IsDead (Carlos)
		{
			AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_02");//Ale teÔ m·me za zadkem pro zmÏnu Carlose. A ten nedÏl· û·dn˝ blbosti.
		}
		else
		{
			AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_03");//Tys to vy¯Ìdil i s Carlosem? »oveËe, ty seö fakt hnusnej zabij·k! Radöi mÏ nech bejt.
		};
		
		Comment_Franco = TRUE;
	}
	else if Npc_IsDead (Esteban)
	&& (Comment_Esteban == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_04");//Slyöel jsem, ûe jsi zabil Estebana. Ty m·ö urËitÏ nÏco v pl·nu, co?
		
		Comment_Esteban = TRUE;
	}
	else
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_05");//ZatÌm se nic nov˝ho nep¯ihodilo.
	};
	
};






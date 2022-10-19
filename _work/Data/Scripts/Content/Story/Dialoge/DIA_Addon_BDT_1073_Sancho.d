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
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_00"); //A sakra, novej hoch. (sm�je se) Se� tu kv�li zlatu, co?
	AI_Output (other,self,"DIA_Addon_Sancho_HI_15_01"); //Kv�li zlatu?
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_02"); //(sm�je se) Ned�lej si ze m� �oufky.
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_03"); //V�ichni nov� chlapi v�dycky cht�li do dolu.
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_04"); //Ale nemysli si, �e je to ��k� brnka�ka!

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
	description = "Jak se dostanu do t�bora?";
};
FUNC INT DIA_Addon_Sancho_Lager_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Sancho_Lager_Info()
{	
	AI_Output (other,self,"DIA_Addon_Sancho_Lager_15_00"); //Jak se dostanu do t�bora?
	AI_Output (self,other,"DIA_Addon_Sancho_Lager_06_01"); //Prost� b� po chodn�ku.
	if (!Npc_IsDead(Franco))
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Lager_06_02"); //Ale pokud chce� do dolu, mus� se nap�ed dostat p�es Franca.
		AI_Output (self,other,"DIA_Addon_Sancho_Lager_06_03"); //�ek�, �e v�ichni nov� chlapi tu nejd��v budou chv�li otro�it.
	};
	
	Log_CreateTopic (Topic_Addon_Franco,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Franco,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Franco,"V�ichni nov� p��choz� mus� nap�ed pracovat v ba�in�. Teprve potom m��ou vstoupit do dolu.");
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
	description = "Pov�z mi n�co o dolu.";
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
	AI_Output (other,self,"DIA_Addon_Sancho_Mine_15_00"); //Pov�z mi o dolu n�co v�c.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_01"); //D�m ti dobrou radu: jestli se tam chce� dostat, sna� se dob�e vych�zet s Francem. To je zdej�� ��f.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_02"); //Rozhoduje, kdo dal�� p�jde dovnit�.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_03"); //Ale dovnit� t� pust�, jenom kdy� dok�e�, �e nejsi �pln� lemro.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_04"); //Tak b� za n�m, a� ti d� ��kou pr�ci.
	
	B_LogEntry (Topic_Addon_Franco,"FRANCO rozhoduje, kdo se dostane do t�bora. Tak� zad�v� �koly.");
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
	description = "A kde bych toho Franca na�el?";
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
	AI_Output (other,self,"DIA_Addon_Sancho_Franco_15_00"); //Kde bych toho Franca na�el?
	AI_Output (self,other,"DIA_Addon_Sancho_Franco_06_01"); //V�t�inou post�v� na dvo�e naproti t�boru.
	AI_Output (self,other,"DIA_Addon_Sancho_Franco_06_02"); //Koukej s n�m dob�e vych�zet, jinak skon�� u ��k� mizern� d�iny jako j�.
	
	B_LogEntry (Topic_Addon_Franco,"Franco se proch�z� po dvorku p�ed t�borem.");
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
	description = "To to tu bude� takhle obch�zet po��d?";
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
	AI_Output (other,self,"DIA_Addon_Sancho_Spitzel_15_00");//To tu chce� takhle obch�zet po��d?
	AI_Output (self,other,"DIA_Addon_Sancho_Spitzel_06_01");//M�m zkontrolovat v�ecky nov� chlapy, abych vid�l, jestli mezi nima nen� ��dnej �pi�n.
	AI_Output (self,other,"DIA_Addon_Sancho_Spitzel_06_02");//Ale na to m��e� zapomenout, kdy� jsme v takov�hle d��e uprost�ed ba�iny.
	AI_Output (self,other,"DIA_Addon_Sancho_Spitzel_06_03");//Nikdo n�s tu nenajde � a pro� by se v�bec n�kdo obt�oval pos�l�n�m zv�d�?
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
	description = "Co je nov�ho?";
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
	AI_Output (other,self,"DIA_Addon_Sancho_Perm_15_00");//Co je nov�ho?
	
	if Npc_IsDead (Franco)
	&& (Comment_Franco == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_01");//Doneslo se mi, �e jsi zabil Franca. V�born�.
		
		if !Npc_IsDead (Carlos)
		{
			AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_02");//Ale te� m�me za zadkem pro zm�nu Carlose. A ten ned�l� ��dn� blbosti.
		}
		else
		{
			AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_03");//Tys to vy��dil i s Carlosem? �ove�e, ty se� fakt hnusnej zabij�k! Rad�i m� nech bejt.
		};
		
		Comment_Franco = TRUE;
	}
	else if Npc_IsDead (Esteban)
	&& (Comment_Esteban == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_04");//Sly�el jsem, �e jsi zabil Estebana. Ty m� ur�it� n�co v pl�nu, co?
		
		Comment_Esteban = TRUE;
	}
	else
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_05");//Zat�m se nic nov�ho nep�ihodilo.
	};
	
};






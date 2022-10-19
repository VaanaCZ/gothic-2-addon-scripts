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
	description = "Pro� tu tak vysed�v�?";
};
FUNC INT DIA_Addon_Tom_HI_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Tom_HI_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_HI_15_00"); //Pro�pak tu tak vysed�v�?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_01"); //M�m probl�my. A proto�e je mi �ivot milej, sna��m se, abych se v t�bo�e n�jakou chv�li neuk�zal.
	AI_Output (other,self,"DIA_Addon_Tom_HI_15_02"); //Co se d�je?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_03"); //S p�r pir�tama jsem m�l fakt dobr� vztahy, ch�pe�?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_04"); //V�dycky jsem se s nima sch�zel za t�borem a obchodovali jsme.
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_05"); //Jojo, kupoval jsem v�ci pro p�lku t�bora. 'Tome, p�ines mi tohle, Tome, p�ines mi t�mhleto.'
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_06"); //A pak se do toho vlo�il ten hajzl Esteban.
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
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_01"); //Esteban poslal Juana � to je jeden z jeho hoch�, aby si na n�s po��hal. �mejd jeden.
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_02"); //Zrovna jsem m�l s pir�tama rozjednanej k�eft, kdy� se vyloupnul ze tmy a dv�ma ranama m� sejmul!
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_03"); //Byl sakra rychlej, to ti pov�m! Ale ne dost � je�t� jsem mu sta�il zdrhnout.
	SC_Knows_JuanMurderedAngus = TRUE;
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Tak�e Hankovu a Angusovu vra�du m� na sv�dom� Juan. Po�kal si na oba dva a pak je zabil.");
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
	description = "A od toho p�epaden� se ukr�v� tady?";
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
	AI_Output (other,self,"DIA_Addon_Tom_Esteban_15_00"); //A od toho p�epaden� se ukr�v� tady?
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_01"); //Nap�ed jsem se vr�til do t�bora a �ekl Fiskovi, Hunovi i ostatn�m, aby se rozlou�ili s nov�m zbo��m.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_02"); //A �e to v�ecko sp�skal Esteban.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_03"); //Jestli Esteban zjist�, �e jsem v�em �ek, �e za t�m v�z� ON, jsem mrtvej mu�.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_04"); //A proto se nem��u vr�tit do t�bora.
	
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
	description = "Esteban je mrtv�.";
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
	AI_Output (other,self,"DIA_Addon_Tom_Dead_15_00"); //Esteban je mrtv�.
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_01"); //V�n�? No �ove�e, to je ale klika!
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_02"); //Kdo to ud�lal?
	AI_Output (other,self,"DIA_Addon_Tom_Dead_15_03"); //(zlomysln�) No, �ekn�me �e n�kdo, koho zn�.
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_04"); //D�k, �e jsi za mnou za�el. Te� se teda m��u vr�tit do t�bora...
	
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
		AI_Output (self,other,"DIA_Addon_Tom_PERM_11_01"); //Te� u� m��u zase v klidu pop�jet Luciinu ko�alku.
	}
	else
	{	
		if (Npc_KnowsInfo (other, DIA_Addon_Tom_Dead))
		{
			AI_Output (self,other,"DIA_Addon_Tom_PERM_11_02"); //Te� u� se zase m��u uk�zat v t�bo�e!
		}
		else
		{
			AI_Output (self,other,"DIA_Addon_Tom_PERM_11_03"); //Jinak? Jinak tu budu sed�t a po��tat �utr�ky.
		};
	};
};





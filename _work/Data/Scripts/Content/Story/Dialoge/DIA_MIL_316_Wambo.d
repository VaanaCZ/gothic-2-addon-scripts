// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Wambo_EXIT(C_INFO)
{
	npc			= Mil_316_Wambo;
	nr			= 999;
	condition	= DIA_Wambo_EXIT_Condition;
	information	= DIA_Wambo_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Wambo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Wambo_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Wambo_PICKPOCKET (C_INFO)
{
	npc			= Mil_316_Wambo;
	nr			= 900;
	condition	= DIA_Wambo_PICKPOCKET_Condition;
	information	= DIA_Wambo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Sarebbe rischioso sottrargli la chiave)";
};                       

FUNC INT DIA_Wambo_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_City_Tower_04) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= 40)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Wambo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Wambo_PICKPOCKET);
	Info_AddChoice		(DIA_Wambo_PICKPOCKET, DIALOG_BACK 		,DIA_Wambo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Wambo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Wambo_PICKPOCKET_DoIt);
};

func void DIA_Wambo_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 50)
	{
		B_GiveInvItems (self, other, ItKe_City_Tower_04, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Wambo_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Wambo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Wambo_PICKPOCKET);
};
//*************************************************************
//		Was machst du hier?
//*************************************************************
INSTANCE DIA_Wambo_Job(C_INFO)
{
	npc			= Mil_316_Wambo;
	nr			= 5;
	condition	= DIA_Wambo_Job_Condition;
	information	= DIA_Wambo_Job_Info;
	permanent	= FALSE;
	description = "Cosa stai facendo, qui?";
};                       

FUNC INT DIA_Wambo_Job_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Wambo_Job_Info()
{	
	AI_Output (other,self ,"DIA_Wambo_Job_15_00"); //Cosa stai facendo, qui?
	AI_Output (self ,other,"DIA_Wambo_Job_03_01"); //Faccio in modo che nessuno entri nelle case.
	AI_Output (self ,other,"DIA_Wambo_Job_03_02"); //Ordine esplicito di Lord Hagen. E non pensare nemmeno di violarlo!
};
//*************************************************************
//		Wie ist die Lage?
//*************************************************************
INSTANCE DIA_Wambo_Situation(C_INFO)
{
	npc			= Mil_316_Wambo;
	nr			= 10;
	condition	= DIA_Wambo_Situation_Condition;
	information	= DIA_Wambo_Situation_Info;
	permanent	= TRUE;
	description = "Come vanno le cose?";
};                       

FUNC INT DIA_Wambo_Situation_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Wambo_Job))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Wambo_Situation_Info()
{	
	AI_Output (other,self ,"DIA_Wambo_Situation_15_00"); //Come vanno le cose?
	AI_Output (self ,other,"DIA_Wambo_Situation_03_01"); //Attualmente è tutto tranquillo.
};
//*************************************************************
//		Ramirez
//*************************************************************
INSTANCE DIA_Wambo_Ramirez(C_INFO)
{
	npc			= Mil_316_Wambo;
	nr			= 5;
	condition	= DIA_Wambo_Ramirez_Condition;
	information	= DIA_Wambo_Ramirez_Info;
	permanent	= FALSE;
	description = "Mi manda il nostro amico in comune Ramirez.";
};                       

FUNC INT DIA_Wambo_Ramirez_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Ramirez_Viertel))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Wambo_Ramirez_Info()
{	
	AI_Output (other,self ,"DIA_Wambo_Ramirez_15_00"); //Mi manda il nostro amico in comune Ramirez.
	AI_Output (self ,other,"DIA_Wambo_Ramirez_03_01"); //Oh? Quel Ramirez è uno sporco ratto. E non è mio amico. Non importa. Hai qualcosa per me?
	AI_Output (other,self ,"DIA_Wambo_Ramirez_15_02"); //Dipende da ciò che vuoi.
	AI_PlayAni (self, "T_SEARCH");
	AI_Output (self ,other,"DIA_Wambo_Ramirez_03_03"); //(a bassa voce) D’accordo, ti dirò come funziona. Tu mi paghi 250 monete d'oro e io non mi farò vedere qui di notte.
	AI_Output (self ,other,"DIA_Wambo_Ramirez_03_04"); //Se, tuttavia, tu dovessi essere avvistato e io mi trovassi in zona, l'accordo salterà.
};
//*************************************************************
//	Deal
//*************************************************************
INSTANCE DIA_Wambo_Deal(C_INFO)
{
	npc			= Mil_316_Wambo;
	nr			= 5;
	condition	= DIA_Wambo_Deal_Condition;
	information	= DIA_Wambo_Deal_Info;
	permanent	= TRUE;
	description = "(Paga 250 monete d’oro)";
};                       
//-----------------------------------
var int DIA_Wambo_Deal_permanent;
//-----------------------------------
FUNC INT DIA_Wambo_Deal_Condition()
{
	if Npc_KnowsInfo (other,DIA_Wambo_Ramirez)
	&& (DIA_Wambo_Deal_permanent == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Wambo_Deal_Info()
{	
	AI_Output (other,self ,"DIA_Wambo_Deal_15_00"); //Ho i tuoi soldi...
	
	if B_GiveInvItems (other, self, ItMi_Gold, 250)
	{
		AI_Output (self ,other,"DIA_Wambo_Deal_03_01"); //Bene, allora sparirò... da ora.
		AI_Output (self ,other,"DIA_Wambo_Deal_03_02"); //E ricordati, se dovessi causarmi dei guai, io non ti conosco.
		
		DIA_Wambo_Deal_permanent = TRUE;
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine (self, "DRINK");
	}
	else
	{
		AI_Output (other,self ,"DIA_Wambo_Deal_15_03"); //...ma non li ho con me in questo momento.
		AI_Output (self ,other,"DIA_Wambo_Deal_03_04"); //Non sopporto quando qualcuno cerca di fregarmi. Vai a prendere i soldi.
		AI_StopProcessInfos (self);
	};
};

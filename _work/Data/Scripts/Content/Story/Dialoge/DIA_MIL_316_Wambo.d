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
	description = "(Krádež tohoto klíèe by byla riskantní)";
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
	description = "Co tady dêláš?";
};                       

FUNC INT DIA_Wambo_Job_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Wambo_Job_Info()
{	
	AI_Output (other,self ,"DIA_Wambo_Job_15_00"); //Co tady dêláš?
	AI_Output (self ,other,"DIA_Wambo_Job_03_01"); //Starám se o to, aby nikdo nevešel dovnitâ.
	AI_Output (self ,other,"DIA_Wambo_Job_03_02"); //Výslovný rozkaz od lorda Hagena. A ani nemysli na to, že by ses tomu rozkazu protivil!
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
	description = "Jak se vede?";
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
	AI_Output (other,self ,"DIA_Wambo_Situation_15_00"); //Jak se vede?
	AI_Output (self ,other,"DIA_Wambo_Situation_03_01"); //V tuhle chvíli je všechno v klidu.
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
	description = "Pâicházím od našeho spoleèného pâítele Ramireze.";
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
	AI_Output (other,self ,"DIA_Wambo_Ramirez_15_00"); //Pâicházím od našeho spoleèného pâítele Ramireze.
	AI_Output (self ,other,"DIA_Wambo_Ramirez_03_01"); //Cože? Ten Ramirez je pêkná krysa. A není žádný mùj pâítel. To je jedno. Pâinášíš mi nêco?
	AI_Output (other,self ,"DIA_Wambo_Ramirez_15_02"); //To záleží na tom, co chceš.
	AI_PlayAni (self, "T_SEARCH");
	AI_Output (self ,other,"DIA_Wambo_Ramirez_03_03"); //(tiše) Dobrá, âeknu ti, jak to chodí. Zaplatíš 250 zlatých. Pak tady v noci nebudu.
	AI_Output (self ,other,"DIA_Wambo_Ramirez_03_04"); //Pokud bys ale byl pâíliš nápadný a já tady pâece jenom byl, tak z obchodu sešlo.
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
	description = "(Zaplatit 250 zlaãákù)";
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
	AI_Output (other,self ,"DIA_Wambo_Deal_15_00"); //Mám pro tebe ty peníze...
	
	if B_GiveInvItems (other, self, ItMi_Gold, 250)
	{
		AI_Output (self ,other,"DIA_Wambo_Deal_03_01"); //Dobrá, tak já naveèer zmizím.
		AI_Output (self ,other,"DIA_Wambo_Deal_03_02"); //A nezapomeà - kdybys dêlal nêjaké problémy, tak tê neznám.
		
		DIA_Wambo_Deal_permanent = TRUE;
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine (self, "DRINK");
	}
	else
	{
		AI_Output (other,self ,"DIA_Wambo_Deal_15_03"); //...ale ne zrovna u sebe.
		AI_Output (self ,other,"DIA_Wambo_Deal_03_04"); //Nesnáším, když ze mê nêkdo dêlá šaška. Tak pâines to zlato.
		AI_StopProcessInfos (self);
	};
};

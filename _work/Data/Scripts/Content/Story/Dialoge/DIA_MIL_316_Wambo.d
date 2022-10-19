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
	description = "(Kr·deû tohoto klÌËe by byla riskantnÌ)";
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
	description = "Co tady dÏl·ö?";
};                       

FUNC INT DIA_Wambo_Job_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Wambo_Job_Info()
{	
	AI_Output (other,self ,"DIA_Wambo_Job_15_00"); //Co tady dÏl·ö?
	AI_Output (self ,other,"DIA_Wambo_Job_03_01"); //Star·m se o to, aby nikdo neveöel dovnit¯.
	AI_Output (self ,other,"DIA_Wambo_Job_03_02"); //V˝slovn˝ rozkaz od lorda Hagena. A ani nemysli na to, ûe by ses tomu rozkazu protivil!
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
	AI_Output (self ,other,"DIA_Wambo_Situation_03_01"); //V tuhle chvÌli je vöechno v klidu.
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
	description = "P¯ich·zÌm od naöeho spoleËnÈho p¯Ìtele Ramireze.";
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
	AI_Output (other,self ,"DIA_Wambo_Ramirez_15_00"); //P¯ich·zÌm od naöeho spoleËnÈho p¯Ìtele Ramireze.
	AI_Output (self ,other,"DIA_Wambo_Ramirez_03_01"); //Coûe? Ten Ramirez je pÏkn· krysa. A nenÌ û·dn˝ m˘j p¯Ìtel. To je jedno. P¯in·öÌö mi nÏco?
	AI_Output (other,self ,"DIA_Wambo_Ramirez_15_02"); //To z·leûÌ na tom, co chceö.
	AI_PlayAni (self, "T_SEARCH");
	AI_Output (self ,other,"DIA_Wambo_Ramirez_03_03"); //(tiöe) Dobr·, ¯eknu ti, jak to chodÌ. ZaplatÌö 250 zlat˝ch. Pak tady v noci nebudu.
	AI_Output (self ,other,"DIA_Wambo_Ramirez_03_04"); //Pokud bys ale byl p¯Ìliö n·padn˝ a j· tady p¯ece jenom byl, tak z obchodu seölo.
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
	description = "(Zaplatit 250 zlaù·k˘)";
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
	AI_Output (other,self ,"DIA_Wambo_Deal_15_00"); //M·m pro tebe ty penÌze...
	
	if B_GiveInvItems (other, self, ItMi_Gold, 250)
	{
		AI_Output (self ,other,"DIA_Wambo_Deal_03_01"); //Dobr·, tak j· naveËer zmizÌm.
		AI_Output (self ,other,"DIA_Wambo_Deal_03_02"); //A nezapomeÚ - kdybys dÏlal nÏjakÈ problÈmy, tak tÏ nezn·m.
		
		DIA_Wambo_Deal_permanent = TRUE;
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine (self, "DRINK");
	}
	else
	{
		AI_Output (other,self ,"DIA_Wambo_Deal_15_03"); //...ale ne zrovna u sebe.
		AI_Output (self ,other,"DIA_Wambo_Deal_03_04"); //Nesn·öÌm, kdyû ze mÏ nÏkdo dÏl· öaöka. Tak p¯ines to zlato.
		AI_StopProcessInfos (self);
	};
};

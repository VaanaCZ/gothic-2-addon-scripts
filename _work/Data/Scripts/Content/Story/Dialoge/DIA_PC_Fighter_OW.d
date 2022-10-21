
// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_GornOW_EXIT(C_INFO)
{
	npc			= PC_Fighter_OW;
	nr			= 999;
	condition	= DIA_GornOW_EXIT_Condition;
	information	= DIA_GornOW_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_GornOW_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_GornOW_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  Hallo
// ************************************************************
INSTANCE DIA_GornOW_Hello (C_INFO)
{
	npc			= PC_Fighter_OW;
	nr			= 2;
	condition	= DIA_GornOW_Hello_Condition;
	information	= DIA_GornOW_Hello_Info;
	permanent	= FALSE;
	IMPORTANT 	= TRUE;
};                       

FUNC INT DIA_GornOW_Hello_Condition()
{
		return TRUE;
};
 
FUNC VOID DIA_GornOW_Hello_Info()
{	

	VAR C_NPC Milten;
	Milten			= Hlp_GetNpc(PC_Mage_OW);
	
	AI_Output	(other,self ,"DIA_GornOW_Hello_15_00");	//Doœæ tego wylegiwania! Jesteœ wolny!
	AI_Output 	(self ,other,"DIA_GornOW_Hello_12_01"); //Najwy¿szy czas, ¿eby ktoœ mnie st¹d wyci¹gn¹³.
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_02");	//Ale w ¿yciu bym siê nie spodziewa³, ¿e to bêdziesz ty! Dobrze ciê znowu widzieæ!
	AI_Output	(other,self ,"DIA_GornOW_Hello_15_03");	//Garond narzeka, ¿e za du¿o jesz i nie mo¿e sobie pozwoliæ na utrzymywanie takiego darmozjada.
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_04");	//Skoro ju¿ o tym mowa - napi³bym siê dobrego piwa! ChodŸmy st¹d, zbrzyd³a mi ta cela.
	
	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other,"DIA_GornOW_Add_12_00"); //Czekaj chwilê. Mam tutaj coœ, co mo¿e ci siê przydaæ.
		AI_Output (self ,other,"DIA_GornOW_Add_12_01"); //Znalaz³em w celi tê zbrojê. Jakiœ wiêzieñ musia³ j¹ tutaj ukryæ.
		B_GiveInvItems (self, other, itar_sld_M, 1);
		AI_Output (self ,other,"DIA_GornOW_Add_12_02"); //Na mnie jest za ma³a, ale na ciebie powinna pasowaæ.
		AI_Output (other,self ,"DIA_GornOW_Add_15_03"); //Dziêki! Zobaczymy siê u Miltena...
	}
	else
	{
		AI_Output 	(other,self ,"DIA_GornOW_Hello_15_05");	//W porz¹dku. Zobaczymy siê u Miltena.
	};
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_06");	//Jasna sprawa!
	
	AI_StopProcessInfos (self);
	
	Npc_ExchangeRoutine	(self,"FREE"); 
	B_StartOtherRoutine (Milten,"GORNFREE");
	MIS_RescueGorn = LOG_SUCCESS;
	B_GivePlayerXP (XP_RescueGorn);
};

// ************************************************************
// 			Bei Milten
// ************************************************************
INSTANCE DIA_GornOW_MetMilten (C_INFO)
{
	npc			= PC_Fighter_OW;
	nr			= 2;
	condition	= DIA_GornOW_MetMilten_Condition;
	information	= DIA_GornOW_MetMilten_Info;
	permanent	= FALSE;
	IMPORTANT 	= TRUE;
};                       

FUNC INT DIA_GornOW_MetMilten_Condition()
{
	if (Mis_RescueGorn == LOG_SUCCESS)
	&& (Npc_GetDistToWP	(self,"OC_MAGE_LIBRARY_IN") <=	500) 
	&&  Npc_IsInState (self, ZS_Talk)
	&& (Kapitel == 2)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_GornOW_MetMilten_Info()
{	
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_00");//S³uchaj, doœæ siê ju¿ tutaj wynudzi³em. Mam wielk¹ ochotê rozejrzeæ siê trochê poza dolin¹.
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_01");//Jak siê przedosta³eœ przez prze³êcz?
	AI_Output (other, self,"DIA_GornOW_MetMilten_15_02");//Znalaz³em ukryt¹ œcie¿kê, która prowadzi przez opuszczon¹ kopalniê.
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_03");//Œwietnie. Zaczekam na w³aœciw¹ chwilê, a potem dam st¹d nogê.
	
	if (other.guild != GIL_SLD)
	{
		AI_Output (other, self,"DIA_GornOW_MetMilten_15_04");//Dok¹d pójdziesz?
		AI_Output (self ,other,"DIA_GornOW_MetMilten_12_05");//Podobno Lee jeszcze ¿yje. Spróbujê znowu do niego do³¹czyæ.
	}
	else
	{
		AI_Output (other, self,"DIA_GornOW_MetMilten_15_06");//W takim razie idŸ na farmê Onara. Znajdziesz tam Lee i jego ch³opców. Na pewno uciesz¹ siê na twój widok.
		AI_Output (self ,other,"DIA_GornOW_MetMilten_12_07");//Tak zrobiê! Dziêki za cynk.
	};
};	

// ************************************************************
// 	Perm Kap.2
// ************************************************************
INSTANCE DIA_GornOW_SeeYou (C_INFO)
{
	npc			= PC_Fighter_OW;
	nr			= 900;
	condition	= DIA_GornOW_SeeYou_Condition;
	information	= DIA_GornOW_Seeyou_Info;
	permanent	= TRUE;
	description = "Jeszcze siê spotkamy.";
};                       
FUNC INT DIA_GornOW_SeeYou_Condition()
{
	if Npc_KnowsInfo (other,DIA_GornOW_MetMilten)
	&& (Kapitel == 2)
	{	
		return TRUE;
	};
};
 
FUNC VOID DIA_GornOW_SeeYou_Info()
{	
	AI_Output	(other,self ,"DIA_GornOW_SeeYou_15_00");//Jeszcze siê spotkamy.
	AI_Output	(self ,other,"DIA_GornOW_SeeYou_12_01");//Mo¿esz na to liczyæ.
	
	/*
	if (other.guild == GIL_KDF)
	{
		AI_Output	(self ,other,"DIA_GornOW_SeeYou_12_01");//
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output	(self ,other,"DIA_GornOW_SeeYou_12_01");//
	}
	else //SLD
	{
		AI_Output	(self ,other,"DIA_GornOW_SeeYou_12_01");//
	};
	*/
	AI_StopProcessInfos (self);
};	

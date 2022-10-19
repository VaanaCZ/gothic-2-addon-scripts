
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
	
	AI_Output	(other,self ,"DIA_GornOW_Hello_15_00");	//Do�� tego wylegiwania! Jeste� wolny!
	AI_Output 	(self ,other,"DIA_GornOW_Hello_12_01"); //Najwy�szy czas, �eby kto� mnie st�d wyci�gn��.
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_02");	//Ale w �yciu bym si� nie spodziewa�, �e to b�dziesz ty! Dobrze ci� znowu widzie�!
	AI_Output	(other,self ,"DIA_GornOW_Hello_15_03");	//Garond narzeka, �e za du�o jesz i nie mo�e sobie pozwoli� na utrzymywanie takiego darmozjada.
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_04");	//Skoro ju� o tym mowa - napi�bym si� dobrego piwa! Chod�my st�d, zbrzyd�a mi ta cela.
	
	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other,"DIA_GornOW_Add_12_00"); //Czekaj chwil�. Mam tutaj co�, co mo�e ci si� przyda�.
		AI_Output (self ,other,"DIA_GornOW_Add_12_01"); //Znalaz�em w celi t� zbroj�. Jaki� wi�zie� musia� j� tutaj ukry�.
		B_GiveInvItems (self, other, itar_sld_M, 1);
		AI_Output (self ,other,"DIA_GornOW_Add_12_02"); //Na mnie jest za ma�a, ale na ciebie powinna pasowa�.
		AI_Output (other,self ,"DIA_GornOW_Add_15_03"); //Dzi�ki! Zobaczymy si� u Miltena...
	}
	else
	{
		AI_Output 	(other,self ,"DIA_GornOW_Hello_15_05");	//W porz�dku. Zobaczymy si� u Miltena.
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
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_00");//S�uchaj, do�� si� ju� tutaj wynudzi�em. Mam wielk� ochot� rozejrze� si� troch� poza dolin�.
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_01");//Jak si� przedosta�e� przez prze��cz?
	AI_Output (other, self,"DIA_GornOW_MetMilten_15_02");//Znalaz�em ukryt� �cie�k�, kt�ra prowadzi przez opuszczon� kopalni�.
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_03");//�wietnie. Zaczekam na w�a�ciw� chwil�, a potem dam st�d nog�.
	
	if (other.guild != GIL_SLD)
	{
		AI_Output (other, self,"DIA_GornOW_MetMilten_15_04");//Dok�d p�jdziesz?
		AI_Output (self ,other,"DIA_GornOW_MetMilten_12_05");//Podobno Lee jeszcze �yje. Spr�buj� znowu do niego do��czy�.
	}
	else
	{
		AI_Output (other, self,"DIA_GornOW_MetMilten_15_06");//W takim razie id� na farm� Onara. Znajdziesz tam Lee i jego ch�opc�w. Na pewno uciesz� si� na tw�j widok.
		AI_Output (self ,other,"DIA_GornOW_MetMilten_12_07");//Tak zrobi�! Dzi�ki za cynk.
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
	description = "Jeszcze si� spotkamy.";
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
	AI_Output	(other,self ,"DIA_GornOW_SeeYou_15_00");//Jeszcze si� spotkamy.
	AI_Output	(self ,other,"DIA_GornOW_SeeYou_12_01");//Mo�esz na to liczy�.
	
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

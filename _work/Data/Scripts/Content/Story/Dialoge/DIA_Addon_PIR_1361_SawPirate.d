// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Addon_SawPirate_EXIT(C_INFO)
{
	npc 		= PIR_1361_Addon_Pirat;
	nr			= 999;
	condition	= DIA_Addon_SawPirate_EXIT_Condition;
	information	= DIA_Addon_SawPirate_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
func INT DIA_Addon_SawPirate_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_SawPirate_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									Hello - PERM
// *************************************************************************
instance DIA_Addon_SawPirate_Hello(C_INFO)
{
	npc 		= PIR_1361_Addon_Pirat;
	nr			= 1;
	condition	= DIA_Addon_SawPirate_Hello_Condition;
	information	= DIA_Addon_SawPirate_Hello_Info;
	permanent	= TRUE;
	description = "Jak se vede?";
};                       
func INT DIA_Addon_SawPirate_Hello_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_SawPirate_Hello_Info()
{	
	AI_Output (other,self,"DIA_Addon_SawPirate_Hello_15_00"); //Jak to jde?
	AI_Output (self,other,"DIA_Addon_SawPirate_Hello_09_01"); //Nech mì bejt.
};

// ************************************************************
// *** 														***
// 						Mitkommen (Henry)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
instance DIA_Addon_SawPirate_Anheuern(C_INFO)
{
	npc			= PIR_1361_Addon_Pirat;
	nr			= 11;
	condition	= DIA_Addon_SawPirate_Anheuern_Condition;
	information	= DIA_Addon_SawPirate_Anheuern_Info;
	permanent	= FALSE;
	description = "Ty patøíš k Henryho hochùm?";
};                       
FUNC INT DIA_Addon_SawPirate_Anheuern_Condition()
{
	if (MIS_Henry_FreeBDTTower == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_SawPirate_Anheuern_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_JoinHenry_15_00"); //Ty patøíš k Henryho chlapùm?
	AI_Output (self, other, "DIA_Addon_SawPirate_Anheuern_09_01"); //Ne, ten strom tu øežu jen tak pro zábavu.
	AI_Output (self, other, "DIA_Addon_SawPirate_Anheuern_09_02"); //Co je? Øek ti Henry, co máš dìlat?
	AI_Output (other,self ,"DIA_Addon_Bones_JoinHenry_15_04"); //Jo, mám pro nìj vyøídit pár banditù.
	AI_Output (self, other, "DIA_Addon_SawPirate_Anheuern_09_03"); //(odmítá) Ale né! Nekoukej na mì tak! Já tam nechci!
	AI_Output (self, other, "DIA_Addon_SawPirate_Anheuern_09_04"); //Jen mì nech v klidu øezat, jo?
};
// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
var int SawPirate_ComeOn_Once;
// ------------------------------------------------------------
instance DIA_Addon_SawPirate_ComeOn(C_INFO)
{
	npc			= PIR_1361_Addon_Pirat;
	nr		 	= 12;
	condition	= DIA_Addon_SawPirate_ComeOn_Condition;
	information	= DIA_Addon_SawPirate_ComeOn_Info;
	permanent	= TRUE;
	description	= "Pojï se mnou.";
};
func int DIA_Addon_SawPirate_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Henry_FreeBDTTower == LOG_RUNNING)
	&& (C_TowerBanditsDead() == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_SawPirate_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_SawPirate_ComeOn_Info ()
{
	AI_Output (other, self, "DIA_Addon_SawPirate_ComeOn_15_00"); //Pojï se mnou.
	if (HammerPirate.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_SawPirate_ComeOn_09_01"); //Proè? Dyk už s sebou nìkoho máš.
	}
	else if (Npc_GetDistToWP (self, "ADW_PIRATECAMP_WAY_08") > 6000)
	{	
		AI_Output (self ,other,"DIA_Addon_SawPirate_ComeOn_09_04"); //Napøed se vrame kousek k táboru.
		AI_StopProcessInfos (self);
	}
	else if (!Npc_IsDead(HammerPirate))
	&& (SawPirate_ComeOn_Once == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_SawPirate_ComeOn_09_02"); //(pro sebe) Taky moh øíct nìkomu jinýmu.
		SawPirate_ComeOn_Once = TRUE;
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	}
	else 
	{
		AI_Output (self ,other,"DIA_Addon_SawPirate_ComeOn_09_03"); //(povzdech) No jo.
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_SawPirate_GoHome(C_INFO)
{
	npc			= PIR_1361_Addon_Pirat;
	nr			= 13;
	condition	= DIA_Addon_SawPirate_GoHome_Condition;
	information	= DIA_Addon_SawPirate_GoHome_Info;
	permanent	= TRUE;
	description = "Už tì nepotøebuju.";
};                       
FUNC INT DIA_Addon_SawPirate_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_SawPirate_GoHome_Info()
{	
	AI_Output (other,self ,"DIA_Addon_SawPirate_GoHome_15_00"); //Už tì nepotøebuju.
	AI_Output (self ,other,"DIA_Addon_SawPirate_GoHome_09_01"); //Tak já teda pùjdu zase øezat.
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START"); 
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_SawPirate_TooFar(C_INFO)
{
	npc			= PIR_1361_Addon_Pirat;
	nr			= 14;
	condition	= DIA_Addon_SawPirate_TooFar_Condition;
	information	= DIA_Addon_SawPirate_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_SawPirate_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP (self, "ADW_PIRATECAMP_WAY_08") > 6000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_SawPirate_TooFar_Info()
{	
	AI_Output (self ,other,"DIA_Addon_SawPirate_TooFar_09_01"); //Už jsme moc daleko od tábora. 
	AI_Output (self ,other,"DIA_Addon_SawPirate_GoHome_09_02"); //Vùbec se mi to nelíbí. Jdu zpátky.
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START");
	
	AI_StopProcessInfos (self); 
};



// ************************************************************
// 			 				SUCCESS
// ************************************************************
INSTANCE DIA_Addon_SawPirate_Success(C_INFO)
{
	npc			= PIR_1361_Addon_Pirat;
	nr			= 14;
	condition	= DIA_Addon_SawPirate_Success_Condition;
	information	= DIA_Addon_SawPirate_Success_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_SawPirate_Success_Condition()
{
	if (C_TowerBanditsDead() == TRUE)
	&& (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_SawPirate_Success_Info()
{	
	AI_Output (self ,other,"DIA_Addon_SawPirate_Success_09_01"); //Víš ty co? Trochu jsem o tom pøemejšlel. Seš pìknej hajzl!
	AI_Output (self ,other,"DIA_Addon_SawPirate_Success_09_02"); //Jdu zpátky do tábora a doufám, že už tì nikdy neuvidím!
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START");
	
	AI_StopProcessInfos (self); 
};








		
		

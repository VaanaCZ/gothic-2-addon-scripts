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
	description = "Co s�ycha�?";
};                       
func INT DIA_Addon_SawPirate_Hello_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_SawPirate_Hello_Info()
{	
	AI_Output (other,self,"DIA_Addon_SawPirate_Hello_15_00"); //Co s�ycha�?
	AI_Output (self,other,"DIA_Addon_SawPirate_Hello_09_01"); //Przesta� mi zawraca� g�ow�!
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
	description = "Jeste� jednym z ch�opak�w Henry'ego?";
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
	AI_Output (other,self ,"DIA_Addon_Bones_JoinHenry_15_00"); //Jeste� jednym z ch�opak�w Henry'ego?
	AI_Output (self, other, "DIA_Addon_SawPirate_Anheuern_09_01"); //Nie, tak sobie pi�uj� dla zabawy! Naprawd�!
	AI_Output (self, other, "DIA_Addon_SawPirate_Anheuern_09_02"); //Co si� dzieje? Henry nie powiedzia� ci, co masz robi�?
	AI_Output (other,self ,"DIA_Addon_Bones_JoinHenry_15_04"); //Tak, powiedzia�, �e mam zaj�� si� bandytami.
	AI_Output (self, other, "DIA_Addon_SawPirate_Anheuern_09_03"); //Ooo nie! Nie patrz tak na mnie! Nie chc� mie� z tym nic wsp�lnego!
	AI_Output (self, other, "DIA_Addon_SawPirate_Anheuern_09_04"); //Lepiej b�dzie, jak wr�c� do roboty, dobra?
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
	description	= "Chod� ze mn�.";
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
	AI_Output (other, self, "DIA_Addon_SawPirate_ComeOn_15_00"); //Chod� ze mn�.
	if (HammerPirate.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_SawPirate_ComeOn_09_01"); //Czemu? Masz ju� kogo� do pomocy...
	}
	else if (Npc_GetDistToWP (self, "ADW_PIRATECAMP_WAY_08") > 6000)
	{	
		AI_Output (self ,other,"DIA_Addon_SawPirate_ComeOn_09_04"); //Najpierw p�jdziemy kawa�ek w kierunku obozu.
		AI_StopProcessInfos (self);
	}
	else if (!Npc_IsDead(HammerPirate))
	&& (SawPirate_ComeOn_Once == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_SawPirate_ComeOn_09_02"); //Jakby innych nie by�o...
		SawPirate_ComeOn_Once = TRUE;
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	}
	else 
	{
		AI_Output (self ,other,"DIA_Addon_SawPirate_ComeOn_09_03"); //Dobrze, dobrze...
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
	description = "Nie potrzebuj� ju� twojej pomocy.";
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
	AI_Output (other,self ,"DIA_Addon_SawPirate_GoHome_15_00"); //Nie potrzebuj� ju� twojej pomocy.
	AI_Output (self ,other,"DIA_Addon_SawPirate_GoHome_09_01"); //To wr�c� do pi�owania.
	
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
	AI_Output (self ,other,"DIA_Addon_SawPirate_TooFar_09_01"); //Oddalili�my si� zbytnio od obozu. 
	AI_Output (self ,other,"DIA_Addon_SawPirate_GoHome_09_02"); //Nie podoba mi si� to. Lepiej wr�c�.
	
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
	AI_Output (self ,other,"DIA_Addon_SawPirate_Success_09_01"); //Kawa� drania z ciebie.
	AI_Output (self ,other,"DIA_Addon_SawPirate_Success_09_02"); //Wracam do obozu. Mam nadziej�, �e ju� si� nie spotkamy!
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START");
	
	AI_StopProcessInfos (self); 
};








		
		

// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Addon_BenchPirate_EXIT(C_INFO)
{
	npc 		= PIR_1363_Addon_Pirat;
	nr			= 999;
	condition	= DIA_Addon_BenchPirate_EXIT_Condition;
	information	= DIA_Addon_BenchPirate_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
func INT DIA_Addon_BenchPirate_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_BenchPirate_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Hello - PERM
// *************************************************************************
instance DIA_Addon_BenchPirate_Hello (C_INFO)
{
	npc 		= PIR_1363_Addon_Pirat;
	nr			= 1;
	condition	= DIA_Addon_BenchPirate_Hello_Condition;
	information	= DIA_Addon_BenchPirate_Hello_Info;
	permanent	= TRUE;
	description = "Co się dzieje?";
};                       
func INT DIA_Addon_BenchPirate_Hello_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_BenchPirate_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Pir_7_Hello_15_00"); //Co się dzieje?
	var int randy;
	randy = Hlp_Random (3);
	
	if (GregIsBack == TRUE)
	{
		if (randy == 0)
		{
			AI_Output (self ,other,"DIA_Addon_Pir_7_Hello_07_01"); //Greg wrócił. W samą porę.
		}
		else if (randy == 1)
		{
			AI_Output (self ,other,"DIA_Addon_Pir_7_Hello_07_02"); //Francis powinien zorganizować trochę drewna na palisadę. Nawet on da sobie z tym radę.
		}
		else 
		{
			AI_Output (self ,other,"DIA_Addon_Pir_7_Hello_07_03"); //Jeśli chodzi o mnie, to bandyci mogą sobie przychodzić. Z kapitanem u naszego boku nic nam nie grozi.
		};
	}
	else
	{
		if (randy == 0)
		{
			AI_Output (self ,other,"DIA_Addon_Pir_7_Hello_07_04"); //Francis, szef obozu, jest zwykłym błaznem. Dlatego nikt nie bierze go na poważnie.
		}
		else if (randy == 1)
		{
			AI_Output (self ,other,"DIA_Addon_Pir_7_Hello_07_05"); //Greg ufa Francisowi, bo ten jest zbyt głupi, żeby kogokolwiek oszukać. Ale żeby zaraz mianować go swoją prawą ręką...
		}
		else
		{
			AI_Output (self ,other,"DIA_Addon_Pir_7_Hello_07_06"); //Jeśli Greg szybko nie wróci i nie zabierze mnie na kolejny rejs, dostanę choroby lądowej.
		};
	};	
};


	
// ************************************************************
// *** 														***
// 						Mitkommen (Greg)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
INSTANCE DIA_Addon_BenchPirate_Anheuern(C_INFO)
{
	npc			= PIR_1363_Addon_Pirat;
	nr			= 11;
	condition	= DIA_Addon_BenchPirate_Anheuern_Condition;
	information	= DIA_Addon_BenchPirate_Anheuern_Info;
	permanent	= FALSE;
	description = "Powinieneś mi pomóc.";
};                       
FUNC INT DIA_Addon_BenchPirate_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_BenchPirate_Anheuern_Info()
{	
	AI_Output (other,self ,"DIA_Addon_BenchPirate_Anheuern_15_00"); //Powinieneś mi pomóc.
	AI_Output (self ,other,"DIA_Addon_BenchPirate_Anheuern_07_01"); //To rozkaz Grega?
	AI_Output (other,self ,"DIA_Addon_BenchPirate_Anheuern_15_08"); //Jasne.
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_BenchPirate_ComeOn(C_INFO)
{
	npc			= PIR_1363_Addon_Pirat;
	nr		 	= 12;
	condition	= DIA_Addon_BenchPirate_ComeOn_Condition;
	information	= DIA_Addon_BenchPirate_ComeOn_Info;
	permanent	= TRUE;
	description	= "Kanion czeka.";
};
func int DIA_Addon_BenchPirate_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_BenchPirate_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_BenchPirate_ComeOn_Info ()
{
	AI_Output	(other, self, "DIA_Addon_BenchPirate_ComeOn_15_01"); //Kanion czeka.
	if (C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_BenchPirate_ComeOn_07_02"); //Doskonale! Tak, wracam tam...
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_BenchPirate_ComeOn_07_01"); //Tak jest, kapitanie!
		if (C_BodyStateContains (self, BS_SIT))
		{
			AI_StandUp (self);
			B_TurnToNpc (self,other);
		};
		AI_StopProcessInfos (self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_BenchPirate_GoHome(C_INFO)
{
	npc			= PIR_1363_Addon_Pirat;
	nr			= 13;
	condition	= DIA_Addon_BenchPirate_GoHome_Condition;
	information	= DIA_Addon_BenchPirate_GoHome_Info;
	permanent	= TRUE;
	description = "Nie potrzebuję już twojej pomocy.";
};                       
FUNC INT DIA_Addon_BenchPirate_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_BenchPirate_GoHome_Info()
{	
	AI_Output (other,self ,"DIA_Addon_BenchPirate_GoHome_15_00"); //Nie potrzebuję już twojej pomocy.
	AI_Output (self ,other,"DIA_Addon_BenchPirate_GoHome_07_01"); //Będę czekać w obozie, kapitanie!
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START");
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_BenchPirate_TooFar(C_INFO)
{
	npc			= PIR_1363_Addon_Pirat;
	nr			= 14;
	condition	= DIA_Addon_BenchPirate_TooFar_Condition;
	information	= DIA_Addon_BenchPirate_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_BenchPirate_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_BenchPirate_TooFar_Info()
{	
	AI_Output (self ,other,"DIA_Addon_BenchPirate_TooFar_07_01"); //Za bardzo oddaliliśmy się od obozu. 
	AI_Output (self ,other,"DIA_Addon_BenchPirate_GoHome_07_02"); //Nie podoba mi się to.
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self, other, "DIA_Addon_Matt_TooFar_07_02"); //Wracam do obozu!
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Matt_TooFar_07_03"); //Biorę chłopaków i wracamy do obozu!
	};
		
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};

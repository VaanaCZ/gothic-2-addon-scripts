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
	description = "Co si� dzieje?";
};                       
func INT DIA_Addon_BenchPirate_Hello_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_BenchPirate_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Pir_7_Hello_15_00"); //Co si� dzieje?
	var int randy;
	randy = Hlp_Random (3);
	
	if (GregIsBack == TRUE)
	{
		if (randy == 0)
		{
			AI_Output (self ,other,"DIA_Addon_Pir_7_Hello_07_01"); //Greg wr�ci�. W sam� por�.
		}
		else if (randy == 1)
		{
			AI_Output (self ,other,"DIA_Addon_Pir_7_Hello_07_02"); //Francis powinien zorganizowa� troch� drewna na palisad�. Nawet on da sobie z tym rad�.
		}
		else 
		{
			AI_Output (self ,other,"DIA_Addon_Pir_7_Hello_07_03"); //Je�li chodzi o mnie, to bandyci mog� sobie przychodzi�. Z kapitanem u naszego boku nic nam nie grozi.
		};
	}
	else
	{
		if (randy == 0)
		{
			AI_Output (self ,other,"DIA_Addon_Pir_7_Hello_07_04"); //Francis, szef obozu, jest zwyk�ym b�aznem. Dlatego nikt nie bierze go na powa�nie.
		}
		else if (randy == 1)
		{
			AI_Output (self ,other,"DIA_Addon_Pir_7_Hello_07_05"); //Greg ufa Francisowi, bo ten jest zbyt g�upi, �eby kogokolwiek oszuka�. Ale �eby zaraz mianowa� go swoj� praw� r�k�...
		}
		else
		{
			AI_Output (self ,other,"DIA_Addon_Pir_7_Hello_07_06"); //Je�li Greg szybko nie wr�ci i nie zabierze mnie na kolejny rejs, dostan� choroby l�dowej.
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
	description = "Powiniene� mi pom�c.";
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
	AI_Output (other,self ,"DIA_Addon_BenchPirate_Anheuern_15_00"); //Powiniene� mi pom�c.
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
	description = "Nie potrzebuj� ju� twojej pomocy.";
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
	AI_Output (other,self ,"DIA_Addon_BenchPirate_GoHome_15_00"); //Nie potrzebuj� ju� twojej pomocy.
	AI_Output (self ,other,"DIA_Addon_BenchPirate_GoHome_07_01"); //B�d� czeka� w obozie, kapitanie!
	
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
	AI_Output (self ,other,"DIA_Addon_BenchPirate_TooFar_07_01"); //Za bardzo oddalili�my si� od obozu. 
	AI_Output (self ,other,"DIA_Addon_BenchPirate_GoHome_07_02"); //Nie podoba mi si� to.
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self, other, "DIA_Addon_Matt_TooFar_07_02"); //Wracam do obozu!
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Matt_TooFar_07_03"); //Bior� ch�opak�w i wracamy do obozu!
	};
		
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};

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
	description = "Wie sieht's aus?";
};                       
func INT DIA_Addon_BenchPirate_Hello_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_BenchPirate_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Pir_7_Hello_15_00"); //Wie sieht's aus?
	var int randy;
	randy = Hlp_Random (3);
	
	if (GregIsBack == TRUE)
	{
		if (randy == 0)
		{
			AI_Output (self ,other,"DIA_Addon_Pir_7_Hello_07_01"); //Endlich ist Greg wieder da. Das wurde aber auch Zeit.
		}
		else if (randy == 1)
		{
			AI_Output (self ,other,"DIA_Addon_Pir_7_Hello_07_02"); //Francis soll mal Holz für die Palisade besorgen. Das wird er ja wohl noch können.
		}
		else 
		{
			AI_Output (self ,other,"DIA_Addon_Pir_7_Hello_07_03"); //Von mir können die Banditen jetzt kommen. Mit Greg an unserer Seite, können die uns gar nichts.
		};
	}
	else
	{
		if (randy == 0)
		{
			AI_Output (self ,other,"DIA_Addon_Pir_7_Hello_07_04"); //Francis, der Lageranführer, ist 'ne Witzfigur. Den kann doch keiner Ernst nehmen.
		}
		else if (randy == 1)
		{
			AI_Output (self ,other,"DIA_Addon_Pir_7_Hello_07_05"); //Greg vertraut Francis, weil er zu dumm ist, um zu bescheißen! Aber ihn deswegen gleich zum Anführer zu machen....
		}
		else
		{
			AI_Output (self ,other,"DIA_Addon_Pir_7_Hello_07_06"); //Wenn Greg nicht bald wieder kommt und ich endlich wieder Planken unter den Füßen habe, werde ich noch landkrank.
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
	description = "Du sollst mir helfen.";
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
	AI_Output (other,self ,"DIA_Addon_BenchPirate_Anheuern_15_00"); //Du sollst mir helfen.
	AI_Output (self ,other,"DIA_Addon_BenchPirate_Anheuern_07_01"); //Befehl von Greg?
	AI_Output (other,self ,"DIA_Addon_BenchPirate_Anheuern_15_08"); //Du hast es erfasst.
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
	description	= "Der Canyon wartet.";
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
	AI_Output	(other, self, "DIA_Addon_BenchPirate_ComeOn_15_01"); //Der Canyon wartet.
	if (C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_BenchPirate_ComeOn_07_02"); //Genau DAHIN gehe ich ja zurück...
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_BenchPirate_ComeOn_07_01"); //Aye, aye, Käpt'n!
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
	description = "Ich brauch dich nicht mehr.";
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
	AI_Output (other,self ,"DIA_Addon_BenchPirate_GoHome_15_00"); //Ich brauch dich nicht mehr.
	AI_Output (self ,other,"DIA_Addon_BenchPirate_GoHome_07_01"); //Ich bin wieder im Lager, Käpt'n!
	
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
	AI_Output (self ,other,"DIA_Addon_BenchPirate_TooFar_07_01"); //Wir sind zu weit weg vom Lager. 
	AI_Output (self ,other,"DIA_Addon_BenchPirate_GoHome_07_02"); //Das gefällt mir gar nicht.
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self, other, "DIA_Addon_Matt_TooFar_07_02"); //Ich geh zurück zum Lager!
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Matt_TooFar_07_03"); //Ich und die Jungs gehen zurück zum Lager!
	};
		
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};

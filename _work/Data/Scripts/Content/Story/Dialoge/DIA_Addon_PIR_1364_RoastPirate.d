// ************************************************************
// 								Exit
// ************************************************************
instance DIA_Addon_RoastPirate_EXIT(C_INFO)
{
	npc 		= PIR_1364_Addon_Pirat;
	nr			= 999;
	condition	= DIA_Addon_RoastPirate_EXIT_Condition;
	information	= DIA_Addon_RoastPirate_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
func INT DIA_Addon_RoastPirate_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_RoastPirate_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Diese Hitze
// ************************************************************
var int PIR_1364_Grog;
// ------------------------------------------------------------
instance DIA_Addon_RoastPirate_GimmeGrog(C_INFO)
{
	npc 		= PIR_1364_Addon_Pirat;
	nr			= 1;
	condition	= DIA_Addon_RoastPirate_GimmeGrog_Condition;
	information	= DIA_Addon_RoastPirate_GimmeGrog_Info;
	permanent	= TRUE;
	Important 	= TRUE;
};                       
func INT DIA_Addon_RoastPirate_GimmeGrog_Condition()
{
	if (Npc_IsInState (self,ZS_Talk) == TRUE)
	&& (Npc_WasInState (self,ZS_Roast_Scavenger) == TRUE)
	&& (PIR_1364_Grog == FALSE)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_RoastPirate_GimmeGrog_Info()
{	
	AI_Output (self ,other,"DIA_Addon_PIR_6_GimmeGrog_06_00"); //Ech, w gardle mi zasch�o od tego �aru.
	AI_Output (self ,other,"DIA_Addon_PIR_6_GimmeGrog_06_01"); //Ej, ty! Masz dla mnie troch� grogu?
	
	Log_CreateTopic (TOPIC_Addon_RoastGrog,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_RoastGrog,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RoastGrog,"Pirat przy ognisku pilnie potrzebuje grogu.");
	
	Info_ClearChoices (DIA_Addon_RoastPirate_GimmeGrog);
	Info_AddChoice (DIA_Addon_RoastPirate_GimmeGrog,"Nie, nie mam.",DIA_Addon_RoastPirate_GimmeGrog_DontHaveAny);

	if (Npc_HasItems (other,ItFo_addon_Grog) >= 1)
	{
		Info_AddChoice (DIA_Addon_RoastPirate_GimmeGrog,"Masz, poci�gnij sobie.",DIA_Addon_RoastPirate_GimmeGrog_HereIsGrog);
	};	
};
FUNC VOID DIA_Addon_RoastPirate_GimmeGrog_DontHaveAny()
{
	AI_Output (other,self ,"DIA_Addon_PIR_6_GimmeGrog_DontHaveAny_15_00"); //Nie, nie mam.
	AI_Output (self ,other,"DIA_Addon_PIR_6_GimmeGrog_DontHaveAny_06_00"); //Diabli nadali! Umr� tu z pragnienia.
	
	Info_ClearChoices (DIA_Addon_RoastPirate_GimmeGrog);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Addon_RoastPirate_GimmeGrog_HereIsGrog()
{
	AI_Output (other,self ,"DIA_Addon_PIR_6_GimmeGrog_HereIsGrog_15_00"); //Masz, poci�gnij sobie.
	B_GiveInvItems (other,self ,ItFo_Addon_Grog,1);
	AI_Output (self ,other,"DIA_Addon_PIR_6_GimmeGrog_HereIsGrog_06_01"); //Dzi�ki, ch�opie.
	B_UseItem (self,ItFo_Addon_Grog);
	PIR_1364_Grog = TRUE;
	Info_ClearChoices (DIA_Addon_RoastPirate_GimmeGrog);
	B_LogEntry (TOPIC_Addon_RoastGrog,"Grog uratowa� go chyba przed �mierci� z pragnienia.");
	
	Npc_ExchangeRoutine (self, "START");
	
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 					Hallo 2 	(Was machst du?)
// ************************************************************
instance DIA_Addon_RoastPirate_SeichtesWasser	(C_INFO)
{
	npc 		= PIR_1364_Addon_Pirat;
	nr		 	= 2;
	condition	= DIA_Addon_RoastPirate_SeichtesWasser_Condition;
	information	= DIA_Addon_RoastPirate_SeichtesWasser_Info;

	description	= "Jak leci?";
};
func int DIA_Addon_RoastPirate_SeichtesWasser_Condition ()
{
	return TRUE;
};
func void DIA_Addon_RoastPirate_SeichtesWasser_Info ()
{
	AI_Output	(other, self, "DIA_Addon_PIR_6_SeichtesWasser_15_00"); //Jak leci?
	AI_Output	(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_01"); //Musz� us�ugiwa� tej �ar�ocznej za�odze.
	AI_Output	(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_02"); //Dlatego stoj� dzie� i noc przy ro�nie, piek�c wilki.
	AI_Output	(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_03"); //Wola�bym rzuci� to w diab�y i po�azi� troch� po pla�y w poszukiwaniu czego�, co morze wyrzuci�o na brzeg.
	AI_Output	(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_04"); //Tydzie� temu na rafach rozbi� si� statek kupiecki.
	AI_Output	(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_05"); //I ca�y jego �adunek fale wyrzuci�y na brzeg.
	AI_Output	(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_06"); //Mam nadziej�, �e nied�ugo b�d� m�g� si� st�d ruszy�.
};

// ************************************************************
// 							Francis	
// ************************************************************
instance DIA_Addon_RoastPirate_Francis(C_INFO)
{
	npc 		= PIR_1364_Addon_Pirat;
	nr			= 3;
	condition	= DIA_Addon_RoastPirate_Francis_Condition;
	information	= DIA_Addon_RoastPirate_Francis_Info;
	permanent	= FALSE;
	description = "Co mo�esz mi powiedzie� o Francisie?";
};                       
func INT DIA_Addon_RoastPirate_Francis_Condition()
{
	if (Francis_ausgeschissen == FALSE)
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
		|| (Francis.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			return TRUE;
		};
	};	
};
func VOID DIA_Addon_RoastPirate_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_PIR_6_FRANCIS_15_00"); //Co mo�esz mi powiedzie� o Francisie?
	AI_Output (self ,other,"DIA_Addon_PIR_6_Francis_06_01"); //Francis? Rz�dzi si�, jakby by� tu kapitanem. Na szcz�cie to si� sko�czy, gdy tylko Greg wr�ci.
	AI_Output (self ,other,"DIA_Addon_PIR_6_Francis_06_02"); //Wtedy schowa si� jak krab pustelnik do skorupy.
	AI_Output (self ,other,"DIA_Addon_PIR_6_Francis_06_04"); //Wydaje mi si�, �e on nas nie�le kantuje. Cz�� naszej forsy l�duje u niego w kieszeni.
	AI_Output (self ,other,"DIA_Addon_PIR_6_Francis_06_05"); //Jakby co�, to ja tego nie powiedzia�em. I dop�ki nie znajdzie si� jaki� dow�d, lepiej zatrzymaj t� wiadomo�� dla siebie, jasne?
};	

// ************************************************************
// 							PERM
// ************************************************************
instance DIA_Addon_RoastPirate_PERM (C_INFO)
{
	npc 		= PIR_1364_Addon_Pirat;
	nr			= 99;
	condition	= DIA_Addon_RoastPirate_PERM_Condition;
	information	= DIA_Addon_RoastPirate_PERM_Info;
	permanent	= TRUE;
	description = "A w przeciwnym razie?";
};                       
func INT DIA_Addon_RoastPirate_PERM_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_RoastPirate_SeichtesWasser))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_RoastPirate_PERM_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Matt_Job_15_00"); //A w przeciwnym razie?
	
	var int randy;
	randy = Hlp_Random (3);
	
	if (GregIsBack == TRUE)
	{
		if (randy == 0)
		&& (!Npc_IsDead(Francis))
		{
			AI_Output (self ,other,"DIA_Addon_PIR_6_Chef_06_02"); //Na miejscu Grega pos�a�bym Francisa na bagna.
		}
		else if (randy == 1)
		{
			AI_Output (self ,other,"DIA_Addon_PIR_6_Chef_06_03"); //Kiedy Greg do nas wr�ci�, przesta�em si� obawia� napadu bandyt�w.
		}
		else
		{
			AI_Output (self ,other,"DIA_Addon_PIR_6_Chef_06_01"); //Jasne, przy kapitanie nie b�dzie mo�na si� miga� od roboty, ale przynajmniej dostaniemy za ni� konkretne pieni�dze.
		};
	}
	else
	{
		if (randy == 0)
		&& (!Npc_IsDead(Francis))
		{
			AI_Output (self ,other,"DIA_Addon_PIR_6_Chef_06_06"); //Francis du�o gada i niczego nie robi. Od czasu, gdy zosta� tu szefem, wszystko si� sypie.
		}
		else if (randy == 1)
		{
			AI_Output (self ,other,"DIA_Addon_PIR_6_Chef_06_05"); //Niech bandyci nas zaatakuj�. Czeka ich przykra niespodzianka.
		}
		else
		{
			AI_Output (self ,other,"DIA_Addon_PIR_6_Chef_06_04"); //Miejmy nadziej�, �e Greg szybko wr�ci. Nie mog� si� doczeka� ponownego wyj�cia w morze.
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
INSTANCE DIA_Addon_RoastPirate_Anheuern(C_INFO)
{
	npc			= PIR_1364_Addon_Pirat;
	nr			= 11;
	condition	= DIA_Addon_RoastPirate_Anheuern_Condition;
	information	= DIA_Addon_RoastPirate_Anheuern_Info;
	permanent	= FALSE;
	description = "Powiniene� mi pom�c.";
};                       
FUNC INT DIA_Addon_RoastPirate_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_RoastPirate_Anheuern_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_15_01"); //Powiniene� mi pom�c.
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_15_03"); //To rozkaz Grega.
	B_Say(self, other, "$ABS_GOOD");
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_RoastPirate_ComeOn(C_INFO)
{
	npc			= PIR_1364_Addon_Pirat;
	nr		 	= 12;
	condition	= DIA_Addon_RoastPirate_ComeOn_Condition;
	information	= DIA_Addon_RoastPirate_ComeOn_Info;
	permanent	= TRUE;
	description	= "Chod� ze mn�.";
};
func int DIA_Addon_RoastPirate_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_RoastPirate_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_RoastPirate_ComeOn_Info ()
{
	AI_Output	(other, self, "DIA_Addon_RoastPirate_ComeOn_15_00"); //Chod� ze mn�.
	if (C_GregsPiratesTooFar() == TRUE)
	{
		B_Say(self, other, "$RUNAWAY");
		AI_StopProcessInfos (self);
	}
	else
	{
		B_Say(self, other, "$ABS_GOOD");
		AI_StopProcessInfos (self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_RoastPirate_GoHome(C_INFO)
{
	npc			= PIR_1364_Addon_Pirat;
	nr			= 13;
	condition	= DIA_Addon_RoastPirate_GoHome_Condition;
	information	= DIA_Addon_RoastPirate_GoHome_Info;
	permanent	= TRUE;
	description = "Nie potrzebuj� ju� twojej pomocy.";
};                       
FUNC INT DIA_Addon_RoastPirate_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_RoastPirate_GoHome_Info()
{	
	AI_Output (other,self ,"DIA_Addon_RoastPirate_GoHome_15_00"); //Nie potrzebuj� ju� twojej pomocy.
	B_Say(self, other, "$ABS_GOOD");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START");
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_RoastPirate_TooFar(C_INFO)
{
	npc			= PIR_1364_Addon_Pirat;
	nr			= 14;
	condition	= DIA_Addon_RoastPirate_TooFar_Condition;
	information	= DIA_Addon_RoastPirate_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_RoastPirate_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_RoastPirate_TooFar_Info()
{	
	B_Say(self, other, "$RUNAWAY");
	
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};


		








// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Bill_EXIT(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 999;
	condition	= DIA_Addon_Bill_EXIT_Condition;
	information	= DIA_Addon_Bill_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Bill_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Bill_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Bill_PICKPOCKET (C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 900;
	condition	= DIA_Addon_Bill_PICKPOCKET_Condition;
	information	= DIA_Addon_Bill_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Addon_Bill_PICKPOCKET_Condition()
{
	C_Beklauen (80, 205);
};
 
FUNC VOID DIA_Addon_Bill_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Bill_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Bill_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Bill_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Bill_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Bill_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bill_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Bill_PICKPOCKET);
};
	
func void DIA_Addon_Bill_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Bill_PICKPOCKET);
};
// ************************************************************
// 			  				   Hello
// ************************************************************
INSTANCE DIA_Addon_Bill_Hello(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 1;
	condition	= DIA_Addon_Bill_Hello_Condition;
	information	= DIA_Addon_Bill_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Bill_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Bill_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_Hello_15_00"); //Wszystko w porządku?
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_01"); //Co się dzieje? Henry cię tu przysłał?
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_02"); //Powiedz mu, że niedługo dostanie swoje deski.
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_03"); //Jeśli go to nie urządza, to niech sam je sobie piłuje.
	
	Npc_ExchangeRoutine (self, "START");
};

// ************************************************************
// 			  				 Planks
// ************************************************************
INSTANCE DIA_Addon_Bill_Planks(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 2;
	condition	= DIA_Addon_Bill_Planks_Condition;
	information	= DIA_Addon_Bill_Planks_Info;

	description = "Co robisz z tymi deskami?";
};                       
FUNC INT DIA_Addon_Bill_Planks_Condition()
{
	if (GregIsBAck == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_Bill_Planks_Info()
{	
	AI_Output (other, self, "DIA_Addon_Bill_Planks_15_00"); //Co robisz z tymi deskami?
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_01"); //A jak sądzisz? Są potrzebne do budowy palisady, ośle!
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_02"); //Greg uznał, że warto lepiej ufortyfikować nasz obóz.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_03"); //Ale uważam, że nie ma to większego sensu.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_04"); //Jeśli bandyci nas zaatakują, to ta śmieszna palisada ich nie zatrzyma.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_05"); //Powinniśmy byli pozbyć się ich dawno temu.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_06"); //Gdybym wiedział, co tu się będzie działo, zostałbym w Khorinis.
};
	
// ************************************************************
// 							PERM
// ************************************************************
var int Bill_Perm_Once;

instance DIA_Addon_Bill_Perm		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 4;
	condition	= DIA_Addon_Bill_Perm_Condition;
	information	= DIA_Addon_Bill_Perm_Info;
	permanent	= TRUE;
	description	= "Mogę ci pomóc w piłowaniu?";
};
func int DIA_Addon_Bill_Perm_Condition ()
{
	if (GregIsBack == FALSE)
	&& (Npc_WasInState (self, ZS_Saw))
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bill_Perm_15_00"); //Mogę ci pomóc w piłowaniu?
	AI_Output	(self, other, "DIA_Addon_Bill_Perm_03_01"); //Nie trzeba, dam sobie radę.
	if (Bill_Perm_Once == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Bill_Perm_03_02"); //Niedawno przyłączyłem się do obozu i jeśli pozwolę, żeby inni za mnie pracowali, będą mieli mnie za lenia, rozumiesz?
		Bill_Perm_Once = TRUE;
	};
};

// ************************************************************
//							PERM 2
// ************************************************************
instance DIA_Addon_Bill_Perm2		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 5;
	condition	= DIA_Addon_Bill_Perm2_Condition;
	information	= DIA_Addon_Bill_Perm2_Info;
	permanent	= TRUE;
	description	= "Co teraz będziesz robić?";
};
func int DIA_Addon_Bill_Perm2_Condition ()
{
	if (GregIsBack == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_Perm2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bill_Perm2_15_00"); //Co teraz będziesz robić?
	AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_01"); //Muszę chwilę odpocząć.
	if (!Npc_IsDead(Francis))
	{
		AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_02"); //Francis zajmuje się moją dawną robotą.
		AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_03"); //Jeśli o mnie chodzi, to może piłować aż do końca świata.
	};
};



// ************************************************************
// ***														***
// 					Die Angus und Hank Show
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 					Ich suche Angus und Hank.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Bill_AngusnHank(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 11;
	condition	= DIA_Addon_Bill_AngusnHank_Condition;
	information	= DIA_Addon_Bill_AngusnHank_Info;
	permanent	= FALSE;
	description = "Szukam Angusa i Hanka.";
};                       
FUNC INT DIA_Addon_Bill_AngusnHank_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Skip_AngusHank))
	&&  Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Bill_AngusnHank_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_AngusnHank_15_00"); //Szukam Angusa i Hanka.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_01"); //Nie mam pojęcia, gdzie teraz są - może dopadli ich bandyci?
	AI_Output (other,self ,"DIA_Addon_Bill_AngusnHank_15_02"); //Byliście przyjaciółmi, prawda?
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_03"); //Wiem tylko, że chcieli spotkać się z bandytami w jednej z pobliskich jaskiń.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_04"); //Pewnie gdzieś na wschód od obozu. 
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_05"); //Ale nie wiem dokładnie gdzie. Nigdy tam nie byłem.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_06"); //Najlepiej będzie, jeśli zapytasz o to Jacka Aligatora. On wie wszystko o okolicy.

	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Angus i Hank siedzieli w jaskini na wschód od obozu. Jack Aligator może wiedzieć więcej na ten temat.");
};

// ------------------------------------------------------------
// 							Sie sind tot.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Bill_FoundFriends(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 12;
	condition	= DIA_Addon_Bill_FoundFriends_Condition;
	information	= DIA_Addon_Bill_FoundFriends_Info;
	permanent	= FALSE;
	description = "Znalazłem twoich przyjaciół.";
};                       
FUNC INT DIA_Addon_Bill_FoundFriends_Condition()
{
	if (!Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bill_FoundFriends_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_00"); //Znalazłem twoich przyjaciół.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_01"); //No i? Gdzie są?
	AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_02"); //Nie żyją.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_03"); //To sprawka tych cholernych bandytów!
	if (SC_Knows_JuanMurderedAngus == FALSE)
	{
		AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_06"); //Być może.
	};
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_04"); //Przeklęte łotry! Niech ich piekło pochłonie!
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_05"); //Dużo bym dał, żeby dowiedzieć się, kto jest temu winien...
	
	MIS_Addon_Bill_SearchAngusMurder = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_KillJuan,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_KillJuan,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_KillJuan,"Bill był wściekły, kiedy powiedziałem mu o śmierci Angusa i Hanka. Chce znać imię mordercy.");
};	

// ------------------------------------------------------------
// 						Ich kenne den Mörder
// ------------------------------------------------------------
instance DIA_Addon_Bill_JuanMurder		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 13;
	condition	= DIA_Addon_Bill_JuanMurder_Condition;
	information	= DIA_Addon_Bill_JuanMurder_Info;

	description	= "Wiem, kto zamordował Angusa i Hanka.";
};
func int DIA_Addon_Bill_JuanMurder_Condition ()
{
	if (MIS_Addon_Bill_SearchAngusMurder == LOG_RUNNING)
	&& (SC_Knows_JuanMurderedAngus == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_JuanMurder_Info ()
{
	AI_Output (other, self, "DIA_Addon_Bill_JuanMurder_15_00"); //Wiem, kto zamordował Angusa i Hanka.
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_01"); //Kto? Mów, kto to zrobił!
	AI_Output (other, self, "DIA_Addon_Bill_JuanMurder_15_02"); //To jeden z bandytów - Juan.
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_03"); //Musisz się go pozbyć, rozumiesz?
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_04"); //Ta zbrodnia nie może ujść mu płazem!
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Mam zabić Juana, żeby pomścić Angusa i Hanka.");
};

// ------------------------------------------------------------
// 						Juan ist erledigt.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Bill_KilledEsteban(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 14;
	condition	= DIA_Addon_Bill_KilledEsteban_Condition;
	information	= DIA_Addon_Bill_KilledEsteban_Info;

	description = "Juan już nie będzie sprawiał kłopotów.";
};                       
FUNC INT DIA_Addon_Bill_KilledEsteban_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Bill_JuanMurder))
	&& (Npc_IsDead (Juan))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bill_KilledEsteban_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_KilledEsteban_15_00"); //Juan już nie będzie sprawiał kłopotów.
	AI_Output (self ,other,"DIA_Addon_Bill_KilledEsteban_03_01"); //Mów, jak to się stało? Bardzo cierpiał?
	AI_Output (other,self ,"DIA_Addon_Bill_KilledEsteban_15_02"); //Lepiej o tym nie mówmy.
	AI_Output (self ,other,"DIA_Addon_Bill_KilledEsteban_03_03"); //W sumie racja. Ważne, że ta świnia niczego już nie zrobi.
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Juan został załatwiony, co ucieszyło Billa.");
	MIS_Addon_Bill_SearchAngusMurder = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Bill_KillAngusMurder);
	
};



// ************************************************************
// ***														***
//							Pick Pocket
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 							Khorinis?
// ------------------------------------------------------------
instance DIA_Addon_Bill_Khorinis		(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr		 	= 21;
	condition	= DIA_Addon_Bill_Khorinis_Condition;
	information	= DIA_Addon_Bill_Khorinis_Info;

	description	= "Byłeś w Khorinis?";
};
func int DIA_Addon_Bill_Khorinis_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Bill_Planks))
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_Khorinis_Info ()
{
	AI_Output (other, self, "DIA_Addon_Bill_Khorinis_15_00"); //Byłeś w Khorinis?
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_01"); //Tak. Trochę tam się kręciłem, podcinając sakiewki i zajmując się drobnym szwindlem.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_02"); //Ale im mniej statków zawijało do portu, tym gorzej szedł interes.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_03"); //Zabawa ze strażą przestała się opłacać.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_04"); //I tak dołączyłem do Grega, a teraz siedzę tutaj.

	if (GregIsBAck == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_05"); //Cały dzień piłuję drewno na palisadę, która i tak jest bezużyteczna.
	};
};

// ------------------------------------------------------------
// 							Wanna Learn
// ------------------------------------------------------------
instance DIA_Addon_Bill_TeachPlayer		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 22;
	condition	= DIA_Addon_Bill_TeachPlayer_Condition;
	information	= DIA_Addon_Bill_TeachPlayer_Info;
	
	description	= "Możesz mnie czegoś nauczyć?";
};
func int DIA_Addon_Bill_TeachPlayer_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Bill_Khorinis))
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_TeachPlayer_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bill_TeachPlayer_15_00"); //Możesz mnie czegoś nauczyć?
	AI_Output	(self, other, "DIA_Addon_Bill_TeachPlayer_03_01"); //Mogę ci pokazać, jak opróżniać ludziom kieszenie tak, aby tego nie zauważyli.
	AI_Output	(self, other, "DIA_Addon_Bill_TeachPlayer_03_02"); //Ale musisz być co najmniej średnio zręczny, bo inaczej nie ma sensu zaczynać nauki.

	Bill_Addon_TeachPickPocket = TRUE;
};

// ------------------------------------------------------------
// 						Teach Pickpocket
// ------------------------------------------------------------
instance DIA_Addon_Bill_LearnTalent		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 23;
	condition	= DIA_Addon_Bill_LearnTalent_Condition;
	information	= DIA_Addon_Bill_LearnTalent_Info;
	permanent 	= TRUE;
	description	= "Pokaż mi, jak okradać innych. (10 PN)";
};
func int DIA_Addon_Bill_LearnTalent_Condition ()
{
	if (Bill_Addon_TeachPickPocket == TRUE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKPOCKET) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_LearnTalent_Info ()
{
	AI_Output (other, self, "DIA_Addon_Bill_LearnTalent_15_00"); //Pokaż mi, jak okradać innych.
	
	if (other.attribute[ATR_DEXTERITY] >= 40) //braucht man für Francis
	{
		if (B_TeachThiefTalent (self, other, NPC_TALENT_PICKPOCKET))
		{
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_01"); //Jeśli chcesz kogoś okraść, musisz sprawić, by poczuł się bezpiecznie.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_02"); //Zawsze wciągam ofiarę w pogawędkę. Działa bez pudła.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_03"); //Kiedy zabierasz się za kradzież, upewnij się, że ofiara niczego nie zauważyła.

			AI_Output (other, self, "DIA_Addon_Bill_LearnTalent_15_05"); //Coś jeszcze?
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_06"); //Tak. Potrenuj trochę zręczność, jako że zręczniejszemu złodziejowi łatwiej spostrzec dobrą okazję.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_07"); //I łatwiej uniknąć złapania na gorącym uczynku.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_08"); //Przynajmniej w teorii.
		};
	}
	else 
	{
		AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_09"); //Zapomnij o tym. Jesteś zbyt niezdarny!
		AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_10"); //Potrenuj zręczność albo znajdź sobie lepszego nauczyciela.
	};
};


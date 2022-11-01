///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Garvell_EXIT   (C_INFO)
{
	npc         = VLK_441_Garvell;
	nr          = 999;
	condition   = DIA_Garvell_EXIT_Condition;
	information = DIA_Garvell_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Garvell_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Garvell_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Garvell_PICKPOCKET (C_INFO)
{
	npc			= VLK_441_Garvell;
	nr			= 900;
	condition	= DIA_Garvell_PICKPOCKET_Condition;
	information	= DIA_Garvell_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Kradzież tego mieszka będzie dziecinnie łatwa)";
};                       

FUNC INT DIA_Garvell_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ItSe_GoldPocket25) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (10 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Garvell_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Garvell_PICKPOCKET);
	Info_AddChoice		(DIA_Garvell_PICKPOCKET, DIALOG_BACK 		,DIA_Garvell_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Garvell_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Garvell_PICKPOCKET_DoIt);
};

func void DIA_Garvell_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 10)
	{
		
		B_GiveInvItems (self, other, ItSe_GoldPocket25, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Garvell_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Garvell_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Garvell_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_GREET		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	2;
	condition	 = 	DIA_Garvell_GREET_Condition;
	information	 = 	DIA_Garvell_GREET_Info;
	description	 = 	"Co tu porabiasz?";
};
func int DIA_Garvell_GREET_Condition ()
{	
	if (Wld_IsTime (05,00,19,00))
	{	
			return TRUE;
	};
};
func void DIA_Garvell_GREET_Info ()
{
	AI_Output (other, self, "DIA_Garvell_GREET_15_00"); //Co tu robisz?
	AI_Output (self, other, "DIA_Garvell_GREET_04_01"); //Buduję statek i chcę się jak najszybciej stąd wydostać.
	AI_Output (self, other, "DIA_Garvell_GREET_04_02"); //Wygląda jednak na to, że nigdy nie zdołam ukończyć budowy.
};
///////////////////////////////////////////////////////////////////////
//	Info eilig
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_eilig		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	2;
	condition	 = 	DIA_Garvell_eilig_Condition;
	information	 = 	DIA_Garvell_eilig_Info;
	description	 = 	"Czemu się tak strasznie spieszysz?";
};
func int DIA_Garvell_eilig_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Garvell_GREET)
	{	
			return TRUE;
	};
};
func void DIA_Garvell_eilig_Info ()
{
	AI_Output (other, self, "DIA_Garvell_eilig_15_00"); //Czemu się tak strasznie spieszysz?
	AI_Output (self, other, "DIA_Garvell_eilig_04_01"); //Wkrótce przybędą orkowie i spalą to miasto.
	AI_Output (other, self, "DIA_Garvell_eilig_15_02"); //Czemu tak sądzisz?
	AI_Output (self, other, "DIA_Garvell_eilig_04_03"); //A nie zauważyłeś tych wszystkich paladynów? Jak sądzisz, co oni tutaj robią?
	AI_Output (self, other, "DIA_Garvell_eilig_04_04"); //Powiem ci - przybyli tutaj, bo wkrótce rozpocznie się atak orków. Będzie gorąco.
};

///////////////////////////////////////////////////////////////////////
//	Info Schiff
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Schiff		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	99;
	condition	 = 	DIA_Garvell_Schiff_Condition;
	information	 = 	DIA_Garvell_Schiff_Info;
	description	 = 	"Czemu nie możesz dokończyć budowy statku?";
};
func int DIA_Garvell_Schiff_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Garvell_GREET)
	{	
			return TRUE;
	};
};
func void DIA_Garvell_Schiff_Info ()
{
	AI_Output (other, self, "DIA_Garvell_Schiff_15_00"); //Czemu nie możesz dokończyć budowy statku?
	AI_Output (self, other, "DIA_Garvell_Schiff_04_01"); //Och, mamy tysiące problemów. Kadłub wciąż jeszcze nie stabilny, brakuje wielu elementów...
	AI_Output (self, other, "DIA_Garvell_Schiff_04_02"); //Niestety, nie mam już pieniędzy na zakup nowych materiałów, a w ostatniej dostawie pełno było korników.
	AI_Output (self, other, "DIA_Garvell_Schiff_04_03"); //Moi chłopcy też nie pracują zbyt produktywnie. Jednemu zależy tylko i wyłącznie na tym, żeby statek był szybki, drugi najbardziej przejmuje się figurą dziobową!
	AI_Output (self, other, "DIA_Garvell_Schiff_04_04"); //Jakbyśmy nie mieli ważniejszych problemów!
	AI_Output (self, other, "DIA_Addon_Garvell_Schiff_04_00"); //Do tego zaginął ostatnio jeden z moich robotników - boję się, że może to spowodować dalsze opóźnienia.
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Garvell_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_441_Garvell;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Garvell_MissingPeople_Condition;
	information	 = 	DIA_Addon_Garvell_MissingPeople_Info;

	description	 = 	"Zaginął jeden z twoich pracowników?";
};

func int DIA_Addon_Garvell_MissingPeople_Condition ()
{
	if Npc_KnowsInfo (other,DIA_Garvell_Schiff)
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (MissingPeopleReturnedHome == FALSE)
	{	
			return TRUE;
	};
};

func void DIA_Addon_Garvell_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Garvell_MissingPeople_15_00"); //Zaginął jeden z twoich pracowników?
	AI_Output	(self, other, "DIA_Addon_Garvell_MissingPeople_04_01"); //Tak. Niejaki Monty - zniknął bez śladu.
	AI_Output	(self, other, "DIA_Addon_Garvell_MissingPeople_04_02"); //Pewnie ten obibok siedzi teraz na jakiejś farmie i cieszy się życiem... Nie trzeba było mu płacić z góry.
	
	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Garvell martwi się o swojego robotnika, Monty'ego, który pewnego dnia nie przyszedł do pracy. Dziwne, bo dobrze mu się układało z farmerami."); 

	Info_ClearChoices	(DIA_Addon_Garvell_MissingPeople);
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "Podobno nie on jeden zaginął?", DIA_Addon_Garvell_MissingPeople_more );
	if (SCKnowsFarimAsWilliamsFriend == FALSE)
	{
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "Kiedy ostatnio widziałeś Monty'ego?", DIA_Addon_Garvell_MissingPeople_wo );
	};
};
func void DIA_Addon_Garvell_MissingPeople_more ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_more_15_00"); //Podobno nie on jeden zaginął?
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_01"); //Tak - i tutaj zaczyna się cały problem.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_02"); //Rybak Farim wspomniał, że zapodział się gdzieś również jego znajomy, William.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_03"); //Założę się, że stoją za tym orkowie.
	SCKnowsFarimAsWilliamsFriend = TRUE;

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Wygląda na to, że rybak Farim wie coś o miejscu pobytu swego przyjaciela Williama."); 
	
	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_MissingPeople, LogText_Addon_WilliamMissing); 

	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, DIALOG_BACK, DIA_Addon_Garvell_MissingPeople_BACK );

	if (Farim.aivar[AIV_TalkedToPlayer] == FALSE)
	{
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "Gdzie znajdę tego Farima?", DIA_Addon_Garvell_MissingPeople_Farim );
	};
};
func void DIA_Addon_Garvell_MissingPeople_BACK ()
{
	Info_ClearChoices	(DIA_Addon_Garvell_MissingPeople);
};
func void DIA_Addon_Garvell_MissingPeople_Farim ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_Farim_15_00"); //Gdzie znajdę tego Farima?
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_Farim_04_01"); //To rybak, więc pewnie gdzieś przy magazynie paladynów. Głowy jednak nie dam.

	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Chata Farima stoi w pobliżu magazynu paladynów."); 
};
func void DIA_Addon_Garvell_MissingPeople_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_wo_15_00"); //Kiedy ostatnio widziałeś Monty'ego?
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_wo_04_01"); //Od dwóch dni nie przychodzi do pracy.
};
///////////////////////////////////////////////////////////////////////
//	Info ReturnMonty
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_ReturnMonty		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	99;
	condition	 = 	DIA_Garvell_ReturnMonty_Condition;
	information	 = 	DIA_Garvell_ReturnMonty_Info;
	description	 = 	"Co słychać?";
};
func int DIA_Garvell_ReturnMonty_Condition ()
{	
	if (Npc_GetDistToWP (Monty_NW, "NW_CITY_HABOUR_WERFT_IN_01") <= 1000)
	&& (MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Garvell_ReturnMonty_Info ()
{
	AI_Output (other, self, "DIA_Addon_Garvell_ReturnMonty_15_00"); //Co słychać?
	AI_Output (self, other, "DIA_Addon_Garvell_ReturnMonty_04_01"); //Monty wrócił! Przegląda właśnie plany.
	AI_Output (self, other, "DIA_Addon_Garvell_ReturnMonty_04_02"); //Może jednak uda się skonstruować ten statek...
	B_GivePlayerXP (XP_Ambient);
};
///////////////////////////////////////////////////////////////////////
//	Info MISSION
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_MISSION		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	2;
	condition	 = 	DIA_Garvell_MISSION_Condition;
	information	 = 	DIA_Garvell_MISSION_Info;
	permanent    =  FALSE;
	description	 = 	"Czy mogę ci jakoś pomóc?";
};

func int DIA_Garvell_MISSION_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Garvell_eilig)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Garvell_MISSION_Info ()
{
	AI_Output (other, self, "DIA_Garvell_MISSION_15_00"); //Czy mogę ci jakoś pomóc?
	AI_Output (self, other, "DIA_Garvell_MISSION_04_01"); //Oczywiście. Spróbuj się dowiedzieć, co planują paladyni. Jestem ciekaw, po co tu przybyli.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_02"); //Muszę wiedzieć, czy orkowie faktycznie zamierzają zaatakować, a jeśli tak, to w jakiej odległości od miasta się znajdują.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_03"); //Jeden z tych śmierdzieli podobno pojawił się tuż za miastem...
	AI_Output (self, other, "DIA_Garvell_MISSION_04_04"); //Po prostu dowiedz się tyle, ile możesz.
	AI_Output (self ,other, "DIA_Garvell_Add_04_00"); //Chcę wiedzieć, ile mam jeszcze czasu na dokończenie budowy okrętu.

	MIS_Garvell_Infos = LOG_RUNNING;
	Knows_Ork = TRUE;
	
	Log_CreateTopic (TOPIC_Garvell,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Garvell,LOG_RUNNING);
	B_LogEntry (TOPIC_Garvell,"Garvell chce się dowiedzieć jak najwięcej na temat orków. Chce też wiedzieć, czemu w mieście przebywają paladyni.");
};
FUNC VOID B_GarvellWeiter()
{
	AI_Output (self, other, "DIA_Garvell_Weiter_04_00"); //Dobrze. Jeśli dowiesz się czegoś więcej, daj mi znać.
};
FUNC VOID B_GarvellSuccess()
{
	AI_Output (self, other, "DIA_Garvell_Success_04_00"); //Dziękuję za informacje. Wygląda na to, że mamy całą masę czasu na ukończenie naszego statku.
	MIS_Garvell_Infos = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
};
///////////////////////////////////////////////////////////////////////
//	Info Orks
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Orks		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	3;
	condition	 = 	DIA_Garvell_Orks_Condition;
	information	 = 	DIA_Garvell_Orks_Info;
	permanent    =  FALSE;
	description	 = 	"Mam informacje dotyczące orków.";
};
func int DIA_Garvell_Orks_Condition ()
{	
	if (MIS_Garvell_Infos == LOG_RUNNING)
	&& (Knows_Paladins >= 1)
	{
		return TRUE;
	};
};
func void DIA_Garvell_Orks_Info ()
{
	AI_Output (other, self, "DIA_Garvell_Orks_15_00"); //Mam informacje dotyczące orków.
	AI_Output (self, other, "DIA_Garvell_Orks_04_01"); //Słucham.
	AI_Output (other, self, "DIA_Garvell_Orks_15_02"); //Utknęli w Górniczej Dolinie, i wygląda na to, że już tam pozostaną.
	AI_Output (other, self, "DIA_Garvell_Orks_15_03"); //Paladyni strzegą przełęczy.

	Tell_Garvell = (Tell_Garvell +1);
	B_GivePlayerXP (XP_Ambient);
	
	if (Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Orks
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Paladine		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	2;
	condition	 = 	DIA_Garvell_Paladine_Condition;
	information	 = 	DIA_Garvell_Paladine_Info;
	permanent    =  FALSE;
	description	 = 	"Wiem, co tu robią paladyni.";
};
func int DIA_Garvell_Paladine_Condition ()
{	
	if (MIS_Garvell_Infos == LOG_RUNNING)
	&& (KnowsPaladins_Ore == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Garvell_Paladine_Info ()
{
	AI_Output (other, self, "DIA_Garvell_Paladine_15_00"); //Wiem, co tu robią paladyni.
	AI_Output (self, other, "DIA_Garvell_Paladine_04_01"); //Naprawdę? Powiedz!
	AI_Output (other, self, "DIA_Garvell_Paladine_15_02"); //Paladyni nie przybyli tutaj, dlatego że spodziewają się ataku orków. Ich celem jest zdobycie magicznej rudy z Górniczej Doliny.
	AI_Output (other, self, "DIA_Garvell_Paladine_15_03"); //Kiedy tylko ją zdobędą, powrócą na kontynent.

	Tell_Garvell = (Tell_Garvell +1);
	B_GivePlayerXP (XP_Ambient);
	
	if (Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Ork vor der Stadt
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_City		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	4;
	condition	 = 	DIA_Garvell_City_Condition;
	information	 = 	DIA_Garvell_City_Info;
	permanent    =  FALSE;
	description	 = 	"Co do tego orka za miastem...";
};
func int DIA_Garvell_City_Condition ()
{	
	if (MIS_Garvell_Infos == LOG_RUNNING)
	&& (Knows_Paladins >= 2)
	{
		return TRUE;
	};
};
func void DIA_Garvell_City_Info ()
{
	AI_Output (other, self, "DIA_Garvell_City_15_00"); //Co do tego orka za miastem...
	AI_Output (self, other, "DIA_Garvell_City_04_01"); //Taaak...?
	AI_Output (other, self, "DIA_Garvell_City_15_02"); //Nie przejmuj się nim. Straż da sobie radę.
	

	Tell_Garvell = (Tell_Garvell +1);
	B_GivePlayerXP (XP_Ambient);
	
	if (Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Perm		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	13;
	condition	 = 	DIA_Garvell_Perm_Condition;
	information	 = 	DIA_Garvell_Perm_Info;
	permanent    =  TRUE;
	description	 = 	"Co się dzieje w porcie?";
};
func int DIA_Garvell_Perm_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Garvell_MISSION)
	{
		return TRUE;
	};
};
func void DIA_Garvell_Perm_Info ()
{
	AI_Output (other, self, "DIA_Garvell_Perm_15_00"); //Co się dzieje w porcie?
	
	if (MIS_Garvell_Infos != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Garvell_Perm_04_01"); //Orkowie depczą nam po piętach, a ty pytasz, co się dzieje w porcie?
		AI_Output (other, self, "DIA_Garvell_Perm_15_02"); //Chciałem tylko...
		AI_Output (self, other, "DIA_Garvell_Perm_04_03"); //Największy problem w tym, że w porcie jest zbyt mało statków, żeby wszyscy mogli się ewakuować.
		AI_Output (self, other, "DIA_Garvell_Perm_04_04"); //Szczerze mówiąc, to jest tu tylko jeden statek, i w dodatku należy do paladynów.
	}
	else
	{
		AI_Output (self, other, "DIA_Garvell_Perm_04_05"); //Możesz się rozejrzeć. Jak widzisz, nic się tu nie dzieje.
	};
};
























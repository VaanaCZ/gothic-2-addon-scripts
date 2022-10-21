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
	description = "(Kradzie¿ tego mieszka bêdzie dziecinnie ³atwa)";
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
	AI_Output (self, other, "DIA_Garvell_GREET_04_01"); //Budujê statek i chcê siê jak najszybciej st¹d wydostaæ.
	AI_Output (self, other, "DIA_Garvell_GREET_04_02"); //Wygl¹da jednak na to, ¿e nigdy nie zdo³am ukoñczyæ budowy.
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
	description	 = 	"Czemu siê tak strasznie spieszysz?";
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
	AI_Output (other, self, "DIA_Garvell_eilig_15_00"); //Czemu siê tak strasznie spieszysz?
	AI_Output (self, other, "DIA_Garvell_eilig_04_01"); //Wkrótce przybêd¹ orkowie i spal¹ to miasto.
	AI_Output (other, self, "DIA_Garvell_eilig_15_02"); //Czemu tak s¹dzisz?
	AI_Output (self, other, "DIA_Garvell_eilig_04_03"); //A nie zauwa¿y³eœ tych wszystkich paladynów? Jak s¹dzisz, co oni tutaj robi¹?
	AI_Output (self, other, "DIA_Garvell_eilig_04_04"); //Powiem ci - przybyli tutaj, bo wkrótce rozpocznie siê atak orków. Bêdzie gor¹co.
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
	description	 = 	"Czemu nie mo¿esz dokoñczyæ budowy statku?";
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
	AI_Output (other, self, "DIA_Garvell_Schiff_15_00"); //Czemu nie mo¿esz dokoñczyæ budowy statku?
	AI_Output (self, other, "DIA_Garvell_Schiff_04_01"); //Och, mamy tysi¹ce problemów. Kad³ub wci¹¿ jeszcze nie stabilny, brakuje wielu elementów...
	AI_Output (self, other, "DIA_Garvell_Schiff_04_02"); //Niestety, nie mam ju¿ pieniêdzy na zakup nowych materia³ów, a w ostatniej dostawie pe³no by³o korników.
	AI_Output (self, other, "DIA_Garvell_Schiff_04_03"); //Moi ch³opcy te¿ nie pracuj¹ zbyt produktywnie. Jednemu zale¿y tylko i wy³¹cznie na tym, ¿eby statek by³ szybki, drugi najbardziej przejmuje siê figur¹ dziobow¹!
	AI_Output (self, other, "DIA_Garvell_Schiff_04_04"); //Jakbyœmy nie mieli wa¿niejszych problemów!
	AI_Output (self, other, "DIA_Addon_Garvell_Schiff_04_00"); //Do tego zagin¹³ ostatnio jeden z moich robotników - bojê siê, ¿e mo¿e to spowodowaæ dalsze opóŸnienia.
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

	description	 = 	"Zagin¹³ jeden z twoich pracowników?";
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
	AI_Output	(other, self, "DIA_Addon_Garvell_MissingPeople_15_00"); //Zagin¹³ jeden z twoich pracowników?
	AI_Output	(self, other, "DIA_Addon_Garvell_MissingPeople_04_01"); //Tak. Niejaki Monty - znikn¹³ bez œladu.
	AI_Output	(self, other, "DIA_Addon_Garvell_MissingPeople_04_02"); //Pewnie ten obibok siedzi teraz na jakiejœ farmie i cieszy siê ¿yciem... Nie trzeba by³o mu p³aciæ z góry.
	
	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Garvell martwi siê o swojego robotnika, Monty'ego, który pewnego dnia nie przyszed³ do pracy. Dziwne, bo dobrze mu siê uk³ada³o z farmerami."); 

	Info_ClearChoices	(DIA_Addon_Garvell_MissingPeople);
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "Podobno nie on jeden zagin¹³?", DIA_Addon_Garvell_MissingPeople_more );
	if (SCKnowsFarimAsWilliamsFriend == FALSE)
	{
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "Kiedy ostatnio widzia³eœ Monty'ego?", DIA_Addon_Garvell_MissingPeople_wo );
	};
};
func void DIA_Addon_Garvell_MissingPeople_more ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_more_15_00"); //Podobno nie on jeden zagin¹³?
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_01"); //Tak - i tutaj zaczyna siê ca³y problem.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_02"); //Rybak Farim wspomnia³, ¿e zapodzia³ siê gdzieœ równie¿ jego znajomy, William.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_03"); //Za³o¿ê siê, ¿e stoj¹ za tym orkowie.
	SCKnowsFarimAsWilliamsFriend = TRUE;

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Wygl¹da na to, ¿e rybak Farim wie coœ o miejscu pobytu swego przyjaciela Williama."); 
	
	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_MissingPeople, LogText_Addon_WilliamMissing); 

	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, DIALOG_BACK, DIA_Addon_Garvell_MissingPeople_BACK );

	if (Farim.aivar[AIV_TalkedToPlayer] == FALSE)
	{
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "Gdzie znajdê tego Farima?", DIA_Addon_Garvell_MissingPeople_Farim );
	};
};
func void DIA_Addon_Garvell_MissingPeople_BACK ()
{
	Info_ClearChoices	(DIA_Addon_Garvell_MissingPeople);
};
func void DIA_Addon_Garvell_MissingPeople_Farim ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_Farim_15_00"); //Gdzie znajdê tego Farima?
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_Farim_04_01"); //To rybak, wiêc pewnie gdzieœ przy magazynie paladynów. G³owy jednak nie dam.

	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Chata Farima stoi w pobli¿u magazynu paladynów."); 
};
func void DIA_Addon_Garvell_MissingPeople_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_wo_15_00"); //Kiedy ostatnio widzia³eœ Monty'ego?
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
	description	 = 	"Co s³ychaæ?";
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
	AI_Output (other, self, "DIA_Addon_Garvell_ReturnMonty_15_00"); //Co s³ychaæ?
	AI_Output (self, other, "DIA_Addon_Garvell_ReturnMonty_04_01"); //Monty wróci³! Przegl¹da w³aœnie plany.
	AI_Output (self, other, "DIA_Addon_Garvell_ReturnMonty_04_02"); //Mo¿e jednak uda siê skonstruowaæ ten statek...
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
	description	 = 	"Czy mogê ci jakoœ pomóc?";
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
	AI_Output (other, self, "DIA_Garvell_MISSION_15_00"); //Czy mogê ci jakoœ pomóc?
	AI_Output (self, other, "DIA_Garvell_MISSION_04_01"); //Oczywiœcie. Spróbuj siê dowiedzieæ, co planuj¹ paladyni. Jestem ciekaw, po co tu przybyli.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_02"); //Muszê wiedzieæ, czy orkowie faktycznie zamierzaj¹ zaatakowaæ, a jeœli tak, to w jakiej odleg³oœci od miasta siê znajduj¹.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_03"); //Jeden z tych œmierdzieli podobno pojawi³ siê tu¿ za miastem...
	AI_Output (self, other, "DIA_Garvell_MISSION_04_04"); //Po prostu dowiedz siê tyle, ile mo¿esz.
	AI_Output (self ,other, "DIA_Garvell_Add_04_00"); //Chcê wiedzieæ, ile mam jeszcze czasu na dokoñczenie budowy okrêtu.

	MIS_Garvell_Infos = LOG_RUNNING;
	Knows_Ork = TRUE;
	
	Log_CreateTopic (TOPIC_Garvell,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Garvell,LOG_RUNNING);
	B_LogEntry (TOPIC_Garvell,"Garvell chce siê dowiedzieæ jak najwiêcej na temat orków. Chce te¿ wiedzieæ, czemu w mieœcie przebywaj¹ paladyni.");
};
FUNC VOID B_GarvellWeiter()
{
	AI_Output (self, other, "DIA_Garvell_Weiter_04_00"); //Dobrze. Jeœli dowiesz siê czegoœ wiêcej, daj mi znaæ.
};
FUNC VOID B_GarvellSuccess()
{
	AI_Output (self, other, "DIA_Garvell_Success_04_00"); //Dziêkujê za informacje. Wygl¹da na to, ¿e mamy ca³¹ masê czasu na ukoñczenie naszego statku.
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
	description	 = 	"Mam informacje dotycz¹ce orków.";
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
	AI_Output (other, self, "DIA_Garvell_Orks_15_00"); //Mam informacje dotycz¹ce orków.
	AI_Output (self, other, "DIA_Garvell_Orks_04_01"); //S³ucham.
	AI_Output (other, self, "DIA_Garvell_Orks_15_02"); //Utknêli w Górniczej Dolinie, i wygl¹da na to, ¿e ju¿ tam pozostan¹.
	AI_Output (other, self, "DIA_Garvell_Orks_15_03"); //Paladyni strzeg¹ prze³êczy.

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
	description	 = 	"Wiem, co tu robi¹ paladyni.";
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
	AI_Output (other, self, "DIA_Garvell_Paladine_15_00"); //Wiem, co tu robi¹ paladyni.
	AI_Output (self, other, "DIA_Garvell_Paladine_04_01"); //Naprawdê? Powiedz!
	AI_Output (other, self, "DIA_Garvell_Paladine_15_02"); //Paladyni nie przybyli tutaj, dlatego ¿e spodziewaj¹ siê ataku orków. Ich celem jest zdobycie magicznej rudy z Górniczej Doliny.
	AI_Output (other, self, "DIA_Garvell_Paladine_15_03"); //Kiedy tylko j¹ zdobêd¹, powróc¹ na kontynent.

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
	AI_Output (other, self, "DIA_Garvell_City_15_02"); //Nie przejmuj siê nim. Stra¿ da sobie radê.
	

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
	description	 = 	"Co siê dzieje w porcie?";
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
	AI_Output (other, self, "DIA_Garvell_Perm_15_00"); //Co siê dzieje w porcie?
	
	if (MIS_Garvell_Infos != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Garvell_Perm_04_01"); //Orkowie depcz¹ nam po piêtach, a ty pytasz, co siê dzieje w porcie?
		AI_Output (other, self, "DIA_Garvell_Perm_15_02"); //Chcia³em tylko...
		AI_Output (self, other, "DIA_Garvell_Perm_04_03"); //Najwiêkszy problem w tym, ¿e w porcie jest zbyt ma³o statków, ¿eby wszyscy mogli siê ewakuowaæ.
		AI_Output (self, other, "DIA_Garvell_Perm_04_04"); //Szczerze mówi¹c, to jest tu tylko jeden statek, i w dodatku nale¿y do paladynów.
	}
	else
	{
		AI_Output (self, other, "DIA_Garvell_Perm_04_05"); //Mo¿esz siê rozejrzeæ. Jak widzisz, nic siê tu nie dzieje.
	};
};
























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
	description = "(Kradzie� tego mieszka b�dzie dziecinnie �atwa)";
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
	AI_Output (self, other, "DIA_Garvell_GREET_04_01"); //Buduj� statek i chc� si� jak najszybciej st�d wydosta�.
	AI_Output (self, other, "DIA_Garvell_GREET_04_02"); //Wygl�da jednak na to, �e nigdy nie zdo�am uko�czy� budowy.
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
	description	 = 	"Czemu si� tak strasznie spieszysz?";
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
	AI_Output (other, self, "DIA_Garvell_eilig_15_00"); //Czemu si� tak strasznie spieszysz?
	AI_Output (self, other, "DIA_Garvell_eilig_04_01"); //Wkr�tce przyb�d� orkowie i spal� to miasto.
	AI_Output (other, self, "DIA_Garvell_eilig_15_02"); //Czemu tak s�dzisz?
	AI_Output (self, other, "DIA_Garvell_eilig_04_03"); //A nie zauwa�y�e� tych wszystkich paladyn�w? Jak s�dzisz, co oni tutaj robi�?
	AI_Output (self, other, "DIA_Garvell_eilig_04_04"); //Powiem ci - przybyli tutaj, bo wkr�tce rozpocznie si� atak ork�w. B�dzie gor�co.
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
	description	 = 	"Czemu nie mo�esz doko�czy� budowy statku?";
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
	AI_Output (other, self, "DIA_Garvell_Schiff_15_00"); //Czemu nie mo�esz doko�czy� budowy statku?
	AI_Output (self, other, "DIA_Garvell_Schiff_04_01"); //Och, mamy tysi�ce problem�w. Kad�ub wci�� jeszcze nie stabilny, brakuje wielu element�w...
	AI_Output (self, other, "DIA_Garvell_Schiff_04_02"); //Niestety, nie mam ju� pieni�dzy na zakup nowych materia��w, a w ostatniej dostawie pe�no by�o kornik�w.
	AI_Output (self, other, "DIA_Garvell_Schiff_04_03"); //Moi ch�opcy te� nie pracuj� zbyt produktywnie. Jednemu zale�y tylko i wy��cznie na tym, �eby statek by� szybki, drugi najbardziej przejmuje si� figur� dziobow�!
	AI_Output (self, other, "DIA_Garvell_Schiff_04_04"); //Jakby�my nie mieli wa�niejszych problem�w!
	AI_Output (self, other, "DIA_Addon_Garvell_Schiff_04_00"); //Do tego zagin�� ostatnio jeden z moich robotnik�w - boj� si�, �e mo�e to spowodowa� dalsze op�nienia.
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

	description	 = 	"Zagin�� jeden z twoich pracownik�w?";
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
	AI_Output	(other, self, "DIA_Addon_Garvell_MissingPeople_15_00"); //Zagin�� jeden z twoich pracownik�w?
	AI_Output	(self, other, "DIA_Addon_Garvell_MissingPeople_04_01"); //Tak. Niejaki Monty - znikn�� bez �ladu.
	AI_Output	(self, other, "DIA_Addon_Garvell_MissingPeople_04_02"); //Pewnie ten obibok siedzi teraz na jakiej� farmie i cieszy si� �yciem... Nie trzeba by�o mu p�aci� z g�ry.
	
	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Garvell martwi si� o swojego robotnika, Monty'ego, kt�ry pewnego dnia nie przyszed� do pracy. Dziwne, bo dobrze mu si� uk�ada�o z farmerami."); 

	Info_ClearChoices	(DIA_Addon_Garvell_MissingPeople);
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "Podobno nie on jeden zagin��?", DIA_Addon_Garvell_MissingPeople_more );
	if (SCKnowsFarimAsWilliamsFriend == FALSE)
	{
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "Kiedy ostatnio widzia�e� Monty'ego?", DIA_Addon_Garvell_MissingPeople_wo );
	};
};
func void DIA_Addon_Garvell_MissingPeople_more ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_more_15_00"); //Podobno nie on jeden zagin��?
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_01"); //Tak - i tutaj zaczyna si� ca�y problem.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_02"); //Rybak Farim wspomnia�, �e zapodzia� si� gdzie� r�wnie� jego znajomy, William.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_03"); //Za�o�� si�, �e stoj� za tym orkowie.
	SCKnowsFarimAsWilliamsFriend = TRUE;

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Wygl�da na to, �e rybak Farim wie co� o miejscu pobytu swego przyjaciela Williama."); 
	
	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_MissingPeople, LogText_Addon_WilliamMissing); 

	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, DIALOG_BACK, DIA_Addon_Garvell_MissingPeople_BACK );

	if (Farim.aivar[AIV_TalkedToPlayer] == FALSE)
	{
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "Gdzie znajd� tego Farima?", DIA_Addon_Garvell_MissingPeople_Farim );
	};
};
func void DIA_Addon_Garvell_MissingPeople_BACK ()
{
	Info_ClearChoices	(DIA_Addon_Garvell_MissingPeople);
};
func void DIA_Addon_Garvell_MissingPeople_Farim ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_Farim_15_00"); //Gdzie znajd� tego Farima?
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_Farim_04_01"); //To rybak, wi�c pewnie gdzie� przy magazynie paladyn�w. G�owy jednak nie dam.

	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Chata Farima stoi w pobli�u magazynu paladyn�w."); 
};
func void DIA_Addon_Garvell_MissingPeople_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_wo_15_00"); //Kiedy ostatnio widzia�e� Monty'ego?
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_wo_04_01"); //Od dw�ch dni nie przychodzi do pracy.
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
	description	 = 	"Co s�ycha�?";
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
	AI_Output (other, self, "DIA_Addon_Garvell_ReturnMonty_15_00"); //Co s�ycha�?
	AI_Output (self, other, "DIA_Addon_Garvell_ReturnMonty_04_01"); //Monty wr�ci�! Przegl�da w�a�nie plany.
	AI_Output (self, other, "DIA_Addon_Garvell_ReturnMonty_04_02"); //Mo�e jednak uda si� skonstruowa� ten statek...
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
	description	 = 	"Czy mog� ci jako� pom�c?";
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
	AI_Output (other, self, "DIA_Garvell_MISSION_15_00"); //Czy mog� ci jako� pom�c?
	AI_Output (self, other, "DIA_Garvell_MISSION_04_01"); //Oczywi�cie. Spr�buj si� dowiedzie�, co planuj� paladyni. Jestem ciekaw, po co tu przybyli.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_02"); //Musz� wiedzie�, czy orkowie faktycznie zamierzaj� zaatakowa�, a je�li tak, to w jakiej odleg�o�ci od miasta si� znajduj�.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_03"); //Jeden z tych �mierdzieli podobno pojawi� si� tu� za miastem...
	AI_Output (self, other, "DIA_Garvell_MISSION_04_04"); //Po prostu dowiedz si� tyle, ile mo�esz.
	AI_Output (self ,other, "DIA_Garvell_Add_04_00"); //Chc� wiedzie�, ile mam jeszcze czasu na doko�czenie budowy okr�tu.

	MIS_Garvell_Infos = LOG_RUNNING;
	Knows_Ork = TRUE;
	
	Log_CreateTopic (TOPIC_Garvell,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Garvell,LOG_RUNNING);
	B_LogEntry (TOPIC_Garvell,"Garvell chce si� dowiedzie� jak najwi�cej na temat ork�w. Chce te� wiedzie�, czemu w mie�cie przebywaj� paladyni.");
};
FUNC VOID B_GarvellWeiter()
{
	AI_Output (self, other, "DIA_Garvell_Weiter_04_00"); //Dobrze. Je�li dowiesz si� czego� wi�cej, daj mi zna�.
};
FUNC VOID B_GarvellSuccess()
{
	AI_Output (self, other, "DIA_Garvell_Success_04_00"); //Dzi�kuj� za informacje. Wygl�da na to, �e mamy ca�� mas� czasu na uko�czenie naszego statku.
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
	description	 = 	"Mam informacje dotycz�ce ork�w.";
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
	AI_Output (other, self, "DIA_Garvell_Orks_15_00"); //Mam informacje dotycz�ce ork�w.
	AI_Output (self, other, "DIA_Garvell_Orks_04_01"); //S�ucham.
	AI_Output (other, self, "DIA_Garvell_Orks_15_02"); //Utkn�li w G�rniczej Dolinie, i wygl�da na to, �e ju� tam pozostan�.
	AI_Output (other, self, "DIA_Garvell_Orks_15_03"); //Paladyni strzeg� prze��czy.

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
	description	 = 	"Wiem, co tu robi� paladyni.";
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
	AI_Output (other, self, "DIA_Garvell_Paladine_15_00"); //Wiem, co tu robi� paladyni.
	AI_Output (self, other, "DIA_Garvell_Paladine_04_01"); //Naprawd�? Powiedz!
	AI_Output (other, self, "DIA_Garvell_Paladine_15_02"); //Paladyni nie przybyli tutaj, dlatego �e spodziewaj� si� ataku ork�w. Ich celem jest zdobycie magicznej rudy z G�rniczej Doliny.
	AI_Output (other, self, "DIA_Garvell_Paladine_15_03"); //Kiedy tylko j� zdob�d�, powr�c� na kontynent.

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
	AI_Output (other, self, "DIA_Garvell_City_15_02"); //Nie przejmuj si� nim. Stra� da sobie rad�.
	

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
	description	 = 	"Co si� dzieje w porcie?";
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
	AI_Output (other, self, "DIA_Garvell_Perm_15_00"); //Co si� dzieje w porcie?
	
	if (MIS_Garvell_Infos != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Garvell_Perm_04_01"); //Orkowie depcz� nam po pi�tach, a ty pytasz, co si� dzieje w porcie?
		AI_Output (other, self, "DIA_Garvell_Perm_15_02"); //Chcia�em tylko...
		AI_Output (self, other, "DIA_Garvell_Perm_04_03"); //Najwi�kszy problem w tym, �e w porcie jest zbyt ma�o statk�w, �eby wszyscy mogli si� ewakuowa�.
		AI_Output (self, other, "DIA_Garvell_Perm_04_04"); //Szczerze m�wi�c, to jest tu tylko jeden statek, i w dodatku nale�y do paladyn�w.
	}
	else
	{
		AI_Output (self, other, "DIA_Garvell_Perm_04_05"); //Mo�esz si� rozejrze�. Jak widzisz, nic si� tu nie dzieje.
	};
};
























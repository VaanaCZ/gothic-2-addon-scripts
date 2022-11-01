///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP1_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP1_EXIT_Condition;
	information = DIA_Karras_KAP1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Hello 		(C_INFO)
{
	npc			= KDF_503_Karras;
	nr          = 1;
	condition	= DIA_Karras_Hello_Condition;
	information	= DIA_Karras_Hello_Info;
	permanent   = FALSE;
	important	= TRUE;
};
func int DIA_Karras_Hello_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_NOVIZENCHASE != LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Karras_Hello_Info ()
{
	if (hero.guild == GIL_NOV)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_00"); //Co mogę dla ciebie uczynić, nowicjuszu?
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_01"); //Co mogę dla ciebie uczynić, Bracie?
	}
	else if (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_02"); //Czcigodni wojownicy Innosa rzadko zapuszczają się do tych sal.
		AI_Output			(self, other, "DIA_Karras_Hello_10_03"); //Co mogę dla ciebie zrobić?
	}
	else
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_04"); //Co tutaj robisz?
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info Mission
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Mission		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Mission_Condition;
	information	 = 	DIA_Karras_Mission_Info;
	permanent    =  FALSE;
	description	 = 	"Przyszedłem studiować pisma.";
};
func int DIA_Karras_Mission_Condition ()
{	
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Karras_Mission_Info ()
{
	AI_Output (other, self, "DIA_Karras_Mission_15_00"); //Przyszedłem studiować pisma.
	AI_Output (self, other, "DIA_Karras_Mission_10_01"); //Rozumiem. Jeśli znajdziesz trochę czasu, przyjdź do mnie.
	AI_Output (self, other, "DIA_Karras_Mission_10_02"); //Jest pewna sprawa, w której przydałaby mi się pomoc dyskretnego nowicjusza.
};
///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Aufgabe		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Aufgabe_Condition;
	information	 = 	DIA_Karras_Aufgabe_Info;
	permanent    =  FALSE;
	description	 = 	"Masz dla mnie jakieś zadanie?";
};
func int DIA_Karras_Aufgabe_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Karras_Mission)
	{
		return TRUE;
	};
};
func void DIA_Karras_Aufgabe_Info ()
{
	AI_Output (other, self, "DIA_Karras_Aufgabe_15_00"); //Masz dla mnie jakieś zadanie?
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_01"); //Tak. Chodzi o tego zwariowanego Ignaza. Mieszka w Khorinis i prowadzi eksperymenty nad przeróżnymi miksturami i napojami leczniczymi. No i nad zaklęciami.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_02"); //I to właśnie najbardziej mnie martwi. Widzisz, zastanawia mnie czasami, czy Innosowi podoba się ta jego magia.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_03"); //Aby się tego dowiedzieć, potrzebuję kilku jego magicznych zwojów.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_04"); //Chcę, abyś udał się do miasta i zdobył trzy magiczne zwoje jego produkcji.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_05"); //Tylko nikomu ani słowa - czy to jasne?
	AI_Output (other, self, "DIA_Karras_Aufgabe_15_06"); //Oczywiście.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_07"); //Oto 150 sztuk złota. Powinny pokryć twoje wydatki.
	
	MIS_KarrasVergessen = LOG_RUNNING;
	
	Log_CreateTopic (Topic_KarrasCharm,LOG_MISSION);
	Log_SetTopicStatus  (Topic_KarrasCharm,LOG_RUNNING);
	B_LogEntry (Topic_KarrasCharm,"Mistrz Karras kazał mi udać się do miasta i zdobyć trzy magiczne zwoje produkowane oraz sprzedawane przez Ignaza.");

	B_GiveInvItems (self, other, ItMi_Gold,150);
};
///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Success		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Success_Condition;
	information	 = 	DIA_Karras_Success_Info;
	permanent    =  FALSE;
	description	 = 	"Oto zwoje, o które prosiłeś.";
};
func int DIA_Karras_Success_Condition ()
{	
	if (MIS_KarrasVergessen == LOG_RUNNING)
	&& (Npc_HasItems (other, ItSc_Charm) >= 3)
	{
		return TRUE;
	};
};
func void DIA_Karras_Success_Info ()
{
	AI_Output (other, self, "DIA_Karras_Success_15_00"); //Oto zwoje, o które prosiłeś.
	AI_Output (self, other, "DIA_Karras_Success_10_01"); //Dobra robota, mój młody przyjacielu.
	AI_Output (self, other, "DIA_Karras_Success_10_02"); //A teraz pora poświęcić trochę czasu na studia.
	AI_Output (self, other, "DIA_Karras_Success_10_03"); //Aha, przyjmij ten zwój w nagrodę za dobrze wykonane zadanie.
	
	MIS_KarrasVergessen = LOG_SUCCESS;
	B_GivePlayerXP (XP_KarrasCharm);
	B_GiveInvItems (other, self, ItSc_Charm,3);
	B_GiveInvItems (self, other, ItSc_SumWolf,1);
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Trade		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Trade_Condition;
	information	 = 	DIA_Karras_Trade_Info;
	permanent    =  TRUE;
	description	 = 	"Pokaż mi swoje towary.";
	trade		 =  TRUE; 
};
func int DIA_Karras_Trade_Condition ()
{	
	if (hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Karras_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Karras_Trade_15_00"); //Pokaż mi swoje towary.
};
///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_JOB		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_JOB_Condition;
	information	 = 	DIA_Karras_JOB_Info;
	permanent    =  FALSE;
	description	 = 	"Na czym dokładnie polega twoja praca?";
};
func int DIA_Karras_JOB_Condition ()
{	
		return TRUE;
};
func void DIA_Karras_JOB_Info ()
{
	AI_Output (other, self, "DIA_Karras_JOB_15_00"); //Na czym dokładnie polega twoja praca?
	AI_Output (self, other, "DIA_Karras_JOB_10_01"); //Szkolę magów w dziedzinie manifestacji sferycznej.
	AI_Output (other, self, "DIA_Karras_JOB_15_02"); //Co to znaczy?
	AI_Output (self, other, "DIA_Karras_JOB_10_03"); //Mniej więcej tyle, że uczę ich, jak przywoływać przeróżne istoty z innych wymiarów lub sfer.
	AI_Output (self, other, "DIA_Karras_JOB_10_04"); //Zwykle nazywa się to przyzywaniem, choć ta nazwa nie opisuje w zadowalającym stopniu sztuki wzywania pomocnika.
	AI_Output (self, other, "DIA_Karras_JOB_10_05"); //Co więcej, jestem w posiadaniu pewnych interesujących zwojów magicznych, których nie ma Gorax.
	
	if (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Karras_JOB_10_06"); //Ale udostępniam je tylko członkom Zakonu.
	};
	Log_CreateTopic (Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry (Topic_KlosterTrader,"Mistrz Karras może mnie zaopatrzyć w magiczne zwoje. Najpierw jednak muszę zostać Magiem Ognia.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_TEACH		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr 			 =  10;
	condition	 = 	DIA_Karras_TEACH_Condition;
	information	 = 	DIA_Karras_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Nauczaj mnie (tworzenie run)";
};

func int DIA_Karras_TEACH_Condition ()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Karras_TEACH_Info ()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output (other, self, "DIA_Karras_TEACH_15_00"); //Zostań moim nauczycielem.
	
		Info_ClearChoices   (DIA_Karras_TEACH);
		
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 1)
		&& (PLAYER_TALENT_RUNES [SPL_SummonGoblinSkeleton] == FALSE) 
		{
			Info_AddChoice 		(DIA_Karras_TEACH,B_BuildLearnString (NAME_SPL_SummonGoblinSkeleton, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonGoblinSkeleton)),DIA_Karras_TEACH_SUMGOBL);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
		&& (PLAYER_TALENT_RUNES [SPL_SummonWolf] == FALSE) 
		{
			Info_AddChoice	    (DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonWolf, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonWolf)) ,DIA_Karras_TEACHSummonWolf);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 3)
		&& (PLAYER_TALENT_RUNES [SPL_SummonSkeleton] == FALSE) 
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonSkeleton, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonSkeleton)) ,DIA_Karras_TEACH_SummonSkeleton);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 4)
		&& (PLAYER_TALENT_RUNES [SPL_SummonGolem] == FALSE) 
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonGolem, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonGolem)) ,DIA_Karras_TEACH_SummonGolem);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 5)
		&& (PLAYER_TALENT_RUNES [SPL_SummonDemon] == FALSE)
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonDemon, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonDemon)) ,DIA_Karras_TEACH_SummonDemon);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 6)
		&& (PLAYER_TALENT_RUNES [SPL_ArmyOfDarkness] == FALSE)
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_ArmyOfDarkness, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ArmyOfDarkness)) ,DIA_Karras_TEACH_ArmyOfDarkness);
			abletolearn = (abletolearn +1);
		};
		if 	(abletolearn < 1)
		{
			AI_Output (self, other, "DIA_Karras_TEACH_10_01"); //W tym momencie nie ma nic, czego mógłbyś się ode mnie nauczyć.
		}
		else
		{
			Info_AddChoice 		(DIA_Karras_TEACH,DIALOG_BACK,DIA_Karras_TEACH_BACK);
		};

};
FUNC VOID DIA_Karras_TEACH_BACK()
{
	Info_ClearChoices   (DIA_Karras_TEACH);
};
FUNC VOID DIA_Karras_TEACH_SUMGOBL()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonGoblinSkeleton);	
};
FUNC VOID DIA_Karras_TEACHSummonWolf()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonWolf);	
};
FUNC VOID DIA_Karras_TEACH_SummonSkeleton()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonSkeleton);	
};
FUNC VOID DIA_Karras_TEACH_SummonGolem()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonGolem);	
};
FUNC VOID DIA_Karras_TEACH_SummonDemon()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonDemon);	
};
FUNC VOID DIA_Karras_TEACH_ArmyOfDarkness()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ArmyOfDarkness);	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_CIRCLE4		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	3;
	condition	 = 	DIA_Karras_CIRCLE4_Condition;
	information	 = 	DIA_Karras_CIRCLE4_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chcę zgłębiać czwarty krąg magii.";
};
func int DIA_Karras_CIRCLE4_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 3)
	{
		return TRUE;
	};
};
func void DIA_Karras_CIRCLE4_Info ()
{
	AI_Output (other, self, "DIA_Karras_CIRCLE4_15_00"); //Chcę zgłębiać czwarty krąg magii.
	
	if (MIS_ReadyforChapter4 == TRUE)
	{
		if B_TeachMagicCircle (self,other, 4)
		{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_01"); //Dobrze. Wszystkie znaki się wypełniły. Wkrocz zatem do czwartego kręgu, aby przepełniła cię moc nowej magii.
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_02"); //Przebyłeś daleką drogę, a Innos nadal będzie rozświetlał przed tobą ciemności.
		};
	}
	else
	{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_03"); //Bowiem to jeszcze nie koniec.
	};
};
/////////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_CIRCLE5		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	3;
	condition	 = 	DIA_Karras_CIRCLE5_Condition;
	information	 = 	DIA_Karras_CIRCLE5_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chcę zgłębiać piąty krąg magii.";
};
func int DIA_Karras_CIRCLE5_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 4)
	{
		return TRUE;
	};
};
func void DIA_Karras_CIRCLE5_Info ()
{
	AI_Output (other, self, "DIA_Karras_CIRCLE5_15_00"); //Chcę zgłębiać piąty krąg magii.
	
	if (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,other, 5)
		{
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_01"); //Wkrocz zatem do piątego kręgu. Poznasz magię potężniejszą niż wszystko, czego do tej pory doświadczyłeś.
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_02"); //Używaj tej mocy w rozważny sposób, Bracie - albowiem mrok wciąż jeszcze posiada ogromną moc, tak samo jak twoi wrogowie.
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_03"); //Nie mogę ci towarzyszyć w twojej podróży do szóstego, najwyższego kręgu magii. Kiedy nadejdzie właściwy czas, wprowadzi cię do niego sam Pyrokar.
			
			B_LogEntry (Topic_KlosterTeacher,"Mistrz Pyrokar wprowadzi mnie w szósty Krąg Magii.");
		};
	}
	else
	{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_04"); //Czas jeszcze nie nadszedł.
	};
};
//#####################################################################
//##
//##		Kapitel 2
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP2_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP2_EXIT_Condition;
	information = DIA_Karras_KAP2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//#####################################################################
//##
//##		Kapitel 3
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP3_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP3_EXIT_Condition;
	information = DIA_Karras_KAP3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_ChasePedro		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 =	31;
	condition	 = 	DIA_Karras_ChasePedro_Condition;
	information	 = 	DIA_Karras_ChasePedro_Info;
	permanent	 = 	FALSE;
	important 	 =  TRUE;
};

func int DIA_Karras_ChasePedro_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
	&& (KAPITEL == 3)
	&& (MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Karras_ChasePedro_Info ()
{
	if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Karras_ChasePedro_10_00"); //Bracie, nie wolno ci tracić czasu. Musisz odnaleźć Pedra i odzyskać Oko Innosa.
		AI_Output (self ,other,"DIA_Karras_ChasePedro_10_01"); //Jeśli Oko Innosa do nas nie wróci, będziemy zgubieni.
	}
	else
	{
		AI_Output	(self ,other, "DIA_Karras_ChasePedro_10_02"); //Co tutaj robisz? Czy nie powinieneś szukać tego podstępnego zdrajcy, Pedra?
	
		Info_ClearChoices (DIA_Karras_ChasePedro);
		Info_AddChoice (DIA_Karras_ChasePedro,"Później. Najpierw muszę się zająć inną sprawą.",DIA_Karras_ChasePedro_Later);
		Info_AddChoice (DIA_Karras_ChasePedro,"Nie ucieknie zbyt daleko.",DIA_Karras_ChasePedro_WontEscape);
	};

};	

func void DIA_Karras_ChasePedro_Later ()
{
	AI_Output (other,self ,"DIA_Karras_ChasePedro_Later_15_00"); //Później. Najpierw muszę się zająć inną sprawą.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_01"); //Czy wiesz, co ta strata oznacza dla naszego klasztoru? Oko Innosa to potężna broń!
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_02"); //Nie da się przewidzieć, co wróg zamierza zrobić z amuletem, ale na pewno ma wobec niego jakiś plan. Musimy go powstrzymać.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_03"); //Więc nie trać czasu i ruszaj za złodziejem!

	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Karras_ChasePedro_WontEscape ()
{
	AI_Output (other,self ,"DIA_Karras_ChasePedro_WontEscape_15_00"); //Nie ucieknie zbyt daleko.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_01"); //Mam taką nadzieję dla twojego własnego dobra. Jeśli okaże się, że uciekł przez twoje zaniedbanie, osobiście postawię cię przed trybunałem.
	AI_Output (other,self ,"DIA_Karras_ChasePedro_WontEscape_15_02"); //I o co mnie oskarżysz?
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_03"); //O współpracę z wrogiem. Nietrudno jest sobie chyba wyobrazić karę za taki występek.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_04"); //Dlatego też nie trać już więcej czasu, chyba że chcesz się ze mną spotkać w znacznie mniej przyjemnych okolicznościach.

	AI_StopProcessInfos (self);
};
	
///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_NeedInfo		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 =	31;
	condition	 = 	DIA_Karras_NeedInfo_Condition;
	information	 = 	DIA_Karras_NeedInfo_Info;
	permanent	 = 	TRUE;
	important	 =	TRUE;
};

func int DIA_Karras_NeedInfo_Condition ()
{	
	if (Npc_KnowsInfo  (other ,DIA_Karras_ChasePedro))
	&& (KAPITEL == 3)
	&& (hero.Guild != GIL_KDF)
	&& (MIS_NOVIZENCHASE == LOG_RUNNING)
	&& (Npc_IsInState (self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Karras_NeedInfo_Info ()
{
	
	AI_Output (self ,other,"DIA_Karras_NeedInfo_10_00"); //Wiesz wszystko, czego ci trzeba. A teraz ruszaj w drogę!
	
	AI_StopProcessInfos (self);
};

//********************************************************************
//		Auge gefunden
//********************************************************************

///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_InnosEyeRetrieved		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 =	1;	//damit auch ganz sicher diese Info kommt (wg hello)!!!!
	condition	 = 	DIA_Karras_InnosEyeRetrieved_Condition;
	information	 = 	DIA_Karras_InnosEyeRetrieved_Info;
	permanent	 = 	FALSE;
	description	 =	"Odzyskałem Oko Innosa.";
};

func int DIA_Karras_InnosEyeRetrieved_Condition ()
{	
	if	(KAPITEL == 3)
	&& 	(MIS_NOVIZENCHASE == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Karras_InnosEyeRetrieved_Info ()
{
	
	AI_Output (other,self ,"DIA_Karras_InnosEyeRetrieved_15_00"); //Odzyskałem Oko Innosa.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_01"); //Co za ulga, że udało ci się je wyrwać ze szponów wroga!
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_02"); //Jednak niebezpieczeństwo nie zostało jeszcze zażegnane. Słudzy zła wciąż knują swoje nikczemne plany, a tym razem są wyjątkowo zdeterminowani.
	AI_Output (other,self ,"DIA_Karras_InnosEyeRetrieved_15_03"); //O tym zdołałem się już sam przekonać.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_04"); //Nie drwij ze mnie. Sytuacja jest poważna, bardzo poważna, i nie bardzo wiemy, komu możemy zaufać.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_05"); //Skoro wrogowi udało się zwieść Pedra na drogę występku, należy się spodziewać, że inni również mu ulegną.

	B_GivePlayerXP (XP_AMBIENT);
};
	
///////////////////////////////////////////////////////////////////////
//	KAP3_Perm
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP3_Perm   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 5;
	condition   = DIA_Karras_KAP3_Perm_Condition;
	information = DIA_Karras_KAP3_Perm_Info;
	permanent   = TRUE;
	description = "Jak twoje studia?";
};
FUNC INT DIA_Karras_KAP3_Perm_Condition()
{
	if (Kapitel >= 3)
	&& (Npc_KnowsInfo(other, DIA_Karras_JOB))
		{
			return TRUE;
		};	
};
FUNC VOID DIA_Karras_KAP3_Perm_Info()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_00"); //Jak twoje studia?

	if (MIS_KarrasResearchDMT == FALSE)
	&& (PyrokarToldKarrasToResearchDMT == TRUE)
	&& (hero.guild == GIL_KDF)
	{
		
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_01"); //Udało mi się dotrzeć do informacji na temat Poszukiwaczy.
		AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_02"); //I czego się dowiedziałeś?
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_03"); //Najwyraźniej ich działaniami kierują, lub kierowały, demony.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_04"); //Bądź ostrożny, jeśli się na nich natkniesz.
		AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_05"); //To bardzo odkrywcze spostrzeżenie.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_06"); //Przykro mi, ale nie posiadam informacji, dzięki którym mógłbym udzielić ci lepszej rady.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_07"); //Gdybyś jednak mógł mi przynieść do zbadania jakiś przedmiot należący do Poszukiwaczy...
		
		MIS_KarrasResearchDMT = LOG_RUNNING;
		B_LogEntry (TOPIC_DEMENTOREN,"Aby móc dalej prowadzić swoje badania, Karras potrzebuje czegoś, z czym Poszukiwacze mieli bezpośredni kontakt."); 

		Info_ClearChoices (DIA_Karras_KAP3_Perm);
		Info_AddChoice (DIA_Karras_KAP3_Perm,DIALOG_BACK,DIA_Karras_KAP3_Perm_Back);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"Zobaczę, co się da zrobić.",DIA_Karras_KAP3_Perm_WillSee);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"Czy śniący może być w to zamieszany?",DIA_Karras_KAP3_Perm_Sleeper);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"Jakiego rodzaju materiałów potrzebujesz?",DIA_Karras_KAP3_Perm_Material);
	}
	else if MIS_KarrasResearchDMT == LOG_RUNNING 
	{
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_08"); //Wciąż jeszcze pracuję nad interpretacją wyników moich badań nad Poszukiwaczami.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_09"); //Kiedy tylko czegoś się dowiem, niezwłocznie dam ci znać.
	}
	else 
	{
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_10"); //Wróg ma wiele twarzy. Trudno stwierdzić, która z nich stanowi największe zagrożenie dla klasztoru.
	};
};


FUNC VOID DIA_Karras_KAP3_Perm_Back()
{
	Info_ClearChoices (DIA_Karras_KAP3_Perm);
};

FUNC VOID DIA_Karras_KAP3_Perm_Sleeper()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Sleeper_15_00"); //Czy Śniący może być w to zamieszany?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Sleeper_10_01"); //Słyszałem historię Śniącego. Jednak nie jestem w stanie wypowiedzieć się na ten temat.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Sleeper_10_02"); //Istnieje wiele demonów, i każdy z nich mógł w tym maczać palce.
};

FUNC VOID DIA_Karras_KAP3_Perm_Corpse()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Corpse_15_00"); //Chcesz, żebym przyniósł ci zwłoki?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_01"); //Postradałeś zmysły? Gdyby w murach naszego klasztoru znalazła się demoniczna istota, mogłoby to wywołać katastrofalne skutki.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_02"); //Wystarczy, jeśli przyniesiesz jakieś należące do nich przedmioty.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_03"); //Otaczające je pozostałości duchowej aury powinny dostarczyć nam cennych wskazówek.
};

FUNC VOID DIA_Karras_KAP3_Perm_Material()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Material_15_00"); //Jakiego rodzaju materiałów potrzebujesz?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Material_10_01"); //Sam nie wiem - czegokolwiek, co należy do tych istot.
	
	Info_AddChoice (DIA_Karras_KAP3_Perm,"Chcesz, żebym przyniósł ci zwłoki?",DIA_Karras_KAP3_Perm_Corpse);
};

FUNC VOID DIA_Karras_KAP3_Perm_WillSee()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_WillSee_15_00"); //Zobaczę, co się da zrobić.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_WillSee_10_01"); //Z pewnością bardzo by to nam pomogło. Ja tymczasem wracam do swoich badań.
	Info_ClearChoices (DIA_Karras_KAP3_Perm);
};

//********************************************************************
//	Ich habe hier dieses Buch.
//********************************************************************

INSTANCE DIA_Karras_HaveBook   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_HaveBook_Condition;
	information = DIA_Karras_HaveBook_Info;
	permanent   = FALSE;
	description = "Mam Almanach Potępionych.";
};
FUNC INT DIA_Karras_HaveBook_Condition()
{
	if (MIS_KarrasResearchDMT == LOG_RUNNING)
	&& (Npc_HasItems (hero, ITWR_DementorObsessionBook_MIS) >= 1)
	&& (hero.guild == GIL_KDF)
	{
		return TRUE;
	};	
};
var int KarrasGotResearchDMTBook_Day;
FUNC VOID DIA_Karras_HaveBook_Info()
{
	AI_Output (other,self ,"DIA_Karras_HaveBook_15_00"); //Mam tutaj almanach Opętanych. Może ci się przydać.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_01"); //Pokaż go.
	
	Npc_RemoveInvItems	(other,	ITWR_DementorObsessionBook_MIS,	1);
    AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
		
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_02"); //Tak, to może być to, czego szukamy. Zbadam tę księgę.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_03"); //W tej chwili jestem pewien tylko jednej rzeczy.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_04"); //Poszukiwacze są formą życia stworzoną przez Beliara.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_05"); //Są w połowie ludźmi, w połowie demonami.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_06"); //Wciąż jednak nie jestem w stanie określić, czy mamy tu do czynienia z opętaniem duchowym, czy z czysto fizyczną mutacją.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_07"); //Wróć później, na pewno będę ci mógł powiedzieć więcej na ten temat.
	MIS_KarrasResearchDMT = LOG_SUCCESS;
	B_LogEntry (TOPIC_DEMENTOREN,"Karras użyje w swoich dalszych badaniach Almanachu Opętanych. Mam do niego wrócić później."); 
	KarrasGotResearchDMTBook_Day = Wld_GetDay(); 
	B_GivePlayerXP (XP_KarrasResearchDMT);
};

//********************************************************************
//	ResearchDMTEnd
//********************************************************************

INSTANCE DIA_Karras_ResearchDMTEnd   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_ResearchDMTEnd_Condition;
	information = DIA_Karras_ResearchDMTEnd_Info;
	permanent   = TRUE;

	description = "Dowiedziałeś się czegoś nowego o Poszukiwaczach?";
};
FUNC INT DIA_Karras_ResearchDMTEnd_Condition()
{
	if (MIS_KarrasResearchDMT == LOG_SUCCESS)
	&& (hero.guild == GIL_KDF)
	&& (SC_KnowsMadPsi == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Karras_ResearchDMTEnd_Info()
{
	AI_Output (other,self ,"DIA_Karras_ResearchDMTEnd_15_00"); //Dowiedziałeś się czegoś nowego o Poszukiwaczach?

	if (KarrasGotResearchDMTBook_Day <= (Wld_GetDay()-2))
	{
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_01"); //Tak. Udało mi się ustalić, kim - lub czym - tak naprawdę są.
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_02"); //Mów prędko!
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_03"); //Niegdyś byli ludźmi, takimi jak ty czy ja. Popełnili jednak pewien błąd - pozwolili się opętać nieczystej magii pewnego bardzo potężnego demona.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_04"); //Pod jego wpływem, spotęgowanym jeszcze przez działanie silnych narkotyków, powoli stawali się tym, czym są teraz - ulotnymi cieniami samych siebie.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_05"); //Dzisiaj są jedynie narzędziami zła, nie posiadającymi własnej woli, mającymi tylko jeden cel - prześladowanie wyznawców Innosa.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_06"); //Musimy być ostrożni. Co prawda na razie zdają się unikać tych świętych murów...
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_07"); //Jednak jeśli staną się jeszcze silniejsi, nawet tutaj może zrobić się niebezpiecznie.
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_08"); //Dziękuję za wszystkie informacje.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_09"); //Niestety, to wszystko prowadzi do kolejnych pytań. Na przykład - kim byli w swoim prawdziwym życiu, albo jaki demon zamienił ich w to, czym są teraz?
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_10"); //Chyba się domyślam. To musi być sprawka Bractwa Śniącego. Znam tych ludzi.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_11"); //Mam nadzieję, że wiesz, na co się porywasz. Uważaj na siebie, Bracie.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_12"); //A... twój almanach. Nie będę go już potrzebował.

		CreateInvItems	(other,	ITWR_DementorObsessionBook_MIS,	1);
		AI_PrintScreen	(PRINT_ItemErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);	// "1 Gegenstand erhalten"

		SC_KnowsMadPsi = TRUE;
		B_LogEntry (TOPIC_DEMENTOREN,"Badania Karrasa zostały uwieńczone sukcesem. Między Bractwem śniącego a Poszukiwaczami istnieje jakieś powiązanie."); 
		B_GivePlayerXP (XP_SC_KnowsMadPsi);
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_13"); //Pracuję nad tym. Wróć później.
	};
};

//********************************************************************
//	Prot_BlackEye	(ItAm_Prot_BlackEye_Mis)
//********************************************************************

INSTANCE DIA_Karras_Prot_BlackEye   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_Prot_BlackEye_Condition;
	information = DIA_Karras_Prot_BlackEye_Info;
	permanent   = TRUE;

	description = "Czy istnieje jakiś skuteczny sposób obrony przed atakami Poszukiwaczy?";
};
FUNC INT DIA_Karras_Prot_BlackEye_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (Pyrokar_AskKarrasAboutDMTAmulett == TRUE)
	&& (MIS_Karras_FindBlessedStone == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Karras_JOB))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_Prot_BlackEye_Info()
{
	AI_Output (other,self ,"DIA_Karras_Prot_BlackEye_15_00"); //Czy istnieje jakiś skuteczny sposób obrony przed mentalnymi atakami Poszukiwaczy?

	if (SC_KnowsMadPsi == TRUE)
	{
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_01"); //Tak. Sądzę, że amulet zrobiony z kamienia z błogosławionej ziemi może zapewnić taką ochronę.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_02"); //Niestety, nie mam akurat żadnego pod ręką.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_03"); //Niektóre nasze kapliczki zostały wybudowane z takich właśnie kamieni.
		AI_Output (other,self ,"DIA_Karras_Prot_BlackEye_15_04"); //Dobrze, spróbuję zdobyć jeden z nich.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_05"); //Tak, to dobry pomysł. Pamiętaj tylko, żeby nie zniszczyć przy tym kapliczki, rozumiemy się?
		B_LogEntry (TOPIC_DEMENTOREN,"Karras może mi zapewnić ochronę przeciwko mentalnym atakom Poszukiwaczy. Potrzebuje do tego celu kamienia ze świętej ziemi - takiego, z którego zrobione są niektóre kapliczki."); 
		MIS_Karras_FindBlessedStone = LOG_RUNNING;
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_06"); //Nie mam pojęcia. Wciąż jeszcze brakuje mi wiedzy na ten temat. Wróć później, może będę już coś wiedział.
	};
};

//********************************************************************
//	KarrasBlessedStone	(ItAm_Prot_BlackEye_Mis)
//********************************************************************

INSTANCE DIA_Karras_KarrasBlessedStone   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_KarrasBlessedStone_Condition;
	information = DIA_Karras_KarrasBlessedStone_Info;

	description = "Mam tutaj kamień z błogosławionej ziemi.";
};
FUNC INT DIA_Karras_KarrasBlessedStone_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (Npc_HasItems (other,ItMi_KarrasBlessedStone_Mis))
	&& (MIS_Karras_FindBlessedStone == LOG_RUNNING)
	{
		return TRUE;
	};	
};
var int KarrasMakesBlessedStone_Day;
FUNC VOID DIA_Karras_KarrasBlessedStone_Info()
{
	AI_Output (other,self ,"DIA_Karras_KarrasBlessedStone_15_00"); //Mam tutaj kamień z błogosławionej ziemi.
	B_GiveInvItems (other, self, ItMi_KarrasBlessedStone_Mis,1);
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_01"); //Dobrze. Mam nadzieję, że żadna z kapliczek na tym nie ucierpiała.
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_02"); //Dobrze. Sporządzę z niego ochronny amulet, który będzie cię strzegł przed mrocznym spojrzeniem Poszukiwaczy.
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_03"); //Daj mi trochę czasu. Niezwłocznie przystąpię do pracy.
	KarrasMakesBlessedStone_Day = Wld_GetDay(); 
	MIS_Karras_FindBlessedStone	= LOG_SUCCESS;
	B_LogEntry (TOPIC_DEMENTOREN,"Karras dał mi amulet, który ochroni mnie przed mentalnymi atakami Poszukiwaczy. To powinno mi trochę ułatwić życie."); 
	B_GivePlayerXP (XP_Karras_FoundBlessedStone);
	AI_StopProcessInfos (self);
};

//********************************************************************
//	ItAm_Prot_BlackEye_Mis
//********************************************************************

INSTANCE DIA_Karras_ItAm_Prot_BlackEye_Mis   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_ItAm_Prot_BlackEye_Mis_Condition;
	information = DIA_Karras_ItAm_Prot_BlackEye_Mis_Info;
	permanent	 = 	TRUE;

	description = "Co z ochronnym amuletem, który mi obiecałeś?";
};
var int DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm;
FUNC INT DIA_Karras_ItAm_Prot_BlackEye_Mis_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (MIS_Karras_FindBlessedStone == LOG_SUCCESS)
	&& (DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Karras_ItAm_Prot_BlackEye_Mis_Info()
{
	AI_Output (other,self ,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_00"); //Co z ochronnym amuletem, który mi obiecałeś?
	
	if (KarrasMakesBlessedStone_Day<=(Wld_GetDay()-2))
	{
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_01"); //Właśnie go skończyłem. Proszę, oto on. Czyż nie jest piękny?
		CreateInvItems (self, ItAm_Prot_BlackEye_Mis, 1);									
		B_GiveInvItems (self, other, ItAm_Prot_BlackEye_Mis, 1);					
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_02"); //Miej go zawsze przy sobie, a Poszukiwacze nie będą mogli wniknąć w twój umysł.
		AI_Output (other,self ,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_03"); //Dziękuję.
		B_LogEntry (TOPIC_DEMENTOREN,"Karras dał mi amulet, który ochroni mnie przez mrocznym spojrzeniem Poszukiwaczy."); 
		DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm = TRUE;
		B_GivePlayerXP (XP_Ambient);
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_04"); //Cierpliwości. Wciąż jeszcze nad nim pracuję.
	};
};

//#####################################################################
//##
//##		Kapitel 4
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Kap4 Exit	
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP4_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP4_EXIT_Condition;
	information = DIA_Karras_KAP4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


//#####################################################################
//##
//##		Kapitel 5
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP5_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP5_EXIT_Condition;
	information = DIA_Karras_KAP5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Karras_PICKPOCKET (C_INFO)
{
	npc			= KDF_503_Karras;
	nr			= 900;
	condition	= DIA_Karras_PICKPOCKET_Condition;
	information	= DIA_Karras_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Karras_PICKPOCKET_Condition()
{
	C_Beklauen (49, 35);
};
 
FUNC VOID DIA_Karras_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Karras_PICKPOCKET);
	Info_AddChoice		(DIA_Karras_PICKPOCKET, DIALOG_BACK 		,DIA_Karras_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Karras_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Karras_PICKPOCKET_DoIt);
};

func void DIA_Karras_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Karras_PICKPOCKET);
};
	
func void DIA_Karras_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Karras_PICKPOCKET);
};



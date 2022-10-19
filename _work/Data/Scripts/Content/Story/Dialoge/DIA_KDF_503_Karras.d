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
		AI_Output			(self, other, "DIA_Karras_Hello_10_00"); //Co mog� dla ciebie uczyni�, nowicjuszu?
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_01"); //Co mog� dla ciebie uczyni�, Bracie?
	}
	else if (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_02"); //Czcigodni wojownicy Innosa rzadko zapuszczaj� si� do tych sal.
		AI_Output			(self, other, "DIA_Karras_Hello_10_03"); //Co mog� dla ciebie zrobi�?
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
	description	 = 	"Przyszed�em studiowa� pisma.";
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
	AI_Output (other, self, "DIA_Karras_Mission_15_00"); //Przyszed�em studiowa� pisma.
	AI_Output (self, other, "DIA_Karras_Mission_10_01"); //Rozumiem. Je�li znajdziesz troch� czasu, przyjd� do mnie.
	AI_Output (self, other, "DIA_Karras_Mission_10_02"); //Jest pewna sprawa, w kt�rej przyda�aby mi si� pomoc dyskretnego nowicjusza.
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
	description	 = 	"Masz dla mnie jakie� zadanie?";
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
	AI_Output (other, self, "DIA_Karras_Aufgabe_15_00"); //Masz dla mnie jakie� zadanie?
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_01"); //Tak. Chodzi o tego zwariowanego Ignaza. Mieszka w Khorinis i prowadzi eksperymenty nad przer�nymi miksturami i napojami leczniczymi. No i nad zakl�ciami.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_02"); //I to w�a�nie najbardziej mnie martwi. Widzisz, zastanawia mnie czasami, czy Innosowi podoba si� ta jego magia.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_03"); //Aby si� tego dowiedzie�, potrzebuj� kilku jego magicznych zwoj�w.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_04"); //Chc�, aby� uda� si� do miasta i zdoby� trzy magiczne zwoje jego produkcji.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_05"); //Tylko nikomu ani s�owa - czy to jasne?
	AI_Output (other, self, "DIA_Karras_Aufgabe_15_06"); //Oczywi�cie.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_07"); //Oto 150 sztuk z�ota. Powinny pokry� twoje wydatki.
	
	MIS_KarrasVergessen = LOG_RUNNING;
	
	Log_CreateTopic (Topic_KarrasCharm,LOG_MISSION);
	Log_SetTopicStatus  (Topic_KarrasCharm,LOG_RUNNING);
	B_LogEntry (Topic_KarrasCharm,"Mistrz Karras kaza� mi uda� si� do miasta i zdoby� trzy magiczne zwoje produkowane oraz sprzedawane przez Ignaza.");

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
	description	 = 	"Oto zwoje, o kt�re prosi�e�.";
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
	AI_Output (other, self, "DIA_Karras_Success_15_00"); //Oto zwoje, o kt�re prosi�e�.
	AI_Output (self, other, "DIA_Karras_Success_10_01"); //Dobra robota, m�j m�ody przyjacielu.
	AI_Output (self, other, "DIA_Karras_Success_10_02"); //A teraz pora po�wi�ci� troch� czasu na studia.
	AI_Output (self, other, "DIA_Karras_Success_10_03"); //Aha, przyjmij ten zw�j w nagrod� za dobrze wykonane zadanie.
	
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
	description	 = 	"Poka� mi swoje towary.";
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
	AI_Output (other, self, "DIA_Karras_Trade_15_00"); //Poka� mi swoje towary.
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
	description	 = 	"Na czym dok�adnie polega twoja praca?";
};
func int DIA_Karras_JOB_Condition ()
{	
		return TRUE;
};
func void DIA_Karras_JOB_Info ()
{
	AI_Output (other, self, "DIA_Karras_JOB_15_00"); //Na czym dok�adnie polega twoja praca?
	AI_Output (self, other, "DIA_Karras_JOB_10_01"); //Szkol� mag�w w dziedzinie manifestacji sferycznej.
	AI_Output (other, self, "DIA_Karras_JOB_15_02"); //Co to znaczy?
	AI_Output (self, other, "DIA_Karras_JOB_10_03"); //Mniej wi�cej tyle, �e ucz� ich, jak przywo�ywa� przer�ne istoty z innych wymiar�w lub sfer.
	AI_Output (self, other, "DIA_Karras_JOB_10_04"); //Zwykle nazywa si� to przyzywaniem, cho� ta nazwa nie opisuje w zadowalaj�cym stopniu sztuki wzywania pomocnika.
	AI_Output (self, other, "DIA_Karras_JOB_10_05"); //Co wi�cej, jestem w posiadaniu pewnych interesuj�cych zwoj�w magicznych, kt�rych nie ma Gorax.
	
	if (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Karras_JOB_10_06"); //Ale udost�pniam je tylko cz�onkom Zakonu.
	};
	Log_CreateTopic (Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry (Topic_KlosterTrader,"Mistrz Karras mo�e mnie zaopatrzy� w magiczne zwoje. Najpierw jednak musz� zosta� Magiem Ognia.");
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
	AI_Output (other, self, "DIA_Karras_TEACH_15_00"); //Zosta� moim nauczycielem.
	
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
			AI_Output (self, other, "DIA_Karras_TEACH_10_01"); //W tym momencie nie ma nic, czego m�g�by� si� ode mnie nauczy�.
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
	description	 = 	"Chc� zg��bia� czwarty kr�g magii.";
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
	AI_Output (other, self, "DIA_Karras_CIRCLE4_15_00"); //Chc� zg��bia� czwarty kr�g magii.
	
	if (MIS_ReadyforChapter4 == TRUE)
	{
		if B_TeachMagicCircle (self,other, 4)
		{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_01"); //Dobrze. Wszystkie znaki si� wype�ni�y. Wkrocz zatem do czwartego kr�gu, aby przepe�ni�a ci� moc nowej magii.
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_02"); //Przeby�e� dalek� drog�, a Innos nadal b�dzie roz�wietla� przed tob� ciemno�ci.
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
	description	 = 	"Chc� zg��bia� pi�ty kr�g magii.";
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
	AI_Output (other, self, "DIA_Karras_CIRCLE5_15_00"); //Chc� zg��bia� pi�ty kr�g magii.
	
	if (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,other, 5)
		{
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_01"); //Wkrocz zatem do pi�tego kr�gu. Poznasz magi� pot�niejsz� ni� wszystko, czego do tej pory do�wiadczy�e�.
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_02"); //U�ywaj tej mocy w rozwa�ny spos�b, Bracie - albowiem mrok wci�� jeszcze posiada ogromn� moc, tak samo jak twoi wrogowie.
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_03"); //Nie mog� ci towarzyszy� w twojej podr�y do sz�stego, najwy�szego kr�gu magii. Kiedy nadejdzie w�a�ciwy czas, wprowadzi ci� do niego sam Pyrokar.
			
			B_LogEntry (Topic_KlosterTeacher,"Mistrz Pyrokar wprowadzi mnie w sz�sty Kr�g Magii.");
		};
	}
	else
	{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_04"); //Czas jeszcze nie nadszed�.
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
		AI_Output (self ,other,"DIA_Karras_ChasePedro_10_00"); //Bracie, nie wolno ci traci� czasu. Musisz odnale�� Pedra i odzyska� Oko Innosa.
		AI_Output (self ,other,"DIA_Karras_ChasePedro_10_01"); //Je�li Oko Innosa do nas nie wr�ci, b�dziemy zgubieni.
	}
	else
	{
		AI_Output	(self ,other, "DIA_Karras_ChasePedro_10_02"); //Co tutaj robisz? Czy nie powiniene� szuka� tego podst�pnego zdrajcy, Pedra?
	
		Info_ClearChoices (DIA_Karras_ChasePedro);
		Info_AddChoice (DIA_Karras_ChasePedro,"P�niej. Najpierw musz� si� zaj�� inn� spraw�.",DIA_Karras_ChasePedro_Later);
		Info_AddChoice (DIA_Karras_ChasePedro,"Nie ucieknie zbyt daleko.",DIA_Karras_ChasePedro_WontEscape);
	};

};	

func void DIA_Karras_ChasePedro_Later ()
{
	AI_Output (other,self ,"DIA_Karras_ChasePedro_Later_15_00"); //P�niej. Najpierw musz� si� zaj�� inn� spraw�.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_01"); //Czy wiesz, co ta strata oznacza dla naszego klasztoru? Oko Innosa to pot�na bro�!
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_02"); //Nie da si� przewidzie�, co wr�g zamierza zrobi� z amuletem, ale na pewno ma wobec niego jaki� plan. Musimy go powstrzyma�.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_03"); //Wi�c nie tra� czasu i ruszaj za z�odziejem!

	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Karras_ChasePedro_WontEscape ()
{
	AI_Output (other,self ,"DIA_Karras_ChasePedro_WontEscape_15_00"); //Nie ucieknie zbyt daleko.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_01"); //Mam tak� nadziej� dla twojego w�asnego dobra. Je�li oka�e si�, �e uciek� przez twoje zaniedbanie, osobi�cie postawi� ci� przed trybuna�em.
	AI_Output (other,self ,"DIA_Karras_ChasePedro_WontEscape_15_02"); //I o co mnie oskar�ysz?
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_03"); //O wsp�prac� z wrogiem. Nietrudno jest sobie chyba wyobrazi� kar� za taki wyst�pek.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_04"); //Dlatego te� nie tra� ju� wi�cej czasu, chyba �e chcesz si� ze mn� spotka� w znacznie mniej przyjemnych okoliczno�ciach.

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
	
	AI_Output (self ,other,"DIA_Karras_NeedInfo_10_00"); //Wiesz wszystko, czego ci trzeba. A teraz ruszaj w drog�!
	
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
	description	 =	"Odzyska�em Oko Innosa.";
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
	
	AI_Output (other,self ,"DIA_Karras_InnosEyeRetrieved_15_00"); //Odzyska�em Oko Innosa.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_01"); //Co za ulga, �e uda�o ci si� je wyrwa� ze szpon�w wroga!
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_02"); //Jednak niebezpiecze�stwo nie zosta�o jeszcze za�egnane. S�udzy z�a wci�� knuj� swoje nikczemne plany, a tym razem s� wyj�tkowo zdeterminowani.
	AI_Output (other,self ,"DIA_Karras_InnosEyeRetrieved_15_03"); //O tym zdo�a�em si� ju� sam przekona�.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_04"); //Nie drwij ze mnie. Sytuacja jest powa�na, bardzo powa�na, i nie bardzo wiemy, komu mo�emy zaufa�.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_05"); //Skoro wrogowi uda�o si� zwie�� Pedra na drog� wyst�pku, nale�y si� spodziewa�, �e inni r�wnie� mu ulegn�.

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
		
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_01"); //Uda�o mi si� dotrze� do informacji na temat Poszukiwaczy.
		AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_02"); //I czego si� dowiedzia�e�?
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_03"); //Najwyra�niej ich dzia�aniami kieruj�, lub kierowa�y, demony.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_04"); //B�d� ostro�ny, je�li si� na nich natkniesz.
		AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_05"); //To bardzo odkrywcze spostrze�enie.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_06"); //Przykro mi, ale nie posiadam informacji, dzi�ki kt�rym m�g�bym udzieli� ci lepszej rady.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_07"); //Gdyby� jednak m�g� mi przynie�� do zbadania jaki� przedmiot nale��cy do Poszukiwaczy...
		
		MIS_KarrasResearchDMT = LOG_RUNNING;
		B_LogEntry (TOPIC_DEMENTOREN,"Aby m�c dalej prowadzi� swoje badania, Karras potrzebuje czego�, z czym Poszukiwacze mieli bezpo�redni kontakt."); 

		Info_ClearChoices (DIA_Karras_KAP3_Perm);
		Info_AddChoice (DIA_Karras_KAP3_Perm,DIALOG_BACK,DIA_Karras_KAP3_Perm_Back);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"Zobacz�, co si� da zrobi�.",DIA_Karras_KAP3_Perm_WillSee);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"Czy �ni�cy mo�e by� w to zamieszany?",DIA_Karras_KAP3_Perm_Sleeper);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"Jakiego rodzaju materia��w potrzebujesz?",DIA_Karras_KAP3_Perm_Material);
	}
	else if MIS_KarrasResearchDMT == LOG_RUNNING 
	{
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_08"); //Wci�� jeszcze pracuj� nad interpretacj� wynik�w moich bada� nad Poszukiwaczami.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_09"); //Kiedy tylko czego� si� dowiem, niezw�ocznie dam ci zna�.
	}
	else 
	{
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_10"); //Wr�g ma wiele twarzy. Trudno stwierdzi�, kt�ra z nich stanowi najwi�ksze zagro�enie dla klasztoru.
	};
};


FUNC VOID DIA_Karras_KAP3_Perm_Back()
{
	Info_ClearChoices (DIA_Karras_KAP3_Perm);
};

FUNC VOID DIA_Karras_KAP3_Perm_Sleeper()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Sleeper_15_00"); //Czy �ni�cy mo�e by� w to zamieszany?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Sleeper_10_01"); //S�ysza�em histori� �ni�cego. Jednak nie jestem w stanie wypowiedzie� si� na ten temat.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Sleeper_10_02"); //Istnieje wiele demon�w, i ka�dy z nich m�g� w tym macza� palce.
};

FUNC VOID DIA_Karras_KAP3_Perm_Corpse()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Corpse_15_00"); //Chcesz, �ebym przyni�s� ci zw�oki?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_01"); //Postrada�e� zmys�y? Gdyby w murach naszego klasztoru znalaz�a si� demoniczna istota, mog�oby to wywo�a� katastrofalne skutki.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_02"); //Wystarczy, je�li przyniesiesz jakie� nale��ce do nich przedmioty.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_03"); //Otaczaj�ce je pozosta�o�ci duchowej aury powinny dostarczy� nam cennych wskaz�wek.
};

FUNC VOID DIA_Karras_KAP3_Perm_Material()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Material_15_00"); //Jakiego rodzaju materia��w potrzebujesz?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Material_10_01"); //Sam nie wiem - czegokolwiek, co nale�y do tych istot.
	
	Info_AddChoice (DIA_Karras_KAP3_Perm,"Chcesz, �ebym przyni�s� ci zw�oki?",DIA_Karras_KAP3_Perm_Corpse);
};

FUNC VOID DIA_Karras_KAP3_Perm_WillSee()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_WillSee_15_00"); //Zobacz�, co si� da zrobi�.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_WillSee_10_01"); //Z pewno�ci� bardzo by to nam pomog�o. Ja tymczasem wracam do swoich bada�.
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
	description = "Mam Almanach Pot�pionych.";
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
	AI_Output (other,self ,"DIA_Karras_HaveBook_15_00"); //Mam tutaj almanach Op�tanych. Mo�e ci si� przyda�.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_01"); //Poka� go.
	
	Npc_RemoveInvItems	(other,	ITWR_DementorObsessionBook_MIS,	1);
    AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
		
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_02"); //Tak, to mo�e by� to, czego szukamy. Zbadam t� ksi�g�.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_03"); //W tej chwili jestem pewien tylko jednej rzeczy.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_04"); //Poszukiwacze s� form� �ycia stworzon� przez Beliara.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_05"); //S� w po�owie lud�mi, w po�owie demonami.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_06"); //Wci�� jednak nie jestem w stanie okre�li�, czy mamy tu do czynienia z op�taniem duchowym, czy z czysto fizyczn� mutacj�.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_07"); //Wr�� p�niej, na pewno b�d� ci m�g� powiedzie� wi�cej na ten temat.
	MIS_KarrasResearchDMT = LOG_SUCCESS;
	B_LogEntry (TOPIC_DEMENTOREN,"Karras u�yje w swoich dalszych badaniach Almanachu Op�tanych. Mam do niego wr�ci� p�niej."); 
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

	description = "Dowiedzia�e� si� czego� nowego o Poszukiwaczach?";
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
	AI_Output (other,self ,"DIA_Karras_ResearchDMTEnd_15_00"); //Dowiedzia�e� si� czego� nowego o Poszukiwaczach?

	if (KarrasGotResearchDMTBook_Day <= (Wld_GetDay()-2))
	{
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_01"); //Tak. Uda�o mi si� ustali�, kim - lub czym - tak naprawd� s�.
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_02"); //M�w pr�dko!
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_03"); //Niegdy� byli lud�mi, takimi jak ty czy ja. Pope�nili jednak pewien b��d - pozwolili si� op�ta� nieczystej magii pewnego bardzo pot�nego demona.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_04"); //Pod jego wp�ywem, spot�gowanym jeszcze przez dzia�anie silnych narkotyk�w, powoli stawali si� tym, czym s� teraz - ulotnymi cieniami samych siebie.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_05"); //Dzisiaj s� jedynie narz�dziami z�a, nie posiadaj�cymi w�asnej woli, maj�cymi tylko jeden cel - prze�ladowanie wyznawc�w Innosa.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_06"); //Musimy by� ostro�ni. Co prawda na razie zdaj� si� unika� tych �wi�tych mur�w...
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_07"); //Jednak je�li stan� si� jeszcze silniejsi, nawet tutaj mo�e zrobi� si� niebezpiecznie.
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_08"); //Dzi�kuj� za wszystkie informacje.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_09"); //Niestety, to wszystko prowadzi do kolejnych pyta�. Na przyk�ad - kim byli w swoim prawdziwym �yciu, albo jaki demon zamieni� ich w to, czym s� teraz?
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_10"); //Chyba si� domy�lam. To musi by� sprawka Bractwa �ni�cego. Znam tych ludzi.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_11"); //Mam nadziej�, �e wiesz, na co si� porywasz. Uwa�aj na siebie, Bracie.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_12"); //A... tw�j almanach. Nie b�d� go ju� potrzebowa�.

		CreateInvItems	(other,	ITWR_DementorObsessionBook_MIS,	1);
		AI_PrintScreen	(PRINT_ItemErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);	// "1 Gegenstand erhalten"

		SC_KnowsMadPsi = TRUE;
		B_LogEntry (TOPIC_DEMENTOREN,"Badania Karrasa zosta�y uwie�czone sukcesem. Mi�dzy Bractwem �ni�cego a Poszukiwaczami istnieje jakie� powi�zanie."); 
		B_GivePlayerXP (XP_SC_KnowsMadPsi);
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_13"); //Pracuj� nad tym. Wr�� p�niej.
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

	description = "Czy istnieje jaki� skuteczny spos�b obrony przed atakami Poszukiwaczy?";
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
	AI_Output (other,self ,"DIA_Karras_Prot_BlackEye_15_00"); //Czy istnieje jaki� skuteczny spos�b obrony przed mentalnymi atakami Poszukiwaczy?

	if (SC_KnowsMadPsi == TRUE)
	{
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_01"); //Tak. S�dz�, �e amulet zrobiony z kamienia z b�ogos�awionej ziemi mo�e zapewni� tak� ochron�.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_02"); //Niestety, nie mam akurat �adnego pod r�k�.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_03"); //Niekt�re nasze kapliczki zosta�y wybudowane z takich w�a�nie kamieni.
		AI_Output (other,self ,"DIA_Karras_Prot_BlackEye_15_04"); //Dobrze, spr�buj� zdoby� jeden z nich.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_05"); //Tak, to dobry pomys�. Pami�taj tylko, �eby nie zniszczy� przy tym kapliczki, rozumiemy si�?
		B_LogEntry (TOPIC_DEMENTOREN,"Karras mo�e mi zapewni� ochron� przeciwko mentalnym atakom Poszukiwaczy. Potrzebuje do tego celu kamienia ze �wi�tej ziemi - takiego, z kt�rego zrobione s� niekt�re kapliczki."); 
		MIS_Karras_FindBlessedStone = LOG_RUNNING;
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_06"); //Nie mam poj�cia. Wci�� jeszcze brakuje mi wiedzy na ten temat. Wr�� p�niej, mo�e b�d� ju� co� wiedzia�.
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

	description = "Mam tutaj kamie� z b�ogos�awionej ziemi.";
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
	AI_Output (other,self ,"DIA_Karras_KarrasBlessedStone_15_00"); //Mam tutaj kamie� z b�ogos�awionej ziemi.
	B_GiveInvItems (other, self, ItMi_KarrasBlessedStone_Mis,1);
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_01"); //Dobrze. Mam nadziej�, �e �adna z kapliczek na tym nie ucierpia�a.
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_02"); //Dobrze. Sporz�dz� z niego ochronny amulet, kt�ry b�dzie ci� strzeg� przed mrocznym spojrzeniem Poszukiwaczy.
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_03"); //Daj mi troch� czasu. Niezw�ocznie przyst�pi� do pracy.
	KarrasMakesBlessedStone_Day = Wld_GetDay(); 
	MIS_Karras_FindBlessedStone	= LOG_SUCCESS;
	B_LogEntry (TOPIC_DEMENTOREN,"Karras da� mi amulet, kt�ry ochroni mnie przed mentalnymi atakami Poszukiwaczy. To powinno mi troch� u�atwi� �ycie."); 
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

	description = "Co z ochronnym amuletem, kt�ry mi obieca�e�?";
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
	AI_Output (other,self ,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_00"); //Co z ochronnym amuletem, kt�ry mi obieca�e�?
	
	if (KarrasMakesBlessedStone_Day<=(Wld_GetDay()-2))
	{
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_01"); //W�a�nie go sko�czy�em. Prosz�, oto on. Czy� nie jest pi�kny?
		CreateInvItems (self, ItAm_Prot_BlackEye_Mis, 1);									
		B_GiveInvItems (self, other, ItAm_Prot_BlackEye_Mis, 1);					
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_02"); //Miej go zawsze przy sobie, a Poszukiwacze nie b�d� mogli wnikn�� w tw�j umys�.
		AI_Output (other,self ,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_03"); //Dzi�kuj�.
		B_LogEntry (TOPIC_DEMENTOREN,"Karras da� mi amulet, kt�ry ochroni mnie przez mrocznym spojrzeniem Poszukiwaczy."); 
		DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm = TRUE;
		B_GivePlayerXP (XP_Ambient);
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_04"); //Cierpliwo�ci. Wci�� jeszcze nad nim pracuj�.
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



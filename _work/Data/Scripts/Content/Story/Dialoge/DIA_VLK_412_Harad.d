// *****************************************************
// 							EXIT 
// *****************************************************
INSTANCE DIA_Harad_EXIT   (C_INFO)
{
	npc         = VLK_412_Harad;
	nr          = 999;
	condition   = DIA_Harad_EXIT_Condition;
	information = DIA_Harad_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Harad_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Harad_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// *****************************************************
// 							Hallo
// *****************************************************
instance DIA_Harad_Hallo		(C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 2;
	condition	= DIA_Harad_Hallo_Condition;
	information	= DIA_Harad_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
func int DIA_Harad_Hallo_Condition ()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Harad_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Harad_Hallo_12_00"); //Czego chcesz?
};

// *****************************************************
// 							Arbeit
// *****************************************************
instance DIA_Harad_Arbeit		(C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 1;
	condition	= DIA_Harad_Arbeit_Condition;
	information	= DIA_Harad_Arbeit_Info;
	permanent   = FALSE;
	description = "Szukam pracy.";
};
func int DIA_Harad_Arbeit_Condition ()
{
	return TRUE;
};
func void DIA_Harad_Arbeit_Info ()
{
	AI_Output (other, self, "DIA_Harad_Arbeit_15_00"); //Szukam pracy!
	AI_Output (self, other, "DIA_Harad_Arbeit_12_01"); //Hmmm... przyda³by mi siê nowy czeladnik.
	AI_Output (self, other, "DIA_Harad_Arbeit_12_02"); //Brian nied³ugo skoñczy terminowanie i wyjedzie z miasta.
	AI_Output (self, other, "DIA_Harad_Arbeit_12_03"); //Umiesz coœ?
	AI_Output (other, self, "DIA_Harad_Arbeit_15_04"); //Jeœli pytasz, czy znam siê trochê na kowalstwie...
	AI_Output (self, other, "DIA_Harad_Arbeit_12_05"); //Nie. Nie o to mi chodzi³o.
	AI_Output (self, other, "DIA_Harad_Arbeit_12_06"); //Wczeœniej czy póŸniej orkowie zaczn¹ oblê¿enie miasta, a wtedy liczyæ siê bêd¹ tylko ci, którzy mog¹ stan¹æ w jego obronie.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Harad_Arbeit_12_07"); //Nie przyjmê na czeladnika kogoœ, kto przyniesie mi hañbê, uciekaj¹c z miasta razem z kobietami i nierobami, zamiast walczyæ ramiê w ramiê z prawdziwymi mê¿czyznami.
	};
	
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling,"Jeœli zdo³am przekonaæ Harada, ¿e jestem godny zaufania, przyjmie mnie na swojego czeladnika.");
};

// *****************************************************
// 						MIS_Orc
// *****************************************************
instance DIA_Harad_Taugenichts (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 1;
	condition	= DIA_Harad_Taugenichts_Condition;
	information	= DIA_Harad_Taugenichts_Info;
	permanent   = FALSE;
	description = "Nie jestem ¿adnym nierobem!";
};
func int DIA_Harad_Taugenichts_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Harad_Arbeit))
	{
		return TRUE;
	};
};
func void DIA_Harad_Taugenichts_Info ()
{
	AI_Output (other, self, "DIA_Harad_Taugenichts_15_00"); //Nie jestem ¿adnym nierobem!
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_01"); //To wielkie s³owa! Potrafisz je poprzeæ wielkimi czynami?
	AI_Output (other, self, "DIA_Harad_Taugenichts_15_02"); //Do czego zmierzasz?
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_03"); //Przynieœ mi broñ orka.
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_04"); //W pobli¿u miasta widziano orków. Przy odrobinie szczêœcia nie bêdziesz musia³ d³ugo szukaæ.
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_05"); //Je¿eli uda ci siê pokonaæ jednego z nich, przyjmê ciê na czeladnika.
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_06"); //Zak³adaj¹c oczywiœcie, ¿e zgodz¹ siê na to pozostali mistrzowie.
	
	MIS_Harad_Orc = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HaradOrk,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HaradOrk,LOG_RUNNING);
	B_LogEntry (TOPIC_HaradOrk,"Poza murami miasta zauwa¿ono orka. Kowal Harad chce, abym go zabi³. Kiedy wykonam zadanie, mam przynieœæ jego broñ.");
};

// *****************************************************
// 						Orc Running
// *****************************************************
instance DIA_Harad_OrcRunning (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 1;
	condition	= DIA_Harad_OrcRunning_Condition;
	information	= DIA_Harad_OrcRunning_Info;
	permanent   = FALSE;
	description = "Porozmawiajmy jeszcze raz o tej sprawie z orkiem...";
};
func int DIA_Harad_OrcRunning_Condition ()
{
	if (MIS_Harad_Orc == LOG_RUNNING)
	&& (Harad_HakonMission == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Harad_OrcRunning_Info ()
{
	AI_Output (other, self, "DIA_Harad_OrcRunning_15_00"); //Porozmawiajmy jeszcze raz o tej sprawie z orkiem...
	AI_Output (self, other, "DIA_Harad_OrcRunning_12_01"); //Co?
	
	Info_ClearChoices (DIA_Harad_OrcRunning);	
	Info_AddChoice (DIA_Harad_OrcRunning, "Twój ork jest ju¿ martwy!", DIA_Harad_OrcRunning_Done);
	Info_AddChoice (DIA_Harad_OrcRunning, "Ork to diabelnie twardy przeciwnik...", DIA_Harad_OrcRunning_TooHard);

	//AI_Output (self, other, "DIA_Harad_OrcRunning_12_02"); //Ah, ich verstehe schon. Du hast Wichtigeres zu tun. Schon in Ordnung, die Sache hat sich erledigt.
};

func void DIA_Harad_OrcRunning_TooHard()
{
	AI_Output (other, self, "DIA_Harad_OrcRunning_TooHard_15_00"); //Ork to diabelnie twardy przeciwnik...
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_01"); //Hmmm... kiedy na ciebie patrzê, to myœlê, ¿e mo¿esz mieæ racjê. Na twoich koœciach nie ma za wiele miêsa. Ale potrafiê to zmieniæ.
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_02"); //Niemniej jednak musisz mi dowieœæ, ¿e nie brak ci odwagi do walki.
	AI_Output (other, self, "DIA_Harad_OrcRunning_TooHard_15_03"); //Nie mo¿e to byæ coœ troszkê mniejszego?
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_04"); //Hmmm... Hakon, handlarz broni¹ z targowiska, powiedzia³ mi, ¿e kilka dni temu napadli go bandyci.
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_05"); //Te bydlaki w³ócz¹ siê podobno gdzieœ za wschodni¹ bram¹.
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_06"); //Te tchórzliwe ³otry raczej nie grzesz¹ rozumem.
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_07"); //Dorwij ich! Wszystkich. Wtedy bêdê wiedzia³, ¿e przydasz nam siê w mieœcie.
	
	Harad_HakonMission = TRUE;
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	
	if (MIS_HakonBandits != LOG_RUNNING)
	{
		B_LogEntry (TOPIC_Lehrling, "Harad powiedzia³ mi, ¿e bandyci napadli poza murami miasta na kupca Hakona. Mo¿e od niego dowiem siê, gdzie mogê ich znaleŸæ.");
	}
	else
	{
		B_LogEntry (TOPIC_Lehrling, "Harad powiedzia³ mi, ¿e bandyci napadli poza murami miasta na kupca Hakona. Jeœli zrobiê z nimi porz¹dek, udowodniê swoj¹ wartoœæ.");
	};
	
	Info_ClearChoices (DIA_Harad_OrcRunning);
};

func void DIA_Harad_OrcRunning_Done()
{
	AI_Output (other, self, "DIA_Harad_OrcRunning_Done_15_00"); //Twój ork jest ju¿ martwy!
	AI_Output (self, other, "DIA_Harad_OrcRunning_Done_12_01"); //Dobrze! Wiêc nie gadaj wiêcej i pozwól, ¿eby twoje czyny mówi³y za siebie.
	
	Info_ClearChoices (DIA_Harad_OrcRunning);
};

// *****************************************************
// 						Orc Success
// *****************************************************
instance DIA_Harad_OrcSuccess (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 1;
	condition	= DIA_Harad_OrcSuccess_Condition;
	information	= DIA_Harad_OrcSuccess_Info;
	permanent   = FALSE;
	description = "Mam orkow¹ broñ, o któr¹ prosi³eœ.";
};
func int DIA_Harad_OrcSuccess_Condition ()
{
	if (MIS_Harad_Orc == LOG_RUNNING)
	{
		if (Npc_HasItems(other, ItMw_2H_OrcAxe_01) > 0)
		|| (Npc_HasItems(other, ItMw_2H_OrcAxe_02) > 0)
		|| (Npc_HasItems(other, ItMw_2H_OrcAxe_03) > 0)
		|| (Npc_HasItems(other, ItMw_2H_OrcAxe_04) > 0)
		|| (Npc_HasItems(other, ItMw_2H_OrcSword_01) > 0)
		{
			return TRUE;
		};
	};
};
func void DIA_Harad_OrcSuccess_Info ()
{
	AI_Output (other, self, "DIA_Harad_OrcSuccess_15_00"); //Mam orkow¹ broñ, o któr¹ prosi³eœ.
	AI_Output (self, other, "DIA_Harad_OrcSuccess_12_01"); //Poka¿...
	
		if (Npc_HasItems(other, ItMw_2H_OrcAxe_01) > 0)
		{
			B_GiveInvItems (other, self, ItMw_2H_OrcAxe_01, 1);
		}
		else if (Npc_HasItems(other, ItMw_2H_OrcAxe_02) > 0)
		{
			B_GiveInvItems (other, self, ItMw_2H_OrcAxe_02, 1);
		}
		else if (Npc_HasItems(other, ItMw_2H_OrcAxe_03) > 0)
		{
			B_GiveInvItems (other, self, ItMw_2H_OrcAxe_03, 1);
		}
		else if (Npc_HasItems(other, ItMw_2H_OrcAxe_04) > 0)
		{
			B_GiveInvItems (other, self, ItMw_2H_OrcAxe_04, 1);
		}
		else //if (Npc_HasItems(other, ItMw_2H_OrcSword_01) > 0)
		{
			B_GiveInvItems (other, self, ItMw_2H_OrcSword_01, 1);
		};
	
	if (Harad_HakonMission == TRUE)
	{
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_02"); //JEDNAK TO ZROBI£EŒ? Znakomicie!
	};
	
	AI_Output (self, other, "DIA_Harad_OrcSuccess_12_03"); //Dawno ju¿ nie mia³em w rêkach takiej broni - podczas wojny z orkami by³em ¿o³nierzem.
	AI_Output (self, other, "DIA_Harad_OrcSuccess_12_04"); //To by³y ciê¿kie czasy, mówiê ci.
	
	if (Player_IsApprentice == APP_Harad)
	{
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_05"); //Wiedzia³em, co robiê, kiedy przyjmowa³em ciê na czeladnika. Dobra robota!
	}
	else if (Player_IsApprentice == APP_NONE) 
	{
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_06"); //Myœla³em, ¿e nie zdo³asz tego dokonaæ. Jestem pod wra¿eniem.
	}
	else //anderer Weg
	{
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_07"); //Szkoda, ¿e wybra³eœ inn¹ drogê.
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_08"); //Przyda³byœ mi siê.
	};
	
	MIS_Harad_Orc = LOG_SUCCESS;
	B_GivePlayerXP (XP_Harad_Orc);
	B_LogEntry (Topic_Lehrling,"Harad przyjmie mnie na swojego czeladnika, jeœli zdobêdê poparcie pozosta³ych mistrzów.");
};

// *****************************************************
// 						LEHRLING	(PERM)
// *****************************************************
var int Harad_StartGuild;
// ----------------------

instance DIA_Harad_LEHRLING (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 1;
	condition	= DIA_Harad_LEHRLING_Condition;
	information	= DIA_Harad_LEHRLING_Info;
	permanent   = TRUE;
	description = "Kiedy mogê zacz¹æ pracê jako twój czeladnik?";
};
func int DIA_Harad_LEHRLING_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Harad_Arbeit))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Harad_LEHRLING_Info ()
{
	var int stimmen;
	stimmen = 0;
	
	AI_Output (other, self, "DIA_Harad_LEHRLING_15_00"); //Kiedy mogê zacz¹æ pracê jako twój czeladnik?
	
	if (MIS_Harad_Orc == LOG_SUCCESS)
	|| ( (MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE) )
	{
		// ------ Harad ------
		if (MIS_Harad_Orc == LOG_SUCCESS)
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_01"); //Przyda³by siê nam ktoœ, kto potrafi st³uc orka.
			
			if (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_02"); //Poza tym Hakon powiedzia³ mi, jak za³atwi³eœ sprawê z bandytami. Dobra robota!
			};
		}
		else //HakonBandits SUCCESS
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_03"); //Nie zabi³eœ orka, ale Hakon powiedzia³ mi, jak za³atwi³eœ sprawê z bandytami. Dobra robota.
		};
		
		AI_Output (self, other,"DIA_Harad_LEHRLING_12_04"); //Jeœli chodzi o mnie, mo¿esz zacz¹æ od zaraz.
				
		stimmen = stimmen + 1;
		
		AI_Output (self, other,"DIA_Harad_LEHRLING_12_05"); //Ale jeœli chodzi o pozosta³ych mistrzów...
		
		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_06"); //Thorben da³ ci swoje b³ogos³awieñstwo.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_07"); //Stary dobry Thorben chce tylko, byœ otrzyma³ b³ogos³awieñstwo bogów. Uwa¿am, ¿e to dobry pomys³.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_08"); //Thorben powiedzia³, ¿e z nim nie rozmawia³eœ.
		};
		
		// ------ Bosper ------
		if (Bosper.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_09"); //Bosper chcia³ mnie od tego odwieœæ. Sam chce, ¿ebyœ zosta³ jego czeladnikiem.
			if (MIS_Bosper_Bogen == LOG_SUCCESS)
			|| (MIS_Bosper_WolfFurs == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_10"); //Odby³em z nim krótk¹, ale powa¿n¹ rozmowê na ten temat.
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_11"); //W koñcu siê zgodzi³.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_12"); //Prosi³ mnie, ¿ebym da³ mu chocia¿ okazjê zainteresowania ciê jego zawodem.
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_13"); //Dowiedz siê co i jak - zawsze mo¿esz podj¹æ decyzjê póŸniej. No chyba ¿e nie zale¿y ci na jego g³osie.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_14"); //A Bosper jeszcze ciê nie zna.
		};
		
		// ------ Constantino ------
		if (Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_15"); //Constantino, jak zwykle, o nic nie dba. Powiedzia³, ¿e jeœli chodzi o niego, mo¿esz siê uczyæ, czego tylko chcesz.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_16"); //Constantino powiedzia³, ¿e jesteœ oskar¿ony w mieœcie o przestêpstwo. Czy to prawda?
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_17"); //Jeœli tak, to powinieneœ to jak najszybciej wyjaœniæ!
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_18"); //Constantino nigdy o tobie nie s³ysza³.
		};
		
		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_19"); //A Matteo powiedzia³, ¿e odda³eœ mu jego z³oto. Widzi mi siê, ¿e jesteœ honorowym m³odzieñcem.
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_20"); //Matteo mówi, ¿e ci¹gle jesteœ mu coœ winien. Nie wiem, co jest miêdzy wami, ale powinieneœ to wyjaœniæ.
			}
			else	
			{	
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_21"); //A Matteo twierdzi, ¿e nie rozmawia³ z tob¹ na ten temat.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_22"); //A Matteo powiedzia³, ¿e nigdy ciê nie widzia³ w swoim sklepie.
		};		

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_23"); //To oznacza, ¿e zaskarbi³eœ sobie przychylnoœæ wszystkich mistrzów!
			}
			else // == 4
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_24"); //To oznacza, ¿e zaskarbi³eœ sobie przychylnoœæ czterech mistrzów. Wystarczy, ¿ebyœ zosta³ przyjêty na czeladnika.
			};
			
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_25"); //Jesteœ gotów, by zacz¹æ u mnie terminowaæ?
			
			Info_ClearChoices (DIA_Harad_LEHRLING);
			Info_AddChoice (DIA_Harad_LEHRLING, "Dobrze. Pomyœlê o tym.", DIA_Harad_LEHRLING_Later);
			Info_AddChoice (DIA_Harad_LEHRLING, "Wchodzê w to!", DIA_Harad_LEHRLING_OK);
		}
		else // stimmen < 4
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_26"); //Aby zostaæ czeladnikiem w dolnej czêœci miasta, musisz mieæ zgodê co najmniej czterech mistrzów.
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_27"); //Powinieneœ porozmawiaæ z wszystkimi, którzy wci¹¿ jeszcze nie podjêli decyzji w twojej sprawie.
		};
	}
	else //Mission nicht erfüllt
	{
		AI_Output (self, other,"DIA_Harad_LEHRLING_12_28"); //Najpierw musisz udowodniæ, ¿e coœ potrafisz.
	};
};

func void DIA_Harad_LEHRLING_OK()
{
	AI_Output (other, self, "DIA_Harad_LEHRLING_OK_15_00"); //Wchodzê w to!
	AI_Output (self, other, "DIA_Harad_LEHRLING_OK_12_01"); //Dobrze! Nauczê ciê, jak wykuæ porz¹dny miecz.
	
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		AI_Output (other, self, "DIA_Harad_LEHRLING_OK_15_02"); //Ju¿ to potrafiê!
		AI_Output (self, other, "DIA_Harad_LEHRLING_OK_12_03"); //Có¿, tym lepiej!
	};
	
	if (other.attribute[ATR_STRENGTH] < (T_MED-30))
	{
		AI_Output (self, other, "DIA_Harad_LEHRLING_OK_12_04"); //Poza tym czas, ¿ebyœ nabra³ si³. Marniejesz mi w oczach!
	};
	Player_IsApprentice = APP_Harad;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Harad_StartGuild = other.guild;
	
	Harad_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild ("schmied", GIL_NONE);
	MIS_Apprentice = LOG_SUCCESS;
	B_LogEntry (Topic_Bonus,"Harad przyj¹³ mnie na swojego czeladnika. Droga do górnego miasta stoi przede mn¹ otworem.");
	B_LogEntry (Topic_Bonus,"Harad dobrze mi zap³aci za wykut¹ przeze mnie broñ.");
	
	Log_CreateTopic (Topic_CityTeacher, LOG_NOTE);
	B_GivePlayerXP (XP_Lehrling);
	B_LogEntry (Topic_CityTeacher, "Harad mo¿e mnie nauczyæ rzemios³a kowalskiego. Mo¿e równie¿ zwiêkszyæ moj¹ si³ê.");
	Info_ClearChoices (DIA_Harad_LEHRLING);
};

func void DIA_Harad_LEHRLING_Later()
{
	AI_Output (other, self, "DIA_Harad_LEHRLING_Later_15_00"); //Dobrze - zastanowiê siê nad tym.
	if (!Npc_IsDead (Brian))
	{
		AI_Output (self, other, "DIA_Harad_LEHRLING_Later_12_01"); //Nie œpiesz siê. Brian bêdzie tu jeszcze przez jakiœ czas.
	};
	Info_ClearChoices (DIA_Harad_LEHRLING);
};

// *****************************************************
// 						Zustimmung
// *****************************************************
instance DIA_Harad_Zustimmung		(C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  2;
	condition	 = 	DIA_Harad_Zustimmung_Condition;
	information	 = 	DIA_Harad_Zustimmung_Info;
	permanent    =  TRUE;
	description	 = 	"Mogê zostaæ czeladnikiem u innego mistrza?";
};

func int DIA_Harad_Zustimmung_Condition ()
{	
	if (Player_IsApprentice == APP_NONE)
	&& (Npc_KnowsInfo (other, DIA_Harad_Arbeit))
	{
		return TRUE;
	};
};

//------------------------------------
var int DIA_Harad_Zustimmung_Permanent;
//------------------------------------

func void DIA_Harad_Zustimmung_Info ()
{
	AI_Output (other, self, "DIA_Harad_Zustimmung_15_00"); //Mogê zostaæ czeladnikiem u innego mistrza?
	
	if (MIS_Harad_Orc == LOG_SUCCESS)
	|| ( (MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE) )
	{
		AI_Output (self, other, "DIA_Harad_Zustimmung_12_01"); //Jesteœ dobrym cz³owiekiem.
		if (MIS_HakonBandits == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Harad_Zustimmung_12_02"); //Hakon powiedzia³ mi, jak poradzi³eœ sobie z bandytami.
		};
		AI_Output (self, other, "DIA_Harad_Zustimmung_12_03"); //Masz moj¹ zgodê.
		
		if (DIA_Harad_Zustimmung_Permanent == FALSE)
		{
			B_GivePlayerXP (XP_Zustimmung);
			DIA_Harad_Zustimmung_Permanent = TRUE;
		};
		B_LogEntry (Topic_Lehrling,"Jeœli zechcê zostaæ czeladnikiem, Harad udzieli mi swojego poparcia.");
		
		if (!Npc_IsDead(Brian))
		{
			AI_Output (self, other, "DIA_Harad_Zustimmung_12_04"); //Brian jeszcze przez jakiœ czas tu bêdzie. A potem jego miejsce zajmie jakiœ silny ch³opak.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Harad_Zustimmung_12_05"); //Inni mistrzowie mog¹ nie mieæ nic przeciwko. Ja wyra¿ê jednak zgodê, dopiero kiedy dowiedziesz, ¿e coœ umiesz!
	};
};

// *******************************************************
//				 IMPORTANT als Lehrling 
// *******************************************************
// ----------------------------------
	var int Harad_MILKommentar;
	var int Harad_PALKommentar;
	var int Harad_INNOSKommentar;
// ----------------------------------

instance DIA_Harad_AlsLehrling (C_INFO)
{
	npc         = VLK_412_Harad;
	nr          = 1;
	condition   = DIA_Harad_AlsLehrling_Condition;
	information = DIA_Harad_AlsLehrling_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Harad_AlsLehrling_Condition()
{	
	if (Player_IsApprentice == APP_Harad)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Harad_AlsLehrling_Info()
{
	if (other.guild == GIL_MIL)
	&& (Harad_StartGuild != GIL_MIL)
	&& (Harad_MILKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_00"); //Jesteœ teraz w stra¿y? Jestem z ciebie dumny!
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_01"); //Tak d³ugo jak s³u¿ysz w wojsku, nie bêdê od ciebie wymaga³ wykonywania obowi¹zków czeladniczych.
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_02"); //Jeœli jednak bêdziesz czegoœ potrzebowaæ, zawsze mo¿esz do mnie przyjœæ.
		Harad_MILKommentar = TRUE;
	}
	
	else if (other.guild == GIL_PAL)
	&& (Harad_StartGuild != GIL_PAL)
	&& (Harad_PALKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_03"); //Uda³o ci siê wst¹piæ w szeregi paladynów!
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_04"); //Cieszê siê, ¿e przyj¹³em ciê na czeladnika. Nawet pomimo tego, ¿e nie spêdzi³eœ za kowad³em zbyt du¿o czasu.
		
		Harad_PALKommentar = TRUE;
	}
	
	else if ( (other.guild == GIL_NOV) || (other.guild == GIL_KDF) )
	&& (Harad_StartGuild != GIL_NOV)
	&& (Harad_StartGuild != GIL_KDF)
	&& (Harad_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_05"); //Wst¹pi³eœ do klasztoru. Wola³bym, ¿ebyœ zosta³ w mieœcie. Potrzebujemy ka¿dego dobrego cz³owieka.
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_06"); //Widocznie jednak przeznaczone ci by³o pod¹¿aæ za g³osem Innosa.
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_07"); //Jeœli bêdziesz czegoœ ode mnie potrzebowaæ, to wiesz, gdzie mnie znaleŸæ.
		Harad_INNOSKommentar = TRUE;
	}
	
	else if (Harad_Lehrling_Day <= (Wld_GetDay() - 4) )
	&& (Harad_MILKommentar == FALSE)
	&& (Harad_PALKommentar == FALSE)
	&& (Harad_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_08"); //Dawno ciê tutaj nie by³o. Gdzie siê pêtasz, hê?
		Harad_Lehrling_Day = Wld_GetDay();
	}
	
	else
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_09"); //To znowu ty...
		Harad_Lehrling_Day = Wld_GetDay();
	};
};

// *****************************************************
// 					Verkaufst du Waffen?
// *****************************************************
instance DIA_Harad_Waffen (C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  3;
	condition	 = 	DIA_Harad_Waffen_Condition;
	information	 = 	DIA_Harad_Waffen_Info;
	permanent    =  FALSE;
	description	 = 	"Sprzedajesz te¿ broñ?";
};
func int DIA_Harad_Waffen_Condition ()
{	
	if (Kapitel == 1)
	{
		return TRUE;
	};
};
func void DIA_Harad_Waffen_Info ()
{
	AI_Output (other, self, "DIA_Harad_Waffen_15_00"); //Sprzedajesz te¿ broñ?
	AI_Output (self, other, "DIA_Harad_Waffen_12_01"); //Zapomnij o tym. Wszystko, co robiê, trafia do paladynów albo do stra¿y.
	AI_Output (self ,other, "DIA_Harad_Add_12_00"); //Mam zamówienie na 100 mieczy od Lorda Hagena. Chce wyposa¿yæ w nie stra¿ miejsk¹.
};

// *****************************************************
// 					Aufgaben als Lehrling
// *****************************************************
instance DIA_Harad_Aufgaben	(C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  1;
	condition	 = 	DIA_Harad_Aufgaben_Condition;
	information	 = 	DIA_Harad_Aufgaben_Info;
	permanent    =  FALSE;
	description	 = 	"Co mam robiæ jako czeladnik?";
};

func int DIA_Harad_Aufgaben_Condition ()
{	
	if (Player_IsApprentice == APP_HARAD)
	{
		return TRUE;
	};
};
func void DIA_Harad_Aufgaben_Info ()
{
	AI_Output (other, self, "DIA_Harad_Aufgaben_15_00"); //Jakie s¹ moje obowi¹zki jako czeladnika?
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_01"); //Mo¿esz zgadywaæ trzy razy.
	AI_Output (other, self, "DIA_Harad_Aufgaben_15_02"); //Kuæ, kuæ i jeszcze raz kuæ?
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_03"); //Nie jesteœ tak g³upi, na jakiego wygl¹dasz. P³acê od ostrza. Nie pracujesz, nie dostajesz pieniêdzy. Proste.
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_05"); //Nauczê ciê te¿ wszystkiego, co musisz wiedzieæ, ¿eby zrobiæ zwyk³y miecz.
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_06"); //Wykuwanie magicznych mieczy to zadanie dla doœwiadczonych kowali - a do tego wiele ci jeszcze brakuje...
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_07"); //Jeœli potrzebujesz miejsca do spania, mo¿esz siê zadekowaæ w moim domu. Jak do tej pory wszystko jasne?
};

// ************************************************************
// 						Klingen verkaufen
// ************************************************************
instance DIA_Harad_SellBlades (C_INFO)
{
	npc			 = VLK_412_Harad;
	nr			 = 200;
	condition	 = DIA_Harad_SellBlades_Condition;
	information	 = DIA_Harad_SellBlades_Info;
	permanent    = TRUE;
	description	 = "Chcê sprzedaæ broñ, któr¹ wyku³em.";
};
func int DIA_Harad_SellBlades_Condition ()
{	
	if (Player_IsApprentice == APP_Harad)
	{
		return TRUE;
	};
};
func void DIA_Harad_SellBlades_Info ()
{
	AI_Output (other, self, "DIA_Harad_SellBlades_15_00"); //Chcê sprzedaæ broñ, któr¹ wyku³em.
	
	var C_ITEM equipWeap; equipWeap = Npc_GetEquippedMeleeWeapon(other);
	
	var int anzahl_common; anzahl_common = Npc_HasItems (other, ItMw_1H_Common_01);
	if (Hlp_IsItem(equipWeap, ItMw_1H_Common_01) == TRUE) { anzahl_common = anzahl_common - 1; };
	var int anzahl_schwert1; anzahl_schwert1 = Npc_HasItems (other, ItMw_Schwert1);
	if (Hlp_IsItem(equipWeap, ItMw_Schwert1) == TRUE) { anzahl_schwert1 = anzahl_schwert1 - 1; };
	var int anzahl_schwert4; anzahl_schwert4 = Npc_HasItems (other, ItMw_Schwert4);
	if (Hlp_IsItem(equipWeap, ItMw_Schwert4) == TRUE) { anzahl_schwert4 = anzahl_schwert4 - 1; };
	var int anzahl_rubinklinge; anzahl_rubinklinge = Npc_HasItems (other, ItMw_Rubinklinge);
	if (Hlp_IsItem(equipWeap, ItMw_Rubinklinge) == TRUE) { anzahl_rubinklinge = anzahl_rubinklinge - 1; };
	var int anzahl_elbastardo; anzahl_elbastardo = Npc_HasItems (other, ItMw_ElBastardo);
	if (Hlp_IsItem(equipWeap, ItMw_ElBastardo) == TRUE) { anzahl_elbastardo = anzahl_elbastardo - 1; };
	
	var int gesamt; gesamt = (anzahl_common + anzahl_schwert1 + anzahl_schwert4 + anzahl_rubinklinge + anzahl_elbastardo);
	
    if (gesamt == 0)
	{
		if (Hlp_IsItem(equipWeap, ItMw_1H_Common_01) == TRUE)
		|| (Hlp_IsItem(equipWeap, ItMw_Schwert1) == TRUE) 
		|| (Hlp_IsItem(equipWeap, ItMw_Schwert4) == TRUE)
		|| (Hlp_IsItem(equipWeap, ItMw_Rubinklinge) == TRUE)
		|| (Hlp_IsItem(equipWeap, ItMw_ElBastardo) == TRUE)  
		{
			AI_Output (self, other, "DIA_Harad_SellBlades_12_01"); //Masz tylko tê przy pasie. Lepiej j¹ zatrzymaj.
		}
		else
		{
			AI_Output (self, other, "DIA_Harad_SellBlades_12_04"); //Wiêc zrób coœ! Przyjmujê tylko zwyk³e miecze.
		};
	}
	else //(gesamt >= 1) - die verbeliebenden Klingen verkaufen ------
	{
		AI_Output (self, other, "DIA_Harad_SellBlades_12_02"); //Dobrze - daj to tutaj.
		
		Npc_RemoveInvItems (other, ItMw_1H_Common_01, anzahl_common);
		Npc_RemoveInvItems (other, ItMw_Schwert1, anzahl_Schwert1);
		Npc_RemoveInvItems (other, ItMw_Schwert4, anzahl_Schwert4);
		Npc_RemoveInvItems (other, ItMw_Rubinklinge, anzahl_Rubinklinge);
		Npc_RemoveInvItems (other, ItMw_ElBastardo, anzahl_ElBastardo);
		
				var string concatText;
				concatText = ConcatStrings(IntToString(gesamt), PRINT_ItemsGegeben);		// "x Gegenstände gegeben"
				AI_PrintScreen (concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
				
		AI_Output (self, other, "DIA_Harad_SellBlades_12_03"); //Dobrze. Oto twoja zap³ata.
		var int lohn;
		lohn 	= (anzahl_common * Value_Common1)
				+ (anzahl_schwert1 * Value_Schwert1)
				+ (anzahl_schwert4 * Value_Schwert4)
				+ (anzahl_rubinklinge * Value_Rubinklinge)
				+ (anzahl_elbastardo * Value_ElBastardo);
				
		lohn 	= (lohn / 3);
		
		B_GiveInvItems (self, other, itmi_gold, lohn);
	};
};
	
// ************************************************************
// 						Weapon_Common Lehrer
// ************************************************************
func void B_Harad_TeachSmith()
{
	AI_Output (self, other, "DIA_Harad_TeachCommon_12_01"); //To doœæ proste, ch³opcze. WeŸ kawa³ek surowej stali i trzymaj j¹ w ogniu, a¿ rozgrzeje siê do bia³oœci.
	AI_Output (self, other, "DIA_Harad_TeachCommon_12_02"); //Wtedy nadaj broni kszta³t na kowadle.
};
// ------------------------------------------------------------
func void B_HaradSmithChoices()
{
	Info_ClearChoices (DIA_Harad_TeachSmith);
	Info_AddChoice	(DIA_Harad_TeachSmith, DIALOG_BACK, DIA_Harad_TeachSmith_BACK);
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == TRUE)
	{
		Info_AddChoice		(DIA_Harad_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_04, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_04))		,DIA_Harad_TeachSmith_Harad04);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == TRUE)
	{
		Info_AddChoice		(DIA_Harad_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_03, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_03))		,DIA_Harad_TeachSmith_Harad03);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == TRUE)
	{
		Info_AddChoice		(DIA_Harad_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_02))		,DIA_Harad_TeachSmith_Harad02);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		Info_AddChoice		(DIA_Harad_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_01))		,DIA_Harad_TeachSmith_Harad01);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice	(DIA_Harad_TeachSmith, B_BuildLearnString("Nauka kowalstwa"	   , B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common))			,DIA_Harad_TeachSmith_Common);
	};
};
// ------------------------------------------------------------
instance DIA_Harad_TeachSmith (C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  50;
	condition	 = 	DIA_Harad_TeachSmith_Condition;
	information	 = 	DIA_Harad_TeachSmith_Info;
	permanent    =  TRUE;
	description	 = 	"Naucz mnie, jak wykuæ porz¹dny miecz!";
};

func int DIA_Harad_TeachSmith_Condition ()
{	
	if (Player_IsApprentice == APP_Harad)
	{
		if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == FALSE)
		{
			return TRUE;
		};
	};
};
func void DIA_Harad_TeachSmith_Info ()
{
	AI_Output (other, self, "DIA_Harad_TeachCommon_15_00"); //Naucz mnie, jak wykuæ porz¹dny miecz!
	
	B_HaradSmithChoices();
};
func void DIA_Harad_TeachSmith_BACK()
{
	Info_ClearChoices (DIA_Harad_TeachSmith);
};
func void DIA_Harad_TeachSmith_Common()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_Common)
	{
		B_Harad_TeachSmith();
		AI_Output (self, other, "DIA_Harad_TeachCommon_12_03"); //Twoje pierwsze miecze nie bêd¹ doskona³e, ale powoli wszystkiego siê nauczysz.
	};
	
	B_HaradSmithChoices();
};
func void DIA_Harad_TeachSmith_Harad01()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Harad_01)
	{
		B_Harad_TeachSmith();
	};
	
	B_HaradSmithChoices();
};
func void DIA_Harad_TeachSmith_Harad02()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Harad_02)
	{
		B_Harad_TeachSmith();
	};
	
	B_HaradSmithChoices();
};
func void DIA_Harad_TeachSmith_Harad03()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Harad_03)
	{
		B_Harad_TeachSmith();
	};
	
	B_HaradSmithChoices();
};
func void DIA_Harad_TeachSmith_Harad04()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Harad_04)
	{
		B_Harad_TeachSmith();
	};
	
	B_HaradSmithChoices();
};

// ************************************************************
// 							STR Lehrer bis 50
// ************************************************************
// -------------------------
	var int Harad_Merke_STR;
// -------------------------	

INSTANCE DIA_Harad_TeachSTR (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 100;
	condition	= DIA_Harad_TeachSTR_Condition;
	information	= DIA_Harad_TeachSTR_Info;
	permanent	= 1;
	description = "Chcê byæ silniejszy!";
};                       

FUNC INT DIA_Harad_TeachSTR_Condition()
{
	if (Player_IsApprentice == APP_HARAD)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Harad_TeachSTR_Info()
{	
	AI_Output (other, self, "DIA_Harad_TeachSTR_15_00"); //Chcê byæ silniejszy!
	
	Harad_Merke_STR = other.attribute[ATR_STRENGTH];
	
	Info_ClearChoices	(DIA_Harad_TeachSTR);
	Info_AddChoice		(DIA_Harad_TeachSTR, DIALOG_BACK, DIA_Harad_TeachSTR_BACK);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Harad_TeachSTR_1);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Harad_TeachSTR_5);
};

func void DIA_Harad_TeachSTR_BACK()
{
	if (Harad_Merke_STR < other.attribute[ATR_STRENGTH])
	{
		AI_Output (self, other, "DIA_Harad_TeachSTR_BACK_12_01"); //Ju¿ nabra³eœ muskulatury.
	};

	if (other.attribute[ATR_STRENGTH] < T_MED)
	{
		AI_Output (self, other, "DIA_Harad_TeachSTR_BACK_12_02"); //PrzyjdŸ, gdy bêdziesz chcia³ siê nauczyæ czegoœ wiêcej.
	};
	
	Info_ClearChoices	(DIA_Harad_TeachSTR);
};

func void DIA_Harad_TeachSTR_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MED);

	Info_ClearChoices	(DIA_Harad_TeachSTR);
	Info_AddChoice		(DIA_Harad_TeachSTR, DIALOG_BACK, DIA_Harad_TeachSTR_BACK);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Harad_TeachSTR_1);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Harad_TeachSTR_5);
};

// ------ 5 Stärke ------
func void DIA_Harad_TeachSTR_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MED);
	
	Info_ClearChoices	(DIA_Harad_TeachSTR);
	Info_AddChoice		(DIA_Harad_TeachSTR, DIALOG_BACK, DIA_Harad_TeachSTR_BACK);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Harad_TeachSTR_1);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Harad_TeachSTR_5);
};




//############################
//##						##
//##		Kapitel 2		##
//##						##
//############################

// *****************************************************
// 					Immer noch
// *****************************************************
instance DIA_Harad_ImmerNoch (C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  3;
	condition	 = 	DIA_Harad_ImmerNoch_Condition;
	information	 = 	DIA_Harad_ImmerNoch_Info;
	permanent    =  FALSE;
	description	 = 	"Pracujesz jeszcze dla paladynów?";
};
func int DIA_Harad_ImmerNoch_Condition ()
{	
	if (Kapitel >= 2)
	{
		return TRUE;
	};	
};

func void DIA_Harad_ImmerNoch_Info ()
{
	AI_Output (other, self,"DIA_Harad_Add_15_01"); //Pracujesz jeszcze dla paladynów?
	AI_Output (self ,other,"DIA_Harad_Add_12_02"); //Wykona³em zlecenie dla Lorda Hagena.
	AI_Output (self ,other,"DIA_Harad_Add_12_03"); //Teraz robiê dla niego miecze z magicznej rudy - tym razem nie za darmo.
	AI_Output (self ,other,"DIA_Harad_Add_12_04"); //Mam te¿ czas, ¿eby zrobiæ na boku parê sztuk broni dla kupców na targowisko.
	AI_Output (self ,other,"DIA_Harad_Add_12_05"); //Jeœli szukasz dobrego ostrza, powinieneœ z nimi porozmawiaæ.
};

// *****************************************************
// 					About Erzklingen
// *****************************************************
instance DIA_Harad_AboutErzklingen (C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  3;
	condition	 = 	DIA_Harad_AboutErzklingen_Condition;
	information	 = 	DIA_Harad_AboutErzklingen_Info;
	permanent    =  FALSE;
	description	 = 	"Powiedz mi coœ wiêcej o mieczach z magicznej rudy!";
};
func int DIA_Harad_AboutErzklingen_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Harad_ImmerNoch))
	{
		return TRUE;
	};	
};

func void DIA_Harad_AboutErzklingen_Info ()
{
	AI_Output (other, self,"DIA_Harad_Add_15_06"); //Powiedz mi coœ wiêcej o mieczach z magicznej rudy!
	AI_Output (self, other, "DIA_Harad_Waffen_12_02"); //Tworzenie magicznego ostrza to bardzo z³o¿ony i kosztowny proces. £atwo jednak w³adaæ takim mieczem, a poza tym jest on praktycznie niezniszczalny.
	AI_Output (self, other, "DIA_Harad_Waffen_12_03"); //To dobre ostrze, ale swoj¹ prawdziw¹ moc ujawnia dopiero w rêkach paladyna.
	AI_Output (self, other, "DIA_Harad_Waffen_12_04"); //Miecz paladyna zostaje poœwiêcony przez Innosa. Dziêki temu magiczne ostrze staje siê zaklêt¹ broni¹, która zadaje straszliwe rany!
};

// *****************************************************
// 					Ich möchte eine Erzklinge kaufen
// *****************************************************
instance DIA_Harad_Erzklingen (C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  3;
	condition	 = 	DIA_Harad_Erzklingen_Condition;
	information	 = 	DIA_Harad_Erzklingen_Info;
	permanent    =  TRUE;
	description	 = 	"Chcê kupiæ miecz z magicznej rudy.";
};
func int DIA_Harad_Erzklingen_Condition ()
{	
	if (OreBladeBought == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Harad_AboutErzklingen))
	{
		return TRUE;
	};	
};

//---------------------------------------------

var int OreBladeBought;

//---------------------------------------------

func void DIA_Harad_Erzklingen_Info ()
{
	AI_Output (other, self, "DIA_Harad_Erzklingen_15_00"); //Chcê kupiæ miecz z magicznej rudy.
	if (hero.guild != GIL_PAL)
	{
		AI_Output (self, other, "DIA_Harad_Erzklingen_12_01"); //Magiczne miecze mogê sprzedawaæ tylko paladynom. I tylko po jednym na g³owê.
	}
	else
	{
		AI_Output (self, other, "DIA_Harad_Erzklingen_12_02"); //Powinniœcie siê cieszyæ, ¿e mo¿ecie dzier¿yæ tak doskona³e miecze.
		AI_Output (self, other, "DIA_Harad_Erzklingen_12_03"); //Na mocy dekretu Lorda Hagena mogê ci sprzedaæ tylko jedn¹ magiczn¹ broñ.
		AI_Output (self, other, "DIA_Harad_Erzklingen_12_04"); //Co mogê ci zaproponowaæ?
		
		Info_ClearChoices (DIA_Harad_Erzklingen);
		Info_AddChoice (DIA_Harad_Erzklingen,DIALOG_BACK,DIA_Harad_Erzklingen_Back);
		Info_AddChoice (DIA_Harad_Erzklingen,"Miecz dwurêczny (2000 sztuk z³ota)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice (DIA_Harad_Erzklingen,"Miecz jednorêczny (2000 sztuk z³ota)",DIA_Harad_Erzklingen_1h);
	};
};

FUNC VOID DIA_Harad_Erzklingen_Back()
{
	Info_ClearChoices (DIA_Harad_Erzklingen);
};

FUNC void B_Harad_NotEnoughGold ()
{
	AI_Output (self ,other,"B_Harad_NotEnoughGold_12_00"); //Masz za ma³o z³ota.
};

FUNC VOID B_Harad_HaveFunWithYourSword ()
{
	AI_Output (self,other,"B_Harad_HaveGunWithYourSword_12_00"); //Dbaj o swoj¹ now¹ broñ. Jest warta maj¹tek.
	
	OreBladeBought = TRUE;
	
	Info_ClearChoices (DIA_Harad_Erzklingen);
};

FUNC VOID DIA_Harad_Erzklingen_2h()
{
	AI_Output (other,self ,"DIA_Harad_Erzklingen_2h_15_00"); //Wezmê miecz dwurêczny!
	
	if (Npc_HasItems (other,ItMi_Gold) >= Value_Blessed_2H_1)
	{
		B_GiveInvItems (other,self,ItMi_Gold,Value_Blessed_2H_1);
		CreateInvItems (self,ItMw_2H_Blessed_01,1);
		B_GiveInvItems (self ,other,ItMw_2H_Blessed_01,1);
	
		B_Harad_HaveFunWithYourSword ();
	}
	else
	{
		B_Harad_NotEnoughGold ();
		Info_ClearChoices (DIA_Harad_Erzklingen);
		Info_AddChoice (DIA_Harad_Erzklingen,DIALOG_BACK,DIA_Harad_Erzklingen_Back);
		Info_AddChoice (DIA_Harad_Erzklingen,"Miecz dwurêczny (2000 sztuk z³ota)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice (DIA_Harad_Erzklingen,"Miecz jednorêczny (2000 sztuk z³ota)",DIA_Harad_Erzklingen_1h);
	};
};

FUNC VOID DIA_Harad_Erzklingen_1h()
{
	AI_Output (other,self ,"DIA_Harad_Erzklingen_1h_15_00"); //Wezmê miecz jednorêczny!
	
	if (Npc_HasItems (other,ItMi_Gold) >= Value_Blessed_1H_1)
	{
		B_GiveInvItems (other,self,ItMi_Gold,Value_Blessed_1H_1);
		CreateInvItems (self,ItMw_1H_Blessed_01,1);
		B_GiveInvItems (self ,other,ItMw_1H_Blessed_01,1);
		
		B_Harad_HaveFunWithYourSword ();
	}
	else
	{
		B_Harad_NotEnoughGold ();
		Info_ClearChoices (DIA_Harad_Erzklingen);
		Info_AddChoice (DIA_Harad_Erzklingen,DIALOG_BACK,DIA_Harad_Erzklingen_Back);
		Info_AddChoice (DIA_Harad_Erzklingen,"Miecz dwurêczny (2000 sztuk z³ota)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice (DIA_Harad_Erzklingen,"Miecz jednorêczny (2000 sztuk z³ota)",DIA_Harad_Erzklingen_1h);
	};
};



//############################
//##						##
//##		Kapitel 3		##
//##						##
//############################

//*********************************************************************
//	Kannst du auch Schmuckstücke reparieren?
//*********************************************************************
instance DIA_Harad_RepairNecklace		(C_INFO)
{
	npc		 	 = 	VLK_412_Harad;
	nr           = 	8;
	condition	 = 	DIA_Harad_RepairNecklace_Condition;
	information	 = 	DIA_Harad_RepairNecklace_Info;
	permanent	 = 	FALSE;
	description	 = 	"Potrafisz naprawiæ bi¿uteriê?";
};

func int DIA_Harad_RepairNecklace_Condition ()
{
	if 	((MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)
	&&	 ((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) 
	||    (MIS_SCKnowsInnosEyeIsBroken  == TRUE))) 
  	{
  		return TRUE;
  	};
};

func void DIA_Harad_RepairNecklace_Info ()
{
	AI_Output (other,self ,"DIA_Harad_RepairNecklace_15_00"); //Potrafisz naprawiaæ bi¿uteriê?
	AI_Output (self	,other,"DIA_Harad_RepairNecklace_12_01"); //Nie jestem z³otnikiem. W mieœcie raczej nie znajdziesz nikogo, kto mo¿e ci pomóc.
	AI_Output (self ,other,"DIA_Harad_RepairNecklace_12_02"); //Ludzie nie maj¹ pieniêdzy, a ostatnimi czasy nikt siê nie wzbogaci³.
	AI_Output (self ,other,"DIA_Harad_RepairNecklace_12_03"); //Wiêkszoœæ z nich cieszy siê, ¿e maj¹ co jeœæ.
	
	MIS_SCKnowsInnosEyeIsBroken  = TRUE; 	
};

//*********************************************************************
//	Wo finde ich einen Goldschmied?
//*********************************************************************
instance DIA_Harad_Goldsmith		(C_INFO)
{
	npc		 	 = 	VLK_412_Harad;
	nr           = 	8;
	condition	 = 	DIA_Harad_Goldsmith_Condition;
	information	 = 	DIA_Harad_Goldsmith_Info;
	permanent	 = 	FALSE;
	description	 = 	"Gdzie znajdê z³otnika?";
};

func int DIA_Harad_Goldsmith_Condition ()
{
	if 	(Npc_KnowsInfo (other,DIA_Harad_RepairNecklace)) 
  	{
  		return TRUE;
  	};
};

func void DIA_Harad_Goldsmith_Info ()
{
	AI_Output (other,self ,"DIA_Harad_Goldsmith_15_00"); //Gdzie znajdê z³otnika?
	AI_Output (self ,other,"DIA_Harad_Goldsmith_12_01"); //Podobno wœród najemników na farmie Onara jest dobry kowal.
	AI_Output (self ,other,"DIA_Harad_Goldsmith_12_02"); //Mo¿e powinieneœ z nim porozmawiaæ.
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Harad_PICKPOCKET (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 900;
	condition	= DIA_Harad_PICKPOCKET_Condition;
	information	= DIA_Harad_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Harad_PICKPOCKET_Condition()
{
	C_Beklauen (14, 35);
};
 
FUNC VOID DIA_Harad_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Harad_PICKPOCKET);
	Info_AddChoice		(DIA_Harad_PICKPOCKET, DIALOG_BACK 		,DIA_Harad_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Harad_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Harad_PICKPOCKET_DoIt);
};

func void DIA_Harad_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Harad_PICKPOCKET);
};
	
func void DIA_Harad_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Harad_PICKPOCKET);
};



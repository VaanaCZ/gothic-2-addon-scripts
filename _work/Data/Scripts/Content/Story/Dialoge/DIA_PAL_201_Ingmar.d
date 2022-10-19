///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ingmar_EXIT   (C_INFO)
{
	npc         = Pal_201_Ingmar;
	nr          = 999;
	condition   = DIA_Ingmar_EXIT_Condition;
	information = DIA_Ingmar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Ingmar_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Ingmar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_Hallo		(C_INFO)
{
	npc		 	 = 	Pal_201_Ingmar;
	nr			 =  2;
	condition	 = 	DIA_Ingmar_Hallo_Condition;
	information	 = 	DIA_Ingmar_Hallo_Info;
	permanent    =  TRUE;
	important	 = 	TRUE;
};
//------------------------------------
var int DIA_Ingmar_Hallo_permanent;
//------------------------------------
func int DIA_Ingmar_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (DIA_Ingmar_Hallo_permanent == FALSE)
	&& (Kapitel < 4)
	{
		return TRUE;
	};
};
func void DIA_Ingmar_Hallo_Info ()
{
	if (EnterOW_Kapitel2 == FALSE)
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == TRUE)
	{ 
		AI_Output (self, other, "DIA_Ingmar_Hallo_06_00"); //Z otrzymanych przeze mnie raport�w wynika, �e G�rnicza Dolina to niebezpieczne miejsce.
		AI_Output (self, other, "DIA_Ingmar_Hallo_06_01"); //Pami�taj, aby zabra� ze sob� odpowiednie wyposa�enie.
	}
	else if (MIS_OLDWORLD == LOG_SUCCESS)
	&& 		(LordHagen.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Ingmar_Hallo_06_02"); //Sytuacja w G�rniczej Dolinie jest do�� niepokoj�ca. Potrzebny nam plan, dzi�ki kt�remu za�egnane zostanie niebezpiecze�stwo, a nasi ch�opcy wr�c� do domu wraz z wydobyt� rud�.
		DIA_Ingmar_Hallo_permanent = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Ingmar_Hallo_06_03"); //S�dzi�em, �e przyszed�e� porozmawia� z Lordem Hagenem. Na co czekasz?
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Krieg mit den Orks 
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_Krieg		(C_INFO)
{
	npc		 	 = 	Pal_201_Ingmar;
	nr			 =  99;
	condition	 = 	DIA_Ingmar_Krieg_Condition;
	information	 = 	DIA_Ingmar_Krieg_Info;
	permanent    =  FALSE;
	description	 =  "Jak sytuacja na kontynencie?";
};
func int DIA_Ingmar_Krieg_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Ingmar_Krieg_Info ()
{
	AI_Output (other, self, "DIA_Ingmar_Krieg_15_00"); //Jak sytuacja na kontynencie?
	AI_Output (self, other, "DIA_Ingmar_Krieg_06_01"); //Jeszcze nie wygrali�my wojny, chocia� kr�lewska armia zmusi�a ork�w do odwrotu.
	AI_Output (self, other, "DIA_Ingmar_Krieg_06_02"); //Wci�� jednak musimy stawia� czo�a niewielkim grupom naje�d�c�w.
	AI_Output (self, other, "DIA_Ingmar_Krieg_06_03"); //Te stworzenia nie znaj� honoru ani wiary - dlatego wierz� w nasze ostateczne zwyci�stwo.
};	

///////////////////////////////////////////////////////////////////////
//	Info CanTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_CanTeach		(C_INFO)
{ 
	npc		 	 = 	Pal_201_Ingmar;
	nr			 =  100;
	condition	 = 	DIA_Ingmar_CanTeach_Condition;
	information	 = 	DIA_Ingmar_CanTeach_Info;
	permanent    =  TRUE;
	description	 = 	"Mo�esz mnie przeszkoli�?";
};

func int DIA_Ingmar_CanTeach_Condition ()
{	
	if (Ingmar_TeachSTR == FALSE)
	{	
		return TRUE;
	};
};
func void DIA_Ingmar_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Ingmar_CanTeach_15_00"); //B�dziesz moim nauczycielem?
	
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Ingmar_CanTeach_06_01"); //Mog� nauczy� ci� specjalnych metod treningowych, dzi�ki kt�rym wzro�nie twoja bieg�o�� w pos�ugiwaniu si� r�nymi rodzajami or�a.
			Ingmar_TeachSTR = TRUE;
			B_LogEntry (TOPIC_CityTeacher,"Paladyn Igmar mo�e mi pokaza�, jak sta� si� silniejszym.");
	}
	else 
	{
		AI_Output (self, other, "DIA_Ingmar_CanTeach_06_02"); //Ucz� tylko cz�onk�w naszego Zakonu.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_Teach		(C_INFO)
{
	npc		  	 = 	Pal_201_Ingmar;
	nr			 = 	6;
	condition	 = 	DIA_Ingmar_Teach_Condition;
	information	 = 	DIA_Ingmar_Teach_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chc� by� silniejszy.";
};
func int DIA_Ingmar_Teach_Condition ()
{	
	if (Ingmar_TeachSTR == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Ingmar_Teach_Info ()
{
	AI_Output (other, self, "DIA_Ingmar_Teach_15_00"); //Chc� by� silniejszy.
	
	
	Info_ClearChoices   (DIA_Ingmar_Teach);
	Info_AddChoice 		(DIA_Ingmar_Teach, DIALOG_BACK, DIA_Ingmar_Teach_BACK);
	Info_AddChoice		(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Ingmar_Teach_1);
	Info_AddChoice		(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Ingmar_Teach_5);
	
};
func void DIA_Ingmar_Teach_BACK()
{
	if (other.attribute [ATR_STRENGTH] >= T_MAX)
	{
		AI_Output (self, other, "DIA_Ingmar_Teach_06_00"); //Jeste� silny niczym troll, nie potrzebujesz ju� treningu.
	};
	Info_ClearChoices (DIA_Ingmar_TEACH);
};
func void DIA_Ingmar_Teach_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MAX);
	
	Info_ClearChoices   (DIA_Ingmar_Teach);
	
	Info_AddChoice 		(DIA_Ingmar_Teach, DIALOG_BACK, DIA_Ingmar_TEACH_BACK);
	Info_AddChoice		(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Ingmar_Teach_1);
	Info_AddChoice		(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Ingmar_Teach_5);
	
	
};
func void DIA_Ingmar_Teach_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MAX);
	
	Info_ClearChoices   (DIA_Ingmar_Teach);
	
	Info_AddChoice 		(DIA_Ingmar_Teach, DIALOG_BACK, DIA_Ingmar_Teach_BACK);
	Info_AddChoice		(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Ingmar_Teach_1);
	Info_AddChoice		(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Ingmar_Teach_5);
	
	
}; 

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Ingmar_KAP3_EXIT(C_INFO)
{
	npc			= Pal_201_Ingmar;
	nr			= 999;
	condition	= DIA_Ingmar_KAP3_EXIT_Condition;
	information	= DIA_Ingmar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ingmar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ingmar_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Ingmar_KAP4_EXIT(C_INFO)
{
	npc			= Pal_201_Ingmar;
	nr			= 999;
	condition	= DIA_Ingmar_KAP4_EXIT_Condition;
	information	= DIA_Ingmar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ingmar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ingmar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

	
///////////////////////////////////////////////////////////////////////
//	Info Orkelite
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_ORKELITE		(C_INFO)
{
	npc		 = 	Pal_201_Ingmar;
	nr		 = 	40;
	condition	 = 	DIA_Ingmar_ORKELITE_Condition;
	information	 = 	DIA_Ingmar_ORKELITE_Info;

	description	 = 	"Orkowie planuj� ogromny atak.";
};

func int DIA_Ingmar_ORKELITE_Condition ()
{
	if ((TalkedTo_AntiPaladin == TRUE) || (Npc_HasItems (other,ItRi_OrcEliteRing)) || (Hagen_SawOrcRing == TRUE))
	&& (hero.guild == GIL_PAL)
		{
				return TRUE;
		};
};

func void DIA_Ingmar_ORKELITE_Info ()
{

	AI_Output (other, self, "DIA_Ingmar_ORKELITE_15_00"); //Orkowie planuj� ogromny atak.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_06_01"); //Doprawdy? Bardzo interesuj�ce. A sk�d niby o tym wiesz?

	if (TalkedTo_AntiPaladin == TRUE)
	{
	AI_Output (other, self, "DIA_Ingmar_ORKELITE_15_02"); //Rozmawia�em z nimi.
	};

	AI_Output (other, self, "DIA_Ingmar_ORKELITE_15_03"); //Niekt�rzy z ich przyw�dc�w grasuj� w tej okolicy.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_06_04"); //Hm. Nie wygl�da mi to na typow� strategi� ork�w.

	Info_ClearChoices	(DIA_Ingmar_ORKELITE);
	Info_AddChoice	(DIA_Ingmar_ORKELITE, "Lepiej wymy�l, jak si� ich pozby�.", DIA_Ingmar_ORKELITE_loswerden );
	Info_AddChoice	(DIA_Ingmar_ORKELITE, "Co teraz zrobimy?", DIA_Ingmar_ORKELITE_wasTun );
	Info_AddChoice	(DIA_Ingmar_ORKELITE, "Co masz na my�li?", DIA_Ingmar_ORKELITE_wieso );

	Log_CreateTopic (TOPIC_OrcElite, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcElite, LOG_RUNNING);
	B_LogEntry (TOPIC_OrcElite,"Ingmara bardzo zainteresowa�a historia o przyw�dcy herszt�w ork�w."); 

	MIS_KillOrkOberst = LOG_RUNNING;
};
func void DIA_Ingmar_ORKELITE_loswerden ()
{
	AI_Output (other, self, "DIA_Ingmar_ORKELITE_loswerden_15_00"); //Lepiej wymy�l, jak si� ich pozby�.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_loswerden_06_01"); //Gdyby�my mieli wi�cej informacji... Wy�l� kogo� na zwiady.
	Info_ClearChoices	(DIA_Ingmar_ORKELITE);
};

func void DIA_Ingmar_ORKELITE_wieso ()
{
	AI_Output (other, self, "DIA_Ingmar_ORKELITE_wieso_15_00"); //Co to oznacza?
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wieso_06_01"); //A je�li m�wisz prawd�, oznacza to, �e pr�buj� nas najpierw os�abi�, wysy�aj�c tu swoich najlepszych wojownik�w.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wieso_06_02"); //Przewa�nie jeden dow�dca prowadzi ca�� hord� orkowych wojownik�w. Zwykle nie spotyka si� ich w grupach.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wieso_06_03"); //Taka strategia ma swoje uzasadnienie - przyw�dcy stanowi� rdze� si� szturmowych i zwykle s� otoczeni kordonem wojownik�w.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wieso_06_04"); //Dlatego, aby si� do nich zbli�y�, trzeba pokona� przynajmniej 30 wojownik�w.
	
	B_LogEntry (TOPIC_OrcElite,"Ingmar wspomina� co� o przyw�dcy herszt�w ork�w."); 
};

func void DIA_Ingmar_ORKELITE_wasTun ()
{
	AI_Output (other, self, "DIA_Ingmar_ORKELITE_wasTun_15_00"); //Co teraz zrobimy?
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wasTun_06_01"); //Kiedy pojawiaj� si� w takiej liczbie, to przewa�nie tworz� patrol prowadzony przez najwy�szego rang� przyw�dc�.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wasTun_06_02"); //Herszt zak�ada siedzib� i wycofuje si� do jakiej� jaskini, z kt�rej wydaje rozkazy swoim oddzia�om.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wasTun_06_03"); //Gdyby uda�o nam si� schwyta� tego przyw�dc�, zyskaliby�my ogromn� przewag�.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wasTun_06_04"); //Orkowi przyw�dcy lubi� przebywa� blisko wroga. Jego jaskini nale�y zatem szuka� gdzie� w pobli�u miasta.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wasTun_06_05"); //W pobli�u farmy Lobarta zauwa�ono kilku ork�w. Mo�e w�a�nie tam nale�a�oby rozpocz�� poszukiwania.

	B_LogEntry (TOPIC_OrcElite,"Ingmar s�dzi, �e orkowy przyw�dca przebywa prawdopodobnie w jaskini gdzie� w pobli�u farmy Lobarta. Ingmar chce, abym go odnalaz� i pokona�."); 
	
	Info_ClearChoices	(DIA_Ingmar_ORKELITE);
};


///////////////////////////////////////////////////////////////////////
//	Info Hauptquartier
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_HAUPTQUARTIER		(C_INFO)
{
	npc			 = 	Pal_201_Ingmar;
	nr			 = 	41;
	condition	 = 	DIA_Ingmar_HAUPTQUARTIER_Condition;
	information	 = 	DIA_Ingmar_HAUPTQUARTIER_Info;
	permanent	 =  FALSE;
	description	 = 	"Uda�o mi si� odnale�� siedzib� ork�w.";
};

func int DIA_Ingmar_HAUPTQUARTIER_Condition ()
{
	if (Npc_IsDead(OrkElite_AntiPaladinOrkOberst))
	&& (Npc_KnowsInfo(other, DIA_Ingmar_ORKELITE))
		{
				return TRUE;
		};
};

func void DIA_Ingmar_HAUPTQUARTIER_Info ()
{
	AI_Output (other, self, "DIA_Ingmar_HAUPTQUARTIER_15_00"); //Uda�o mi si� odnale�� siedzib� ork�w. Ich herszt poleg� w walce.
	AI_Output (self, other, "DIA_Ingmar_HAUPTQUARTIER_06_01"); //To wspania�a wiadomo��. Przez jaki� czas w szeregach wroga zapanuje chaos.
	AI_Output (self, other, "DIA_Ingmar_HAUPTQUARTIER_06_02"); //Musz� przyzna�, �e nie�le si� spisa�e�. Gdyby�my mieli wi�cej rycerzy takich jak ty, nadchodz�ca bitwa by�aby dla nas bu�k� z mas�em.
	AI_Output (self, other, "DIA_Ingmar_HAUPTQUARTIER_06_03"); //Prosz�, we� to z�oto i kup sobie za nie troch� ekwipunku.

	B_GivePlayerXP (XP_KilledOrkOberst);
	CreateInvItems (self, ItMi_Gold, 300);									
	B_GiveInvItems (self, other, ItMi_Gold, 300);					
	MIS_KillOrkOberst = LOG_SUCCESS;
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Ingmar_KAP5_EXIT(C_INFO)
{
	npc			= Pal_201_Ingmar;
	nr			= 999;
	condition	= DIA_Ingmar_KAP5_EXIT_Condition;
	information	= DIA_Ingmar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ingmar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ingmar_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Ingmar_KAP6_EXIT(C_INFO)
{
	npc			= Pal_201_Ingmar;
	nr			= 999;
	condition	= DIA_Ingmar_KAP6_EXIT_Condition;
	information	= DIA_Ingmar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ingmar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ingmar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ingmar_PICKPOCKET (C_INFO)
{
	npc			= Pal_201_Ingmar;
	nr			= 900;
	condition	= DIA_Ingmar_PICKPOCKET_Condition;
	information	= DIA_Ingmar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Kradzie� tego zwoju graniczy z cudem)";
};                       

FUNC INT DIA_Ingmar_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (105 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Ingmar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ingmar_PICKPOCKET);
	Info_AddChoice		(DIA_Ingmar_PICKPOCKET, DIALOG_BACK 		,DIA_Ingmar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ingmar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ingmar_PICKPOCKET_DoIt);
};

func void DIA_Ingmar_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 105)
	{
		B_GiveInvItems (self, other, ITWr_Manowar, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Ingmar_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Ingmar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ingmar_PICKPOCKET);
};







































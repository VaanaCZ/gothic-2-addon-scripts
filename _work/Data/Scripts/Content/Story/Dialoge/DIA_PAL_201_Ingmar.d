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
		AI_Output (self, other, "DIA_Ingmar_Hallo_06_00"); //Podle zpráv, které jsem dostal, je Hornické údolí dost nebezpečné místo.
		AI_Output (self, other, "DIA_Ingmar_Hallo_06_01"); //Než odejdeš, poâádnę se vybav.
	}
	else if (MIS_OLDWORLD == LOG_SUCCESS)
	&& 		(LordHagen.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Ingmar_Hallo_06_02"); //Situace v Hornickém údolí je vážná. Ale pâipravíme nęjaký plán, jak odtamtud dostat naše chlapce i s rudou.
		DIA_Ingmar_Hallo_permanent = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Ingmar_Hallo_06_03"); //Myslel jsem, že sis pâišel promluvit s lordem Hagenem. Tak jen do toho.
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
	description	 =  "Jaká je situace na kontinentu?";
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
	AI_Output (other, self, "DIA_Ingmar_Krieg_15_00"); //Jaká je situace na kontinentu?
	AI_Output (self, other, "DIA_Ingmar_Krieg_06_01"); //Válka ještę není vyhraná, i když královské síly už ženou skâety zpęt.
	AI_Output (self, other, "DIA_Ingmar_Krieg_06_02"); //Na mnohých místech se ale shromažëují menší tlupy skâetů a snaží se naší armádu roztâíštit.
	AI_Output (self, other, "DIA_Ingmar_Krieg_06_03"); //Bojují beze cti a bez víry - musíme tedy zvítęzit.
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
	description	 = 	"Můžeš mę nęco naučit?";
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
	AI_Output (other, self, "DIA_Ingmar_CanTeach_15_00"); //Můžeš mę nęco naučit?
	
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Ingmar_CanTeach_06_01"); //Můžu tę naučit, jak si posílit paže, abys mohl používat zbranę efektivnęji.
			Ingmar_TeachSTR = TRUE;
			B_LogEntry (TOPIC_CityTeacher,"Paladin Ingmar mi může pomoci zvýšit sílu.");
	}
	else 
	{
		AI_Output (self, other, "DIA_Ingmar_CanTeach_06_02"); //Učím pouze členy našeho âádu.
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
	description	 = 	"Chci se stát silnęjším.";
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
	AI_Output (other, self, "DIA_Ingmar_Teach_15_00"); //Chtęl bych se stát silnęjším.
	
	
	Info_ClearChoices   (DIA_Ingmar_Teach);
	Info_AddChoice 		(DIA_Ingmar_Teach, DIALOG_BACK, DIA_Ingmar_Teach_BACK);
	Info_AddChoice		(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Ingmar_Teach_1);
	Info_AddChoice		(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Ingmar_Teach_5);
	
};
func void DIA_Ingmar_Teach_BACK()
{
	if (other.attribute [ATR_STRENGTH] >= T_MAX)
	{
		AI_Output (self, other, "DIA_Ingmar_Teach_06_00"); //Už jsi silný jako trol. Není nic, co bych tę mohl naučit.
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

	description	 = 	"Skâeti plánují hlavní ofenzívu.";
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

	AI_Output (other, self, "DIA_Ingmar_ORKELITE_15_00"); //Skâeti plánují hlavní ofenzívu.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_06_01"); //Vážnę. Tak to je velice zajímavé. A na základę čeho se tak domníváš?

	if (TalkedTo_AntiPaladin == TRUE)
	{
	AI_Output (other, self, "DIA_Ingmar_ORKELITE_15_02"); //Mluvil jsem s nimi.
	};

	AI_Output (other, self, "DIA_Ingmar_ORKELITE_15_03"); //Po kraji se potulují jejich velitelé.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_06_04"); //Hmm. To nezní jako typická skâetí strategie.

	Info_ClearChoices	(DIA_Ingmar_ORKELITE);
	Info_AddChoice	(DIA_Ingmar_ORKELITE, "Radęji bys męl pâijít na nęco, jak se jich zbavit.", DIA_Ingmar_ORKELITE_loswerden );
	Info_AddChoice	(DIA_Ingmar_ORKELITE, "Co udęláme?", DIA_Ingmar_ORKELITE_wasTun );
	Info_AddChoice	(DIA_Ingmar_ORKELITE, "Co to znamená?", DIA_Ingmar_ORKELITE_wieso );

	Log_CreateTopic (TOPIC_OrcElite, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcElite, LOG_RUNNING);
	B_LogEntry (TOPIC_OrcElite,"Ingmar se velmi zajímá o pâíbęh skâetích elitních válečníků."); 

	MIS_KillOrkOberst = LOG_RUNNING;
};
func void DIA_Ingmar_ORKELITE_loswerden ()
{
	AI_Output (other, self, "DIA_Ingmar_ORKELITE_loswerden_15_00"); //Radęji bys męl pâijít na nęco, jak se jich zbavit.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_loswerden_06_01"); //Męlo by stačit, kdybychom męli víc informací. Pošlu nękoho, aby prozkoumal okolí.
	Info_ClearChoices	(DIA_Ingmar_ORKELITE);
};

func void DIA_Ingmar_ORKELITE_wieso ()
{
	AI_Output (other, self, "DIA_Ingmar_ORKELITE_wieso_15_00"); //Co to znamená?
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wieso_06_01"); //Pokud je to, co âíkáš, pravda, tak nás chtęjí oslabit zevnitâ tím, že na nás budou útočit jejich nejlepší válečníci.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wieso_06_02"); //Obvykle jeden takový velitel vede skupinu skâetích bojovníků. Málokdy jich vidíš dva nebo víc pohromadę.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wieso_06_03"); //Dęlají to z nęjakého důvodu. Jejich vůdci tvoâí jádro útočné strategie a vętšinou jsou obklopeni skâetími válečníky.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wieso_06_04"); //Je tedy velice tęžké se k nękomu z nich dostat, aniž by bylo nutné si prosekat cestu alespoŕ tâiceti nepâáteli.
	
	B_LogEntry (TOPIC_OrcElite,"Ingmar se zmínil o hlavním skâetím vojevůdci."); 
};

func void DIA_Ingmar_ORKELITE_wasTun ()
{
	AI_Output (other, self, "DIA_Ingmar_ORKELITE_wasTun_15_00"); //Co udęláme?
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wasTun_06_01"); //Když jich je tolik jako teë, jedná se vętšinou o nájezdnou patrolu, kterou vede ten nejvýše postavený z nich.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wasTun_06_02"); //Nejvýše postavený vojevůdce si zaâídí hlavní stan v nęjaké jeskyni, odkud vysílá své vojsko do boje.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wasTun_06_03"); //Pokud by se nám podaâilo tohoto velitele zneškodnit, získali bychom tak nezanedbatelnou výhodu.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wasTun_06_04"); //Skâetí velitel se vętšinou pohybuje v blízkosti svých nepâátel. Asi by bylo dobré hledat jeho jeskyni nękde nedaleko męsta.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wasTun_06_05"); //Nękolik skâetů bylo spatâeno poblíž Lobartovy farmy. Asi by bylo moudré začít s pátráním tam.

	B_LogEntry (TOPIC_OrcElite,"Podle Ingmara bych męl skâetího plukovníka hledat v jeskyni kdesi u Lobartova statku. Mám ho najít a zničit."); 
	
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
	description	 = 	"Podaâilo se mi vypátrat hlavní skâetí stan.";
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
	AI_Output (other, self, "DIA_Ingmar_HAUPTQUARTIER_15_00"); //Našel jsem hlavní stan skâetů. Jejich vojevůdce padl.
	AI_Output (self, other, "DIA_Ingmar_HAUPTQUARTIER_06_01"); //To je vynikající zpráva. Skâeti tak nebudou mít nęjaký čas na útok ani pomyšlení.
	AI_Output (self, other, "DIA_Ingmar_HAUPTQUARTIER_06_02"); //To není špatné. Kdybychom męli víc rytíâů, jako jsi ty, byla by nadcházející bitva pâedem rozhodnuta.
	AI_Output (self, other, "DIA_Ingmar_HAUPTQUARTIER_06_03"); //Vezmi si tohle zlato a kup si za nęj nęjakou poâádnou výbavu.

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
	description = "(Tento svitek je témęâ nemožné ukrást.)";
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








































///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Merdarion_ADW_EXIT   (C_INFO)
{
	npc         = KDW_14050_Addon_Merdarion_ADW;
	nr          = 999;
	condition   = DIA_Addon_Merdarion_ADW_EXIT_Condition;
	information = DIA_Addon_Merdarion_ADW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Merdarion_ADW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Merdarion_ADW_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Merdarion_ADW_PICKPOCKET (C_INFO)
{
	npc			= KDW_14050_Addon_Merdarion_ADW;
	nr			= 900;
	condition	= DIA_Addon_Merdarion_ADW_PICKPOCKET_Condition;
	information	= DIA_Addon_Merdarion_ADW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wäre einfach seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Merdarion_ADW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Merdarion_NW.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Merdarion_ADW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Merdarion_ADW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Merdarion_ADW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Merdarion_ADW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Merdarion_ADW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Merdarion_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Merdarion_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItSc_ArmyOfDarkness, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Merdarion_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Merdarion_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Merdarion_ADW_PICKPOCKET);
};
*/
 ///////////////////////////////////////////////////////////////////////
//	Info ADWHello
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_ADWHello		(C_INFO)
{
	npc		 = 	KDW_14050_Addon_Merdarion_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_ADWHello_Condition;
	information	 = 	DIA_Addon_Merdarion_ADWHello_Info;

	description	 = 	"Co s³ychaæ?";
};

func int DIA_Addon_Merdarion_ADWHello_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_ADWHello_Back ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_ADWHello_Back_15_00"); //Doœæ ju¿ s³ysza³em.
	Info_ClearChoices	(DIA_Addon_Merdarion_ADWHello);
};
func void DIA_Addon_Merdarion_ADWHello_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_ADWHello_15_00"); //Co s³ychaæ?
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_06_01"); //S³yszysz? Dziwne, prawda?
	AI_Output	(other, self, "DIA_Addon_Merdarion_ADWHello_15_02"); //Hmm...
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_06_03"); //Kamienie teleportacyjne nie dzia³aj¹, ale wci¹¿ s³ychaæ szum.
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_06_04"); //Choæ nie s¹ aktywne, to drzemie w nich uœpiona energia.

	Info_ClearChoices	(DIA_Addon_Merdarion_ADWHello);
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "Co zasila kamienie teleportacyjne?", DIA_Addon_Merdarion_ADWHello_reaktor );
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "Jak myœlisz, co mo¿e byæ potrzebne do ich uaktywnienia?", DIA_Addon_Merdarion_ADWHello_was );
};
func void DIA_Addon_Merdarion_ADWHello_was ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_ADWHello_was_15_00"); //Jak myœlisz, co mo¿e byæ potrzebne do ich uaktywnienia?
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_was_06_01"); //Mam pewne podejrzenia. Potrzebujê tylko dowodu na poparcie mojej teorii.
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_was_06_02"); //Kilka dni temu mia³em wra¿enie, ¿e gdzieœ ju¿ widzia³em obiekty w podobnym stylu.
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_was_06_03"); //Podejrzewam, ¿e chc¹c je ponownie uruchomiæ, nale¿a³oby w nie wt³oczyæ ogromne iloœci magicznej energii.
	
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "Gdzie przedtem widzia³eœ takie kamienie teleportacyjne?", DIA_Addon_Merdarion_ADWHello_wo );
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "Co mo¿e zawieraæ doœæ energii?", DIA_Addon_Merdarion_ADWHello_focus );
};
func void DIA_Addon_Merdarion_ADWHello_focus ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_ADWHello_focus_15_00"); //Co mo¿e zawieraæ doœæ energii?
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focus_06_01"); //Przychodzi mi na myœl tylko jedno.
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focus_06_02"); //Myœlê o jednym z piêciu kamieni ogniskuj¹cych, których u¿yto do stworzenia magicznej bariery w Górniczej Dolinie.
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focus_06_03"); //Z tego, co wiem, mia³eœ je dla nas zdobyæ jakiœ czas temu.
	AI_Output			(other, self, "DIA_Addon_Merdarion_ADWHello_focus_15_04"); //Tak. Pamiêtam.
	
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "Mówi³eœ, ¿e potrzebujesz dowodów na poparcie twych domys³ów?", DIA_Addon_Merdarion_ADWHello_focusProof );
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "Gdzie s¹ teraz kamienie ogniskuj¹ce?", DIA_Addon_Merdarion_ADWHello_focusWo );
};
func void DIA_Addon_Merdarion_ADWHello_focusWo ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_ADWHello_focusWo_15_00"); //Gdzie s¹ teraz kamienie ogniskuj¹ce?
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focusWo_06_01"); //Zosta³y mi przekazane. Mam siê nimi opiekowaæ, a¿ znajdziemy dla nich inne zastosowanie.
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focusWo_06_02"); //Wygl¹da na to, ¿e ten czas w³aœnie nasta³.
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "Doœæ ju¿ s³ysza³em.", DIA_Addon_Merdarion_ADWHello_Back );
};
func void DIA_Addon_Merdarion_ADWHello_focusProof ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_ADWHello_focusProof_15_00"); //Mówi³eœ, ¿e potrzebujesz dowodów na poparcie twych domys³ów?
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focusProof_06_01"); //Trzeba w³o¿yæ kamieñ ogniskuj¹cy do kamienia teleportacyjnego.
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focusProof_06_02"); //Ale nie wiem, w którym miejscu.
};
func void DIA_Addon_Merdarion_ADWHello_wo ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_ADWHello_wo_15_00"); //Gdzie przedtem widzia³eœ takie kamienie teleportacyjne?
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_wo_06_01"); //Przecie¿ ty te¿ by³eœ w kolonii karnej. Te kamienie nie wydawa³y ci siê dziwne?
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_wo_06_02"); //Jestem pewien, ¿e mo¿na je tu wci¹¿ znaleŸæ.
};
func void DIA_Addon_Merdarion_ADWHello_reaktor ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_ADWHello_reaktor_15_00"); //Co zasila kamienie teleportacyjne?
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_reaktor_06_01"); //Budowniczowie byli bardzo wysoko rozwiniêtym spo³eczeñstwem.
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_reaktor_06_02"); //Korzystali z magii w sposób, jakiego nigdy przedtem nie widzieliœmy.
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_reaktor_06_03"); //Stworzono sieæ kamieni teleportacyjnych, aby umo¿liwiæ budowniczym szybkie przemieszczanie siê po mieœcie.
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_reaktor_06_04"); //Kamienie w TYM miejscu wygl¹daj¹ na centralny punkt nawigacyjny.
};

///////////////////////////////////////////////////////////////////////
//	Info FokusGeben
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_FokusGeben		(C_INFO)
{
	npc		 = 	KDW_14050_Addon_Merdarion_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_FokusGeben_Condition;
	information	 = 	DIA_Addon_Merdarion_FokusGeben_Info;

	description	 = 	"Daj mi kamieñ ogniskuj¹cy.";
};

func int DIA_Addon_Merdarion_FokusGeben_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_ADWHello))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_FokusGeben_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_FokusGeben_15_00"); //Daj mi kamieñ ogniskuj¹cy. Zobaczê, czy uda mi siê uruchomiæ teleporty.
	AI_Output	(self, other, "DIA_Addon_Merdarion_FokusGeben_06_01"); //No có¿, dobrze. Ale uwa¿aj z nimi!
	AI_Output	(self, other, "DIA_Addon_Merdarion_FokusGeben_06_02"); //Saturas skróci³by mnie o g³owê, gdybyœmy je stracili.
	CreateInvItems (self, ItMi_Focus, 1);									
	B_GiveInvItems (self, other, ItMi_Focus, 1);			
	
	Log_CreateTopic (TOPIC_Addon_TeleportsADW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsADW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_TeleportsADW,"Mag Wody, Merdarion, da³ mi jeden ze starych kamieni ogniskuj¹cych, których u¿yto do stworzenia bariery w Górniczej Dolinie. Chce, bym uruchomi³ kamieñ teleportacyjny."); 
};

///////////////////////////////////////////////////////////////////////
//	Info FirstFocus
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_FirstFocus		(C_INFO)
{
	npc		 = 	KDW_14050_Addon_Merdarion_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_FirstFocus_Condition;
	information	 = 	DIA_Addon_Merdarion_FirstFocus_Info;

	description	 = 	"Uaktywni³em jeden z kamieni teleportacyjnych.";
};

func int DIA_Addon_Merdarion_FirstFocus_Condition ()
{
	if (TriggeredTeleporterADW != 0)
		{
			return TRUE;
		};
};
var int Merdarion_GotFocusCount;
func void DIA_Addon_Merdarion_FirstFocus_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_FirstFocus_15_00"); //Uaktywni³em jeden z kamieni teleportacyjnych.
	AI_Output	(self, other, "DIA_Addon_Merdarion_FirstFocus_06_01"); //Widzê. A wiêc jednak mia³em racjê.
	AI_Output	(self, other, "DIA_Addon_Merdarion_FirstFocus_06_02"); //Ju¿ rozmawia³em o tym z innymi.
	AI_Output	(self, other, "DIA_Addon_Merdarion_FirstFocus_06_03"); //Chcemy, ¿ebyœ uruchomi³ wszystkie kamienie teleportacyjne.
	AI_Output	(self, other, "DIA_Addon_Merdarion_FirstFocus_06_04"); //W naszych badaniach bardzo przyda siê mo¿liwoœæ szybkiego przemieszczania siê pomiêdzy ró¿nymi dzielnicami.
	AI_Output	(self, other, "DIA_Addon_Merdarion_FirstFocus_06_05"); //Oto kolejny kamieñ ogniskuj¹cy.
	CreateInvItems (self, ItMi_Focus, 1);									
	B_GiveInvItems (self, other, ItMi_Focus, 1);		
	Merdarion_GotFocusCount = 1;
	AI_Output	(self, other, "DIA_Addon_Merdarion_FirstFocus_06_06"); //Postaraj siê uaktywniæ je wszystkie.
	AI_Output	(other, self, "DIA_Addon_Merdarion_FirstFocus_15_07"); //Zobaczê, co da siê zrobiæ.
	B_GivePlayerXP (XP_Addon_ActivatedTeleportStone);
	B_LogEntry (TOPIC_Addon_TeleportsADW,"Merdarion da³ mi kolejny kamieñ ogniskuj¹cy. Jeœli uruchomiê kamieñ teleportacyjny, dostanê nastêpny kamieñ ogniskuj¹cy. Dziêki temu uruchomiê wszystkie kamienie teleportacyjne."); 
};

///////////////////////////////////////////////////////////////////////
//	Info ActivateTeleports
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_ActivateTeleports		(C_INFO)
{
	npc		 = 	KDW_14050_Addon_Merdarion_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_ActivateTeleports_Condition;
	information	 = 	DIA_Addon_Merdarion_ActivateTeleports_Info;
	permanent	 = 	TRUE;

	description	 = 	"Uruchomi³em kolejny kamieñ teleportacyjny.";
};
func int DIA_Addon_Merdarion_ActivateTeleports_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_FirstFocus))
	&&	(TriggeredTeleporterADW > Merdarion_GotFocusCount)
	&& (Merdarion_GotFocusCount < 6)
			{
				return TRUE;
			};
};

var int DIA_Addon_Merdarion_ActivateTeleports_OneTime;

func void DIA_Addon_Merdarion_ActivateTeleports_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_ActivateTeleports_15_00"); //Uruchomi³em kolejny kamieñ teleportacyjny.

	if (SC_ADW_ActivatedAllTelePortStones == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Merdarion_ActivateTeleports_15_01"); //Daj mi nastêpny kamieñ ogniskuj¹cy.
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_02"); //Oczywiœcie. Proszê.
		CreateInvItems (self, ItMi_Focus, 1);									
		B_GiveInvItems (self, other, ItMi_Focus, 1);		
	};
	
	if (DIA_Addon_Merdarion_ActivateTeleports_OneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_03"); //Czy to by³o trudne?
		AI_Output	(other, self, "DIA_Addon_Merdarion_ActivateTeleports_15_04"); //I tak, i nie. Przyda³oby mi siê ma³e wsparcie.
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_05"); //Mogê daæ ci trochê z³ota. To ci pomo¿e?
		AI_Output	(other, self, "DIA_Addon_Merdarion_ActivateTeleports_15_06"); //Na pewno nie zaszkodzi.
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_07"); //Niech zobaczê...
		DIA_Addon_Merdarion_ActivateTeleports_OneTime = TRUE;
	};
	
	if (SC_ADW_ActivatedAllTelePortStones == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_08"); //Naprawdê dobrze siê spisa³eœ. Mogê ci jedynie pogratulowaæ wykonanej pracy.
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_09"); //Teraz dzia³aj¹ ju¿ wszystkie. Fascynuj¹cy widok, nie s¹dzisz?
	};
	
	AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_10"); //Masz tu trochê z³otych monet.
	B_GivePlayerXP (XP_Addon_ActivatedTeleportStone);
	CreateInvItems (self, ItMi_Gold, 150);									
	B_GiveInvItems (self, other, ItMi_Gold, 150);		
	Merdarion_GotFocusCount = (Merdarion_GotFocusCount + 1);
	
	if (Merdarion_GotFocusCount >= 1)
	&& (Saturas_SCBroughtAllToken == FALSE)
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
 	&& (MIS_Saturas_LookingForHousesOfRulers == 0)
 	{
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_11"); //O, zanim zapomnê... Saturas chcia³by siê z tob¹ widzieæ.
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_12"); //Powinieneœ udaæ siê do niego jak najszybciej.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PreTeachMana
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_ADW_PreTeachMana		(C_INFO)
{
	npc		 = 	KDW_14050_Addon_Merdarion_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_ADW_PreTeachMana_Condition;
	information	 = 	DIA_Addon_Merdarion_ADW_PreTeachMana_Info;

	description	 = 	"Mo¿esz mnie nauczyæ czegoœ na temat magii?";
};
func int DIA_Addon_Merdarion_ADW_PreTeachMana_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_ADWHello))
		{
			return TRUE;
		};
};
func void DIA_Addon_Merdarion_ADW_PreTeachMana_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_ADW_PreTeachMana_15_00"); //Mo¿esz mnie nauczyæ czegoœ na temat magii?
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADW_PreTeachMana_06_01"); //Mogê ci pokazaæ, jak zwiêkszyæ moc magiczn¹.
	Merdarion_Addon_TeachMana = TRUE;

	Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
	B_LogEntry (TOPIC_Addon_KDWTeacher,"Merdarion mo¿e zwiêkszyæ moj¹ manê."); 
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH_MANA
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_ADW_TEACH_MANA		(C_INFO)
{
	npc			 = 	KDW_14050_Addon_Merdarion_ADW;
	nr 			 =  99;
	condition	 = 	DIA_Addon_Merdarion_ADW_TEACH_MANA_Condition;
	information	 = 	DIA_Addon_Merdarion_ADW_TEACH_MANA_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chcê zwiêkszyæ swoje zasoby magicznej energii.";
};
var int Merdarion_ADW_Empty;
func int DIA_Addon_Merdarion_ADW_TEACH_MANA_Condition ()
{	
		if (Merdarion_ADW_Empty == FALSE)
		&& (Merdarion_Addon_TeachMana == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Merdarion_ADW_TEACH_MANA_Info ()
{
		AI_Output (other, self, "DIA_Addon_Merdarion_ADW_TEACH_MANA_15_00"); //Chcê zwiêkszyæ swoje zasoby magicznej energii.
		
		Info_ClearChoices   (DIA_Addon_Merdarion_ADW_TEACH_MANA);	
		Info_AddChoice 		(DIA_Addon_Merdarion_ADW_TEACH_MANA,DIALOG_BACK,DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);		
		Info_AddChoice		(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1		, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
		Info_AddChoice		(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5		, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};
FUNC VOID DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_HIGH)  
	{
		AI_Output (self, other, "DIA_Addon_Merdarion_ADW_TEACH_MANA_06_00"); //Nie mogê spe³niæ twojej proœby.
		AI_Output (self, other, "DIA_Addon_Merdarion_ADW_TEACH_MANA_06_01"); //Nie mogê nauczyæ ciê ju¿ nic wiêcej.
		Merdarion_ADW_Empty = TRUE;
	};
	
	Info_ClearChoices   (DIA_Addon_Merdarion_ADW_TEACH_MANA);	
};
FUNC VOID DIA_Addon_Merdarion_ADW_TEACH_MANA_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_HIGH);
	
	Info_ClearChoices   (DIA_Addon_Merdarion_ADW_TEACH_MANA);	
	Info_AddChoice 		(DIA_Addon_Merdarion_ADW_TEACH_MANA,DIALOG_BACK,DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
	Info_AddChoice		(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};
FUNC VOID DIA_Addon_Merdarion_ADW_TEACH_MANA_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_HIGH);
	
	Info_ClearChoices   (DIA_Addon_Merdarion_ADW_TEACH_MANA);	
	Info_AddChoice 		(DIA_Addon_Merdarion_ADW_TEACH_MANA,DIALOG_BACK,DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
	Info_AddChoice		(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};













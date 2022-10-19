// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Dexter_EXIT   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 999;
	condition   = DIA_Dexter_EXIT_Condition;
	information = DIA_Dexter_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Dexter_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Dexter_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  Hallo
// ************************************************************
INSTANCE DIA_Dexter_Hallo   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 1;
	condition   = DIA_Dexter_Hallo_Condition;
	information = DIA_Dexter_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Dexter_Hallo_Condition()
{	
	if (Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Hallo_Info()
{
	AI_Output (self, other, "DIA_Dexter_Hallo_09_00");//Podívejme, koho tady máme. Velký zastánce práva. Fajn, hrdino, copak tu pohledáváme?
	AI_Output (other, self, "DIA_Dexter_Hallo_15_01");//Hledám pár odpovêdí.
	
	if (Ranger_SCKnowsDexter == TRUE)//ADDON
	{
		//ADDON>
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_00");//Nikdy mê nenapadlo, že bys sem pâišel dobrovolnê.
		AI_Output (other, self, "DIA_Addon_Dexter_Hallo_15_01");//Co tím myslíš?
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_02");//Že jsem tê hledal. Copak jsi nevidêl ty moje zprávy o tom hledaném chlapovi?
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_03");//A na všech byl TVÙJ ksicht. Jojo, dêsnê po tobê toužíme. Copak jsi to nevêdêl?
		//ADDON<
	}
	else // (Bdt13_Dexter_verraten == TRUE) //Gothic2
	{
		AI_Output (other, self, "DIA_Dexter_Hallo_15_02");//NÊKDO dal do obêhu papíry s mým portrétem a âekl mi žes to byl ty.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_03");//Tak to NÊKDO moc mluvil.
		
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_04");//Ale máš recht. Ty plakáty jsou moje práce. A vida, už tê tu máme!
		
		/*//ADDON>
		AI_Output (self, other, "DIA_Dexter_Hallo_09_04");//Aber es stimmt. Ich habe meinen Jungs die Steckbriefe gegeben. Ich hatte keine andere Wahl.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_05");//Als ich versuchte, aus dem Minental zu entfliehen, entdeckten mich die Soldaten und trieben mich in eine Falle.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_06");//Ich dachte schon, das wäre mein Ende, aber dann tauchte plötzlich aus der Dunkelheit diese ... Gestalt auf.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_07");//Er trug eine schwarze Robe mit Kapuze und eine Maske überm Gesicht. Und er sprach mit einer Stimme, die alles andere als menschlich war.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_08");//Aber er bot mir seine Hilfe an. Er brachte mich aus dem Tal und bot mir eintausend Goldstücke für deinen Kopf.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_09");//Hey, was sollte ich machen? Wenn ich abgelehnt hätte, dann hätte er mich getötet!
		*///ADDON<
		//ADDON B_LogEntry (Topic_Bandits,"Dexter hat die Steckbriefe verteilt. Typen mit schwarzen Kapuzen haben ihn damit beauftragt.");
		
		
		MIS_Steckbriefe = LOG_SUCCESS;
		B_GivePlayerXP (XP_Ambient);
	};
	AI_Output (other, self, "DIA_Addon_Dexter_Hallo_15_05");//Tak co ode mê chceš?
	AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_06");//Já? Absolutnê nic. Zato mùj šéf se sakra têší, až budeš mrtvej.
	AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_07");//A tak po mnê chce, abych mu pâinesl tvou hlavu.
};

// ************************************************************
// 			Glaube 
// ************************************************************
INSTANCE DIA_Dexter_Glaube   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 5;
	condition   = DIA_Dexter_Glaube_Condition;
	information = DIA_Dexter_Glaube_Info;
	permanent   = FALSE;
	description = "Nevêâím ti ani slovo.";
};
FUNC INT DIA_Dexter_Glaube_Condition()
{	
	if (Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Glaube_Info()
{
	AI_Output (other, self, "DIA_Dexter_Glaube_15_00");//Nevêâím ti ani slovo.
	AI_Output (self, other, "DIA_Dexter_Glaube_09_01");//Hele, je to pravda. Pâísahám na hrob svý matky!
};

///////////////////////////////////////////////////////////////////////
//	Info Patrick
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_Patrick		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Dexter_Patrick_Condition;
	information	 = 	DIA_Addon_Dexter_Patrick_Info;

	description	 = 	"Zahlédli tu nêjakého žoldáka jménem Patrick.";
};

func int DIA_Addon_Dexter_Patrick_Condition ()
{
	if (MIS_Addon_Cord_Look4Patrick == LOG_RUNNING)
	&& (Knows_Dexter == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Dexter_Patrick_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_Patrick_15_00"); //Zahlídli tu jistého žoldáka jménem Patrick.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_01"); //Patrick? Netuším, o èem to mluvíš.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_02"); //Vzpomínám si na àákýho velkohubýho žoldáka, kterej se tu obèas poflakoval i se svýma kumpánama.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_03"); //(oèividnê lže) Ale už jsem ho jak dlouho nevidêl.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_04"); //(pâedstírá, že je nevinný) Možná už toho mêl plný zuby. Nevím.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Dexter tvrdí, že žádného žoldáka Patricka nezná."); 

	Dexter_KnowsPatrick = TRUE;
	B_GivePlayerXP (XP_Addon_Dexter_KnowsPatrick);
};
///////////////////////////////////////////////////////////////////////
//	Info Greg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_Greg		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Dexter_Greg_Condition;
	information	 = 	DIA_Addon_Dexter_Greg_Info;

	description	 = 	"Pak je tu ten chlápek s páskou pâes oko. A hledá TEBE!";
};

func int DIA_Addon_Dexter_Greg_Condition ()
{
	if (SC_KnowsGregsSearchsDexter == TRUE)
	&& (Knows_Dexter == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Addon_Dexter_Greg_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_Greg_15_00"); //Je tu àákej chlápek s páskou pâes oko. A hledá TEBE!
	AI_Output	(self, other, "DIA_Addon_Dexter_Greg_09_01"); //Mê hledá každej. Je mi to úplnê fuk.
	AI_Output	(self, other, "DIA_Addon_Dexter_Greg_09_02"); //Jestli mi ten chlap nêco chce, tak aã pâijde sem.
	B_GivePlayerXP (XP_Ambient);
};
///////////////////////////////////////////////////////////////////////
//	Info missingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_missingPeople		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Dexter_missingPeople_Condition;
	information	 = 	DIA_Addon_Dexter_missingPeople_Info;

	description	 = 	"Prý unášíš lidi z Khorinidu.";
};

func int DIA_Addon_Dexter_missingPeople_Condition ()
{
	if (SC_KnowsDexterAsKidnapper == TRUE)
	&& (Knows_Dexter == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Dexter_missingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_missingPeople_15_00"); //Prý unášíš lidi z Khorinidu.
	AI_Output	(self, other, "DIA_Addon_Dexter_missingPeople_09_01"); //Tak tos taky zjistil. Dobrá práce, kámo.
	AI_Output	(self, other, "DIA_Addon_Dexter_missingPeople_09_02"); //A já myslel, že jsem zahladil všecky stopy.
	
	Info_ClearChoices	(DIA_Addon_Dexter_missingPeople);
	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "Kdo ti dal ten rozkaz?", DIA_Addon_Dexter_missingPeople_wer );
	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "Kam se ti lidi ztratili? Že by je odvlekli nêkam do dolù?", DIA_Addon_Dexter_missingPeople_Wo );
};
func void DIA_Addon_Dexter_missingPeople_Wo ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_Wo_15_00"); //Kam ti lidi zmizeli? Že by nêkam do dolù tady v okolí?
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Wo_09_01"); //(smêje se) Jsou daleko na severovýchodê, kam se za nima nedostaneš.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Wo_09_02"); //Klidnê ti ukážu, kde pâesnê to je, ale nevím, proè bys to vlastnê mêl vêdêt.
};
func void DIA_Addon_Dexter_missingPeople_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_wer_15_00"); //Kdo ti dal tenhle pâíkaz?
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_wer_09_01"); //Mùj šéf. Je to nebezpeènej chlap. Znáš ho: je to Havran, jeden z bejvalejch rudobaronù ze Starýho tábora v Hornickým údolí.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_wer_09_02"); //Potâebuje ty lidi pro svý plány. Víc vêdêt nepotâebuješ.

	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "Havran a nebezpeèný? No jo...", DIA_Addon_Dexter_missingPeople_Raven );
	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "Rudobaron? A tady v Khorinidu?", DIA_Addon_Dexter_missingPeople_RavenTot );
		 
};
func void DIA_Addon_Dexter_missingPeople_Raven ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_Raven_15_00"); //Havran a nebezpeènej? Ale no tak...
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_01"); //(naštvanê) Co TY o tom mùžeš vêdêt? Neznáš ho tak jako já!
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_02"); //(nejistê) Už tehdá to bejvala hnusná svinê, ale dneska...
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_03"); //Od pádu bariéry se zmênil. Má na tváâi takovej èernej stín.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_04"); //(ustrašenê) Když se mu dýl díváš do oèí, máš pocit, jako by do tebe zatínal spáry nêjakej dravec.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_05"); //Mùžu ti poradit jediný: co nejrychlejc vypadni z Khorinidu, než bude pozdê.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_06"); //(zasmušile) Tady nemáš co pohledávat. Pokud teda nehledáš jistou smrt.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Dexter nejednal na vlastní pêst, ale mêl nêjakého klienta. Jmenuje se Havran a je to bývalý rudobaron. To on nejspíš vêzí za všemi têmi únosy. Teë o tom ale potâebuji získat dùkaz."); 

	Info_ClearChoices	(DIA_Addon_Dexter_missingPeople);
};
func void DIA_Addon_Dexter_missingPeople_RavenTot ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_RavenTot_15_00"); //Rudobaron? Tady v Khorinidu?
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_RavenTot_09_01"); //Už není rudobaronem. Má svý vlastní plány a Khorinis to za chvíli pozná taky.
};

///////////////////////////////////////////////////////////////////////
//	Info Boss
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_Boss		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	3;
	condition	 = 	DIA_Addon_Dexter_Boss_Condition;
	information	 = 	DIA_Addon_Dexter_Boss_Info;

	description	 = 	"Tvùj šéf? A co je zaè?";
};

func int DIA_Addon_Dexter_Boss_Condition ()
{
	if (Knows_Dexter == TRUE)
	&& (SC_KnowsDexterAsKidnapper == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Dexter_Boss_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_Boss_15_00"); //Tvùj šéf? A kdo to je?
	AI_Output	(self, other, "DIA_Addon_Dexter_Boss_09_01"); //(smêje se) To bys chtêl vêdêt, co? To si dokážu pâedstavit.
	AI_Output	(self, other, "DIA_Addon_Dexter_Boss_09_02"); //(vážnê) Ale nevidím jedinej dùvod, proè bych ti to mêl vykládat.
};

// ************************************************************
// 			Vor 
// ************************************************************
INSTANCE DIA_Dexter_Vor   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 5;
	condition   = DIA_Dexter_Vor_Condition;
	information = DIA_Dexter_Vor_Info;
	permanent   = FALSE;
	description = "A co teë udêláš? Zabiješ mê?";
};
FUNC INT DIA_Dexter_Vor_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Dexter_missingPeople))
		{
			return TRUE;
		};
};
FUNC VOID DIA_Dexter_Vor_Info()
{
	AI_Output (other, self, "DIA_Dexter_Vor_15_00");//A co máš teë v úmyslu? Zabít mê?
	AI_Output (self, other, "DIA_Dexter_Vor_09_01");//Jo. Ale tys nás odtamtud všechny dostal. Proto ti taky dám ještê jednu šanci. Zmizni, vypaâ se, udêlej se neviditelným. Jdi a už se mi nikdy nepâipleã do cesty.
	AI_Output (other, self, "DIA_Addon_Dexter_Vor_15_00");//Musím vêdêt, kam jsi ty lidi odvlekl.
	AI_Output (self, other, "DIA_Addon_Dexter_Vor_09_01");//(smêje se) No, tak to ze mê zkus vymlátit.
	AI_Output (self, other, "DIA_Addon_Dexter_Vor_09_02");//(hrozivê) Radši bys teë mêl jít.
	AI_Output (self, other, "DIA_Dexter_Vor_09_02");//Jestli tê tu ještê nêkdy uvidím, bez rozpakù tê zabiju.
	Dexter_NoMoreSmallTalk = TRUE;
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			Kill
// ************************************************************
INSTANCE DIA_Dexter_Kill   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 2;
	condition   = DIA_Dexter_Kill_Condition;
	information = DIA_Dexter_Kill_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Dexter_Kill_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& ((Dexter_NoMoreSmallTalk == TRUE)
	|| (Knows_Dexter == FALSE)) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Kill_Info()
{
	if (Knows_Dexter == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Dexter_Add_09_02"); //Âek sis o to.
	}
	else
	{
		AI_Output (self, other, "DIA_Dexter_Kill_09_01");//Ach jo, chlape. Udêlal bys líp, kdyby ses tu neukazoval. Jsi ve špatnou chvíli na špatnym místê.
	};
	
	MIS_Steckbriefe = LOG_OBSOLETE;
	B_CheckLog();
	B_Greg_ComesToDexter ();
	Info_ClearChoices	(DIA_Dexter_Kill);
	Info_AddChoice	(DIA_Dexter_Kill, DIALOG_ENDE, DIA_Dexter_Kill_ENDE );
};
func void DIA_Dexter_Kill_ENDE ()
{
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
	var C_ITEM itm;
	itm = Npc_GetEquippedArmor(Greg_NW);

	if (Hlp_IsItem(itm, ITAR_PIR_H_Addon) == FALSE)
	{
		AI_EquipArmor	(Greg_NW, ITAR_PIR_H_Addon);	
	};
};


// ************************************************************
// 			Mein Kopf? 
// ************************************************************
INSTANCE DIA_Dexter_Kopf (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 5;
	condition   = DIA_Dexter_Kopf_Condition;
	information = DIA_Dexter_Kopf_Info;
	permanent   = FALSE;
	description = "Chceš mou hlavu? Tak si pro ni pojë!";
};
FUNC INT DIA_Dexter_Kopf_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Dexter_Hallo))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Kopf_Info()
{
	AI_Output (other, self, "DIA_Addon_Dexter_Add_15_00"); //Chceš mojí hlavu? No tak si pro ni pojë!
	AI_Output (self, other, "DIA_Addon_Dexter_Add_09_01"); //Jestli si to fakt pâeješ.

	DIA_Dexter_Kill_ENDE();
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Dexter_PICKPOCKET (C_INFO)
{
	npc			= BDT_1060_Dexter;
	nr			= 900;
	condition	= DIA_Dexter_PICKPOCKET_Condition;
	information	= DIA_Dexter_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Dexter_PICKPOCKET_Condition()
{
	C_Beklauen (96, 370);
};
 
FUNC VOID DIA_Dexter_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Dexter_PICKPOCKET);
	Info_AddChoice		(DIA_Dexter_PICKPOCKET, DIALOG_BACK 		,DIA_Dexter_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Dexter_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Dexter_PICKPOCKET_DoIt);
};

func void DIA_Dexter_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Dexter_PICKPOCKET);
};
	
func void DIA_Dexter_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Dexter_PICKPOCKET);
};





/*
// ************************************************************
// 			Wo
// ************************************************************
INSTANCE DIA_Dexter_Wo   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 3;
	condition   = DIA_Dexter_Wo_Condition;
	information = DIA_Dexter_Wo_Info;
	permanent   = FALSE;
	description = "Wo finde ich diesen Mann?";
};
FUNC INT DIA_Dexter_Wo_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Dexter_Glaube) == FALSE)
	&& (Knows_Dexter == TRUE)
	&& (Bdt13_Dexter_verraten == TRUE) 
	&& (Ranger_SCKnowsDexter == FALSE)
	&& (SC_KnowsDexterAsKidnapper == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Wo_Info()
{
	AI_Output (other, self, "DIA_Dexter_Wo_15_00");//Wo finde ich diesen Mann?
	
	if (Kapitel < 3)
	{
		AI_Output (self, other, "DIA_Dexter_Wo_09_01");//Ich glaube, der sitzt irgendwo im Minental.
	}
	else
	{
		AI_Output (self, other, "DIA_Dexter_Wo_09_02");//Der Typ ist hier! Und nicht alleine. Da ist ein ganzer Haufen dieser Kerle überall unterwegs! Und die suchen dich.
	};
};
*/

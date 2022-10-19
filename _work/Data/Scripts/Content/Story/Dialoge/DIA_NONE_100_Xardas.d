// ************************************************************
// 			  				FIRST EXIT 
// ************************************************************

INSTANCE DIA_Xardas_FirstEXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_FirstEXIT_Condition;
	information	= DIA_Xardas_FirstEXIT_Info;
	permanent	= FALSE;
	description = "Vyrazím hned, jak budu moci! (KONEC)";
};
                       
FUNC INT DIA_Xardas_FirstEXIT_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Xardas_FirstEXIT_Info()
{	
	AI_Output (other, self,"DIA_Xardas_FirstEXIT_15_00"); //Vyrazím hned, jak budu moci!
	AI_Output (self, other,"DIA_Xardas_FirstEXIT_14_01"); //Dobrá! A ještê jedna vêc: neâíkej nikomu, že jsme spolu mluvili. Hlavnê to neâíkej žádnému mágovi.
	AI_Output (self, other,"DIA_Xardas_FirstEXIT_14_02"); //Co jsem odešel, považují mê mágové ohnê za mrtvého - a to se mùže docela hodit.
	
	AI_StopProcessInfos	(self);
	
	B_Kapitelwechsel (1, NEWWORLD_ZEN);	//Joly: muß auf jeden Fall hier kommen. Allein schon wegen XP_AMBIENT!
	
	Npc_ExchangeRoutine (self,"START");
};

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Xardas_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_EXIT_Condition;
	information	= DIA_Xardas_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_EXIT_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
var int Addon_zuerst;
// ------------------------------------------------------------
instance DIA_Xardas_Hello (C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 1;
	condition	= DIA_Xardas_Hello_Condition;
	information	= DIA_Xardas_Hello_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       
FUNC INT DIA_Xardas_Hello_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Xardas_Hello_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_00"); //Tak už je to tu zas! (s úsmêvem) Nikdy jsem si nemyslel, že se my dva ještê nêkdy sejdeme.
	AI_Output (other, self, "DIA_Addon_Xardas_Hello_15_01"); //Mám pocit, jako bych strávil tâi nedêle pod hromadou balvanù.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_02"); //Taky že ano. Naživu tê udržela jenom magie ve tvé zbroji. 
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_03"); //Bál jsem se, že tê z trosek toho chrámu už nezachráním.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_04"); //Ale na tom už nezáleží. Teë jsi tady.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_05"); //Teë máme na krku NOVOU hrozbu.

 	Info_ClearChoices	(DIA_Xardas_Hello);
	Info_AddChoice	(DIA_Xardas_Hello, "Máme teë spoustu èasu. Spáè byl pâece poražen.", DIA_Addon_Xardas_Hello_Dragons );
	Info_AddChoice	(DIA_Xardas_Hello, "O jaké NOVÉ hrozbê to mluvíš?", DIA_Addon_Xardas_Hello_Man );
};
func void DIA_Addon_Xardas_Hello_Man ()
{
	PlayVideo ("Intro_ADDON");
	AI_Output (self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_10"); //Musíme se s nimi spojit! Pouze tak mùžeme Beliara zastavit!
	
	Addon_zuerst = TRUE;
};
func void DIA_Addon_Xardas_Hello_Dragons ()
{
	AI_Output (other,self ,"DIA_Xardas_Hello_15_03"); //Teë alespoà máme dost èasu. Postaral jsem se o to. Spáè...
	AI_Output (self ,other,"DIA_Xardas_Hello_14_04"); //...byl zapuzen. Porazil jsi ho, to je naprostá pravda - ale není v naší moci zastavit válku, která bude teë následovat.
	//AI_Output (other,self ,"DIA_Xardas_Hello_15_05"); //Du redest von den Orks?
	//AI_Output (self ,other,"DIA_Xardas_Hello_14_06"); //Ich rede von weitaus schlimmeren Kreaturen.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_07"); //Svým posledním zbêsilým skâekem vyslal Spáè na cestu armády temnot.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_08"); //Byl to rozkaz urèený všem zlým stvùrám. Mocné zaklínadlo, které nemohou neuposlechnout.
 	AI_Output (self ,other,"DIA_Xardas_Hello_14_09"); //Jeho poslední rozkaz byl: PÂIJËTE! A pâišli. Všichni. Dokonce i draci.
 	AI_Output (other,self ,"DIA_Xardas_Hello_15_10"); //(užasle) Draci!
	AI_Output (self ,other,"DIA_Xardas_Hello_14_11"); //Jsou to pradávná stvoâení nebývalé moci. Cítím jejich pâítomnost - dokonce i zde.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_12"); //Shromáždili kolem sebe celou armádu nižších stvùr, aby jim sloužily.
	AI_Output (other,self ,"DIA_Xardas_Hello_15_13"); //Kde je ta armáda teë?
	AI_Output (self ,other,"DIA_Xardas_Hello_14_14"); //Utáboâila se nedaleko odsud, v Hornickém údolí poblíž Khorinidu. Pomalu se pâipravuje k útoku.
		
	if (Addon_zuerst == TRUE)
	{
		AI_Output (self ,other,"DIA_Xardas_Hello_14_15"); //(zamyšlenê) Moc èasu nám nezbývá.
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Xardas_Hello_Dragons_14_06"); //Ale to ještê není všechno. Nedávno jsem se dozvêdêl ještê o DALŠÍ hrozbê.
		Info_ClearChoices	(DIA_Xardas_Hello);
		Info_AddChoice	(DIA_Xardas_Hello, "O jaké JINÉ hrozbê to mluvíš?", DIA_Addon_Xardas_Hello_Man );
	};
};
	
///////////////////////////////////////////////////////////////////////
//	Info AWAY
///////////////////////////////////////////////////////////////////////

instance DIA_Xardas_AWAY (C_INFO) 		//E1
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	2;
	condition	 = 	DIA_Xardas_AWAY_Condition;
	information	 = 	DIA_Xardas_AWAY_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Tak si pospêšme, abychom byli co nejrychleji pryè!";
};

func int DIA_Xardas_AWAY_Condition ()
{	
	if (!Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (!Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_AWAY_Info ()
{
	AI_Output (other, self, "DIA_Xardas_AWAY_15_00"); //Tak si pospêšme, abychom byli co nejrychleji pryè!
	AI_Output (self, other, "DIA_Xardas_AWAY_14_01"); //Pokud teë uteèeme, bude to znamenat jediné - budeme se muset drakùm postavit pozdêji.
	AI_Output (self, other, "DIA_Xardas_AWAY_14_02"); //S pomocí vojákù a mágù, kteâí žijí v têchto konèinách, bychom mohli jejich armádu zastavit dâív, než se úplnê zformuje.
	AI_Output (self, other, "DIA_Xardas_AWAY_14_03"); //Lepší šanci už nikdy mít nebudeme.
};

///////////////////////////////////////////////////////////////////////
//	Info TODO
///////////////////////////////////////////////////////////////////////

instance DIA_Xardas_TODO (C_INFO) 		//E1
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	1;
	condition	 = 	DIA_Xardas_TODO_Condition;
	information	 = 	DIA_Xardas_TODO_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Co budeme dêlat teë?";
};

func int DIA_Xardas_TODO_Condition ()
{	
	if (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_TODO_Info ()
{
	AI_Output (other, self, "DIA_Xardas_TODO_15_00"); //Co budeme dêlat?
	AI_Output (self, other, "DIA_Xardas_TODO_14_01"); //Tentokrát to sami nezvládneme. Proti têm drakùm nám mùže pomoci jen Innosova moc.
	AI_Output (self, other, "DIA_Xardas_TODO_14_02"); //Ve mêstê Khorinis sídlí skupina paladinù, je to nedaleko odsud.
	AI_Output (self, other, "DIA_Xardas_TODO_14_03"); //Mají mocný artefakt, který by nám mohl v boji proti drakùm hodnê pomoci.
	AI_Output (self, other, "DIA_Xardas_TODO_14_04"); //Âíkají mu Innosovo oko. Musíš ten artefakt za každou cenu získat.
	AI_Output (self, other, "DIA_Xardas_TODO_14_05"); //Vysvêtli paladinùm, jaké nebezpeèí nám hrozí. MUSÍŠ pâesvêdèit jejich vùdce, aby nám pomohl!
	AI_Output (self, other, "DIA_Addon_Xardas_Add_14_07"); //A až si s ním promluvíš, musíš najít Beliarùv artefakt.
	AI_Output (self, other, "DIA_Addon_Xardas_Add_14_08"); //Je protikladem Oka Innosova. Nesmí padnout do nesprávných rukou.
	Log_CreateTopic (TOPIC_INNOSEYE, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_INNOSEYE, LOG_RUNNING);
	B_LogEntry (TOPIC_INNOSEYE,"V Khorinidu se usadila skupina paladinù, kteâí opatrují mocný artefakt zvaný Innosovo oko, jenž nám mùže pomoci zahnat draèí hrozbu. Musím ty svaté bojovníky nêjak pâesvêdèit, aby se k nám pâidali."); 
};

///////////////////////////////////////////////////////////////////////
//	Info StonePlate
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Xardas_StonePlate		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Xardas_StonePlate_Condition;
	information	 = 	DIA_Addon_Xardas_StonePlate_Info;

	description	 = 	"Mùžeš mi âíct nêco o téhle kamenné tabulce?";
};
func int DIA_Addon_Xardas_StonePlate_Condition ()
{
	if (Npc_HasItems (other,ItWr_StonePlateCommon_Addon))
	{
		return TRUE;
	};
};
func void DIA_Addon_Xardas_StonePlate_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Xardas_StonePlate_15_00"); //Mùžeš mi nêco âíci o téhle kamenné tabulce?
	//AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_01"); //Ich habe so eine unten in der Höhlen vor meinem Turm gefunden.
	//AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_02"); //Sie sind in einer seltsam alten Sprache geschrieben, die ich in dieser Form noch nirgendwo gesehen habe.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_03"); //Napâed jsem ji považoval za magický artefakt, ale nakonec jsem došel k závêru, že není nijak zvlášã dùležitá.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_04"); //Úplnê jsem ji sice nerozluštil, ale podle všeho pojednává o historii nêjaké velmi staré kultury.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_05"); //Jestli tu tabulku chceš, tak si ji vezmi. Mnê k nièemu není.

	B_GivePlayerXP (XP_Ambient);
};


// ************************************************************
// ***														***
// 						Addon Report
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 						Portal entdeckt
// ------------------------------------------------------------
instance DIA_Addon_Xardas_Portal (C_INFO)
{
	npc		 	= NONE_100_Xardas;
	nr		 	= 1;
	condition	= DIA_Addon_Xardas_Portal_Condition;
	information	= DIA_Addon_Xardas_Portal_Info;

	description	= "Vodní mágové objevili portál, který vede do neznámé èásti ostrova...";
};

func int DIA_Addon_Xardas_Portal_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_WhatsOrnament))
	&& (!C_SCHasBeliarsWeapon())
	&& (Saturas_KlaueInsMeer == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_Portal_Info ()
{
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_00"); //Vodní mágové objevili portál do neznámé èásti ostrova...
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_01"); //Zajímavé...
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_02"); //Pokud objevíš nêco, co nám SKUTEÈNÊ k nêèemu bude, pak mi to urèitê oznam!
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_03"); //Ten Beliarùv artefakt musí být ukrytý nêkde tady. Najdi jej!
};

// ------------------------------------------------------------
// 						Nochmal wegen Portal
// ------------------------------------------------------------
instance DIA_Addon_Xardas_PortalAgain (C_INFO)
{
	npc		 	= NONE_100_Xardas;
	nr		 	= 1;
	condition	= DIA_Addon_Xardas_PortalAgain_Condition;
	information	= DIA_Addon_Xardas_PortalAgain_Info;
	permanent 	= TRUE;
	description	= "K té neznámé èásti ostrova...";
};

func int DIA_Addon_Xardas_PortalAgain_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Xardas_Portal))
	&& (!C_SCHasBeliarsWeapon())
	&& (Saturas_KlaueInsMeer == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_PortalAgain_Info ()
{
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_17"); //Co se týèe té neznámé èásti ostrova...
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_18"); //Neotravuj mê podrobnostmi. Vraã se, až najdeš nêco opravdu zajímavého.
};

// ------------------------------------------------------------
// 						Addon Success
// ------------------------------------------------------------
instance DIA_Addon_Xardas_AddonSuccess (C_INFO)
{
	npc		 	= NONE_100_Xardas;
	nr		 	= 1;
	condition	= DIA_Addon_Xardas_AddonSuccess_Condition;
	information	= DIA_Addon_Xardas_AddonSuccess_Info;

	description	= "Prozkoumal jsem tu neznámou èást ostrova...";
};

func int DIA_Addon_Xardas_AddonSuccess_Condition ()
{
	if (C_SCHasBeliarsWeapon())
	|| (Saturas_KlaueInsMeer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_AddonSuccess_Info ()
{
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_03"); //Prozkoumal jsem neznámou èást ostrova.
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_04"); //A co jsi tam objevil?
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_05"); //Všechno se toèilo kolem mocného artefaktu zvaného Beliarùv dráp.
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_06"); //Beliarùv dráp? A kde je? Máš jej s sebou?

	if (C_SCHasBeliarsWeapon())
	{
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_07"); //Ano, tady je.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_08"); //(chtivê) To je nesmírnê zajímavé.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_09"); //Tahle zbraà se nám mùže velice hodit. Ale zároveà je nesmírnê nebezpeèná.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_10"); //Buë opatrný! A hlavnê ji neztraã!
		B_GivePlayerXP (XP_Ambient*3);
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_11"); //Už ji nemám.
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_12"); //Dal jsem ji vodním mágùm, kteâí ji hodí do moâe...
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_13"); //(vztekle vykâikuje) Copak ses zbláznil? Máš vùbec ponêtí, èeho se vzdáváš?
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_14"); //Ta zbraà nám mohla velmi posloužit!
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_15"); //Myslím, že takhle to bude lepší.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_16"); //(povzdechne si) Cesty boží jsou nevyzpytatelné.
	};
};

// --------------------------------------------------------------------

///////////////////////////////////////////////////////////////////////
//	Info WEAPON
///////////////////////////////////////////////////////////////////////

instance DIA_Xardas_WEAPON (C_INFO)		//E1
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	5;
	condition	 = 	DIA_Xardas_WEAPON_Condition;
	information	 = 	DIA_Xardas_WEAPON_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Potâebuji zbranê.";
};

func int DIA_Xardas_WEAPON_Condition ()
{	
	if (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_WEAPON_Info ()
{
	AI_Output (other, self, "DIA_Xardas_WEAPON_15_00"); //Potâebuji zbranê.
	AI_Output (self, other, "DIA_Xardas_WEAPON_14_01"); //Mùžu ti dát jen to málo, co tady mám.
	AI_Output (self, other, "DIA_Xardas_WEAPON_14_02"); //Porozhlédni se po mé vêži. Vem si cokoliv, o èem budeš pâesvêdèen, že by se ti mohlo hodit.
};


///////////////////////////////////////////////////////////////////////
//	Info ARTEFAKT
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_ARTEFAKT (C_INFO)	//E2 nach TODO
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	2;
	condition	 = 	DIA_Xardas_ARTEFAKT_Condition;
	information	 = 	DIA_Xardas_ARTEFAKT_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Co pâesnê je to 'Innosovo oko'?";
};

func int DIA_Xardas_ARTEFAKT_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Xardas_TODO))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_ARTEFAKT_Info ()
{
	AI_Output (other, self, "DIA_Xardas_ARTEFAKT_15_00"); //Co pâesnê je to 'Innosovo oko'?
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_01"); //Je to amulet. Legenda vypráví, že do nêj vložil èást své síly sám Innos.
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_02"); //Obnoví èást tvé ztracené síly a pomùže nám porazit draky.
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_03"); //Má také další skryté schopnosti. O nich ti povím víc, až ho budeš mít u sebe.
};

///////////////////////////////////////////////////////////////////////
//	Info PALADIN
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_PALADIN	(C_INFO) //E2 nach TODO
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	3;
	condition	 = 	DIA_Xardas_PALADIN_Condition;
	information	 = 	DIA_Xardas_PALADIN_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Proè by mi mêli paladinové Innosovo oko dávat?";
};
func int DIA_Xardas_PALADIN_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};
func void DIA_Xardas_PALADIN_Info ()
{
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_00"); //Proè by mi mêli paladinové Innosovo oko dávat?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_01"); //Protože ty jsi ten, komu osud urèil, aby jej nosil.
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_02"); //Jak mùžeš vêdêt nêco takového?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_03"); //Mám hned nêkolik dùvodù si to myslet, ale nejdùležitêjší je ten, že jsi porazil Spáèe. Kdybys nebyl oblíbenec bohù, byl bys teë mrtvý.
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_04"); //Âeknême, že máš pravdu a že jsem vyvolený, abych nesl Innosovo oko. Jak ale paladinové poznají, že to je pravda?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_05"); //Oko samo si zvolí toho, kdo jej mùže mít. Jakmile se k nêmu dostaneš a nasadíš si ho, nebudou paladinové moci o tvých slovech dál pochybovat.
};
///////////////////////////////////////////////////////////////////////
//	Info Khorinis
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_Khorinis (C_INFO) //E2 nach TODO
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	4;
	condition	 = 	DIA_Xardas_Khorinis_Condition;
	information	 = 	DIA_Xardas_Khorinis_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Jak se dostanu do mêsta?";
};
func int DIA_Xardas_Khorinis_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (Lothar.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};
func void DIA_Xardas_Khorinis_Info ()
{
	AI_Output (other, self, "DIA_Xardas_Khorinis_15_00"); //Jak se dostanu do mêsta?
	AI_Output (self, other, "DIA_Xardas_Khorinis_14_01"); //Jdi po cestê vedoucí odsud skrz hory. Mêsto je velké. Nemùžeš ho minout.
	AI_Output (self, other, "DIA_Xardas_Khorinis_14_02"); //Ale dávej si pozor! Cesta do mêsta není úplnê bezpeèná. A ty nejsi zdaleka tak silný, jak jsi kdysi býval.
};
// ************************************************************
// 			  		Zum zweiten Mal bei Xardas
// ************************************************************

instance DIA_Xardas_WhereEx (C_INFO) //BACK AGAIN
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	6;
	condition	 = 	DIA_Xardas_WhereEx_Condition;
	information	 = 	DIA_Xardas_WhereEx_Info;
	permanent	 = 	FALSE;
	description	 = 	"Kde pâesnê to vlastnê jsme?";
};

func int DIA_Xardas_WhereEx_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_WhereEx_Info ()
{
	AI_Output (other, self, "DIA_Xardas_Add_15_00"); //A kde to vùbec jsme?
	AI_Output (self, other, "DIA_Xardas_Add_14_01"); //Jak jsem už âekl, poblíž mêsta Khorinis.
	AI_Output (self, other, "DIA_Xardas_Add_14_02"); //Postavil jsem si zde znovu svou vêž.
	AI_Output (other, self, "DIA_Xardas_Add_15_03"); //Ale vždyã je to jen pár dní, co jsme se naposledy vidêli v Hornickém údolí...
	AI_Output (self, other, "DIA_Xardas_Add_14_04"); //Služebníci, které jsem k obnovení své vêže povolal, odvedli dùkladnou práci...
	AI_Output (other, self, "DIA_Xardas_Add_15_05"); //Taky mám ten pocit.
};

instance DIA_Xardas_EQUIPMENT (C_INFO) //BACK AGAIN
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	7;
	condition	 = 	DIA_Xardas_EQUIPMENT_Condition;
	information	 = 	DIA_Xardas_EQUIPMENT_Info;
	permanent	 = 	FALSE;
	description	 = 	"Kde najdu lepší výbavu?";
};

func int DIA_Xardas_EQUIPMENT_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_WEAPON))
	&& (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_EQUIPMENT_Info ()
{
	AI_Output (other, self, "DIA_Xardas_EQUIPMENT_15_00"); //Kde najdu lepší výbavu?
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_01"); //Nejbližší místo, kde mùžeš najít lepší zbranê a brnêní, je mêsto Khorinis.
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_02"); //Ale dole v údolí mùžeš tu a tam najít léèivé bylinky, které ti pomohou, když budeš zranên v boji.
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_03"); //Vidíš to jezero hned pâed mou vêží? Od nêj vede do údolí tajná cesta.
};
///////////////////////////////////////////////////////////////////////
//	Info ABOUTLESTER
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_ABOUTLESTER		(C_INFO)
{	
	npc			 = 	NONE_100_Xardas;
	nr			 = 	5;
	condition	 = 	DIA_Xardas_ABOUTLESTER_Condition;
	information	 = 	DIA_Xardas_ABOUTLESTER_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mluvil jsi už s Lesterem?";
};
func int DIA_Xardas_ABOUTLESTER_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lester_SEND_XARDAS)
	&& (Npc_GetDistToWP  (Lester,"NW_XARDAS_TOWER_IN1_31") <= 500)) 
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Xardas_ABOUTLESTER_Info ()
{
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_00"); //Mluvil jsi už s Lesterem?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_01"); //Ano, zasypal jsem ho otázkami. Âekl mi toho hodnê, ale byl úplnê vyèerpaný.
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_02"); //Je vlastnê zázrak, že ten útêk vùbec pâežil. Poslal jsem jej, aã si odpoèine.
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_03"); //Co ti âekl?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_04"); //Bojím se, že nic dobrého. Nejen že vidêl draka, ale také muže v èerných kápích.
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_05"); //A?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_06"); //Pokud ti muži skuteènê existují, pâedstavuje jejich pâítomnost možnou hrozbu.
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_07"); //A to se mi moc nelíbí. Na, vezmi si mùj prsten. Ochrání tê pâed magií.
	
	B_GiveInvItems (self, other, ItRi_Prot_Mage_01,1);
	B_GivePlayerXP		(XP_Ambient);

};

// *************************************************************
// -------------------------------------------------------------
//						NACH erstem Exit !!!
// -------------------------------------------------------------
// ************************************************************				//x

///////////////////////////////////////////////////////////////////////
//	Bei Paladinen gewesen
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_FirstPal		(C_INFO)
{	
	npc			 = 	NONE_100_Xardas;
	nr			 = 	10;
	condition	 = 	DIA_Xardas_FirstPal_Condition;
	information	 = 	DIA_Xardas_FirstPal_Info;
	permanent	 = 	FALSE;
	description	 = 	"Byl jsem ve mêstê...";
};
func int DIA_Xardas_FirstPal_Condition ()
{	
	if (Lothar.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Xardas_FirstPal_Info ()
{
	AI_Output (other, self, "DIA_Xardas_FirstPal_15_00"); //Byl jsem ve mêstê.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_01"); //A? Podaâilo se ti promluvit si s vùdcem paladinù?
	AI_Output (other, self, "DIA_Xardas_FirstPal_15_02"); //Nepustili mê k nêmu.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_03"); //Nesmysl! Musí existovat zpùsob, jak se k nêmu dostat.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_04"); //Když selže všechno ostatní, vstup do kláštera a staà se mágem.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_05"); //Možná to je z morálního hlediska trošku pochybené, ale úèel svêtí prostâedky.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_06"); //Pokud budeš mágem, urèitê setkání s tebou neodmítne.
};

///////////////////////////////////////////////////////////////////////
//	Info Weiter (Perm)
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_Weiter		(C_INFO)
{	
	npc			 = 	NONE_100_Xardas;
	nr			 = 	99;
	condition	 = 	DIA_Xardas_Weiter_Condition;
	information	 = 	DIA_Xardas_Weiter_Info;
	permanent	 = 	TRUE;
	description	 = 	"Tak co udêláme teë?";
};
func int DIA_Xardas_Weiter_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Xardas_Weiter_Info ()
{
	AI_Output (other, self, "DIA_Xardas_Weiter_15_00"); //Tak co udêláme teë?
	AI_Output (self, other, "DIA_Xardas_Weiter_14_01"); //Budeme postupovat podle plánu. Jinak to nejde.
	AI_Output (self, other, "DIA_Xardas_Weiter_14_02"); //Ty bêž získat Innosovo oko a já budu hledat odpovêdi.
};

INSTANCE DIA_Xardas_KdfSecret (C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 9;
	condition	= DIA_Xardas_KdfSecret_Condition;
	information	= DIA_Xardas_KdfSecret_Info;
	permanent	= FALSE;
	description = "Proè by o tobê nemêl 'kruh ohnê' vêdêt?";
};                       

FUNC INT DIA_Xardas_KdfSecret_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Xardas_KdfSecret_Info()
{	
	AI_Output	(other, self,"DIA_Xardas_KdfSecret_15_00");	//Proè o tobê nemají mágové ohnê vêdêt?
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_01");	//Býval jsem vysoko postavený èlen kruhu. Už tenkrát jsem mêl podezâení, že klíèem k magické bariéâe by mohla být magie démonù.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_02"); //Nikdy se mi však nepodaâilo pâesvêdèit ostatní èleny kruhu, aby sledovali tuhle stopu.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_03"); //Opustil jsem tedy kruh, abych mohl studovat èerná umêní.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_04"); //A to je zloèin, pro který ohniví mágové, (jízlivê) 'Innosovi služebníci', vždy 'Dobâí' a 'Ctnostní', nikdy nepâijmou žádnou omluvu.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_05"); //Jsou si jisti, že jsem stále naživu, ale vùbec netuší, kde mê hledat - a to je jedinê dobâe.
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

INSTANCE DIA_Xardas_KAP3_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP3_EXIT_Condition;
	information	= DIA_Xardas_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BackFromOW
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_BACKFROMOW		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	31;
	condition	 = 	DIA_Xardas_BACKFROMOW_Condition;
	information	 = 	DIA_Xardas_BACKFROMOW_Info;

	description	 = 	"Vrátil jsem se z Hornického údolí.";
};

func int DIA_Xardas_BACKFROMOW_Condition ()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_BACKFROMOW_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_00"); //Vrátil jsem se z Hornického údolí.
	AI_Output			(self, other, "DIA_Xardas_BACKFROMOW_14_01"); //Už bylo naèase. Co jsi vidêl?
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_02"); //Mêl jsi pravdu. Celá zemê se hemží nepâátelskou armádou.
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_03"); //Skâeti obléhají hrad a draci zpustošili celý kraj.
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_04"); //Jestli se nepletu, tak nebude dlouho trvat a zaútoèí na Khorinis.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info DmtSindDa
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_DMTSINDDA		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	32;
	condition	 = 	DIA_Xardas_DMTSINDDA_Condition;
	information	 = 	DIA_Xardas_DMTSINDDA_Info;

	description	 = 	"Co se to tu proboha stalo?";
};

func int DIA_Xardas_DMTSINDDA_Condition ()
{
	if (Kapitel == 3)	
		&& (Npc_KnowsInfo(other, DIA_Xardas_BACKFROMOW))
	{
		return TRUE;
	};
};

func void DIA_Xardas_DMTSINDDA_Info ()
{

 	if (Npc_KnowsInfo(other, DIA_Lester_BACKINTOWN))
	{
		AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_15_00"); //Lester âíkal, že mê chceš okamžitê vidêt.
	};
	
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_15_01"); //Co se to tu proboha stalo?
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_02"); //Nepâítel se dozvêdêl, kdo ve skuteènosti jsi, a chce se zmocnit Innosova oka.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_03"); //Zjistil, jaká hrozba se na nêj žene. Donutilo ho to opustit úkryt a pâejít do útoku.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_04"); //Je konec hry na schovávanou. Ještê vèera nikdo nevêdêl, jak bude nepâátelský útok vypadat. Teë je to nad slunce jasné.

	B_LogEntry (TOPIC_INNOSEYE, "Nepâítel se dozvêdêl, že hledám Innosovo oko. Je naèase je získat, než bude pâíliš pozdê.");
	
	Info_ClearChoices	(DIA_Xardas_DMTSINDDA);
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "Zaútoèili na mê nêjací mágové v èerných hábitech.", DIA_Xardas_DMTSINDDA_DMT );
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "Koneènê jsem získal dùkaz pro lorda Hagena.", DIA_Xardas_DMTSINDDA_Beweis );

};

func void DIA_Xardas_DMTSINDDA_DMT ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_DMT_15_00"); //Zaútoèili na mê mágové v èerných róbách.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_01"); //Nepâítel má mnoho podob. Pátraèi jsou jednou z nich. Oni jsou têmi, kdo pâipravuje pùdu pro nepâítele.
 	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_02"); //Zaujali pozice na strategických místech a teë jen èekají na vhodnou pâíležitost, aby spustili past.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_03"); //Vyhýbej se jim. Jsou to mocná magická stvoâení a pokusí se tê odstranit z cesty za každou cenu.
	
	if (hero.guild == GIL_KDF)
	{
	Log_CreateTopic (TOPIC_DEMENTOREN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DEMENTOREN, LOG_RUNNING);
	B_LogEntry (TOPIC_DEMENTOREN,"Xardas ty èernê odêné mágy zná. Pátraèi jsou pravdêpodobnê tím, kdo naše nepâátele ovládá. Jsou nesmírnê nebezpeèní."); 
	};
};

func void DIA_Xardas_DMTSINDDA_Beweis ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_Beweis_15_00"); //Koneènê mám dùkaz, který po mnê lord Hagen chtêl.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_Beweis_14_01"); //Co je to za dùkaz?
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_Beweis_15_02"); //Dostal jsem dopis od Garonda, velitele paladinù z Hornického údolí. Žádá v nêm o posily.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_Beweis_14_03"); //To by snad mêlo toho bojechtivého politika pâesvêdèit. Dobrá práce.
	
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "Co udêláme teë?", DIA_Xardas_DMTSINDDA_DMT_WhatToDo );
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Xardas_DMTSINDDA_DMT_WhatToDo ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_15_00"); //Co udêláme teë?
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_01"); //Jdi a dones lordu Hagenovi dopis od Garonda, mêl by ti umožnit pâístup k Innosovu oku.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_02"); //Pak bêž do kláštera a promluv si s Pyrokarem. Bude ti muset Oko dát.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_03"); //Nic není dùležitêjšího než dostat ten artefakt do bezpeèí.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_04"); //Teë bêž, dokud není pozdê. I nepâítel se ho urèitê pokusí získat.
	B_LogEntry (TOPIC_INNOSEYE, "Oko se nachází v kláštere mágù ohnê. Doufejme, že mi tam lord Hagen nyní dovolí vejít, když jsem mu pâedal zprávu od lorda Garonda. Hlavní mág Pyrokar mê totiž bez Hagenova svolení k amuletu vùbec nepustí.");
};

///////////////////////////////////////////////////////////////////////
//	Info InnosEyeBroken
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_INNOSEYEBROKEN		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	33;
	condition	 = 	DIA_Xardas_INNOSEYEBROKEN_Condition;
	information	 = 	DIA_Xardas_INNOSEYEBROKEN_Info;

	description	 = 	"Innosovo oko bylo znièeno.";
};

func int DIA_Xardas_INNOSEYEBROKEN_Condition ()
{
	if (Kapitel == 3)
		&& (Npc_KnowsInfo(other, DIA_Xardas_DMTSINDDA))
		&& ((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || 	(MIS_SCKnowsInnosEyeIsBroken  == TRUE))	
	{
		return TRUE;
	};
};

func void DIA_Xardas_INNOSEYEBROKEN_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_15_00"); //Innosovo oko bylo znièeno.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_14_01"); //Co to âíkáš? Znièeno!
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_15_02"); //Tohle jsem našel nahoâe v severních lesích - bohužel se mi podaâilo získat už jen jeho úlomky.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_14_03"); //Byla to naše jediná nadêje, jak obstát v boji s draky. Teë je v nenávratnu. Selhali jsme.

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Xardas_INNOSEYEBROKEN);
	Info_AddChoice	(DIA_Xardas_INNOSEYEBROKEN, "Co teë?", DIA_Xardas_INNOSEYEBROKEN_wasnun );


};
func void DIA_Xardas_INNOSEYEBROKEN_wasnun ()
{
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_wasnun_15_00"); //Co teë?
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_wasnun_14_01"); //To je bolestná zpráva. Musíme se sami v téhle situaci zorientovat. Zkusím najít nêjaké âešení.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_wasnun_14_02"); //Mezitím bys mêl zajít do mêsta a promluvit si s vodním mágem Vatrasem. Je možné, že bude vêdêt, co by mêlo být udêláno.

	B_LogEntry (TOPIC_INNOSEYE, "Zpráva o znièení Oka Innosova Xardase rozhodnê nepotêšila. Naší jedinou nadêjí je nyní mág vody jménem Vatras, který sídlí ve mêstê Khorinidu.");

	MIS_Xardas_GoToVatrasInnoseye = LOG_RUNNING;
};


///////////////////////////////////////////////////////////////////////
//	Info RitualRequest
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_RITUALREQUEST		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	34;
	condition	 = 	DIA_Xardas_RITUALREQUEST_Condition;
	information	 = 	DIA_Xardas_RITUALREQUEST_Info;

	description	 = 	"Posílá mê za tebou Vatras.";
};

func int DIA_Xardas_RITUALREQUEST_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Npc_KnowsInfo(other, DIA_Xardas_INNOSEYEBROKEN))
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_RITUALREQUEST_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_00"); //Posílá mê za tebou Vatras.
	AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_01"); //To je dobâe. Co âekl?
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_02"); //Povídal nêco o obráceném rituálu ve sluneèním kruhu.
	AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_03"); //(zasmêje se) Ten starý pekelník. Myslím, že vím, co má za lubem. Pâišel jsi, abys mê dostal k nêmu.
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_04"); //Vypadá to tak. Kdy vyrazíš na cestu?

	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_DJG)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_05"); //Nesmím nechat Vatrase èekat. Okamžitê se vydám na cestu. Splà, co musíš, a pak se ke mnê znovu pâidej.
		AI_StopProcessInfos (self);
		B_LogEntry (TOPIC_INNOSEYE, "Xardas souhlasil, že se zúèastní rituálu kruhu Slunce.");
		B_GivePlayerXP (XP_Ambient);
		Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair");
		Xardas_GoesToRitualInnosEye = TRUE; 
	}
	else
	{
		AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_06"); //Zúèastním se rituálu až ve chvíli, kdy si budu jist, že jsi plnê pâipraven utkat se s draky.
	};	
	B_GivePlayerXP (XP_Ambient);

};


///////////////////////////////////////////////////////////////////////
//	Info warumnichtjetzt
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_WARUMNICHTJETZT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	34;
	condition	 = 	DIA_Xardas_WARUMNICHTJETZT_Condition;
	information	 = 	DIA_Xardas_WARUMNICHTJETZT_Info;

	description	 = 	"Proè nejdeš za Vatrasem HNED?";
};

func int DIA_Xardas_WARUMNICHTJETZT_Condition ()
{
	if  (Npc_KnowsInfo(other, DIA_Xardas_RITUALREQUEST))
	&&	(Xardas_GoesToRitualInnosEye == FALSE)
	&& 	((hero.guild == GIL_MIL)
	|| 	 (hero.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Xardas_WARUMNICHTJETZT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_15_00"); //Proè nejdeš za Vatrasem HNED?
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_15_01"); //Nêkdy ti prostê nerozumím.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_14_02"); //(rozzlobenê) Nemluv se mnou tímto tónem. Nebýt MÊ, tvoje bídné têlo by ještê hnilo v tom chrámu.

	Info_AddChoice	(DIA_Xardas_WARUMNICHTJETZT, "Co se dá dêlat. Alespoà mi âekni, co bych mêl udêlat.", DIA_Xardas_WARUMNICHTJETZT_wastun );
	Info_AddChoice	(DIA_Xardas_WARUMNICHTJETZT, "Tak mi alespoà vysvêtli, proè váháš.", DIA_Xardas_WARUMNICHTJETZT_grund );
};
func void DIA_Xardas_WARUMNICHTJETZT_grund ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_grund_15_00"); //Tak mi alespoà vysvêtli, proè váháš.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_01"); //Od chvíle, kdy jsem opustil ohnivé mágy, jsem se jim držel co možná z cesty.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_02"); //A na tom nehodlám nic mênit, ledaže bych nemêl na vybranou.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_03"); //Ale než se vystavím vyèítavým pohledùm ostatních mágù, chci mít jistotu, že máš proti drakùm alespoà nêjakou šanci.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_04"); //S tím svým ošuntêlým vybavením se ale moc daleko nedostaneš. Vraã se, až budeš dostateènê silný.
  	AI_StopProcessInfos (self);
};

func void DIA_Xardas_WARUMNICHTJETZT_wastun  ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_wastun_15_00"); //Co se dá dêlat. Alespoà mi âekni, co bych mêl udêlat.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_wastun_14_01"); //Na boj s draky jsi poâád pâíliš slabý. S touhle výbavou nemáš vùbec žádnou šanci.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_wastun_14_02"); //Nevracej se, dokud nebudeš lépe pâipraven. Pak se vydám za Vatrasem.
 	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info bereit
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_BEREIT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	condition	 = 	DIA_Xardas_BEREIT_Condition;
	information	 = 	DIA_Xardas_BEREIT_Info;

	description	 = 	"Jsem pâipraven bojovat s draky.";
};

func int DIA_Xardas_BEREIT_Condition ()
{
	if  (Xardas_GoesToRitualInnosEye == FALSE)
	&& 	(Npc_KnowsInfo(other, DIA_Xardas_RITUALREQUEST))	
	&&	((hero.guild == GIL_DJG)
	||   (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Xardas_BEREIT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_BEREIT_15_00"); //Jsem pâipraven bojovat s draky.
	AI_Output			(self, other, "DIA_Xardas_BEREIT_14_01"); //V tom pâípadê už nemùžeme plýtvat èasem. Okamžitê se vydám do sluneèního kruhu. Splà, co musíš. Setkáme se tam.
	AI_StopProcessInfos (self);
	B_LogEntry (TOPIC_INNOSEYE, "Xardas souhlasil, že se zúèastní rituálu kruhu Slunce.");
	B_GivePlayerXP (XP_Ambient);
	Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair"); 
	Xardas_GoesToRitualInnosEye = TRUE; 
};

///////////////////////////////////////////////////////////////////////
//	Info bingespannt
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_BINGESPANNT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	35;
	condition	 = 	DIA_Xardas_BINGESPANNT_Condition;
	information	 = 	DIA_Xardas_BINGESPANNT_Info;
	permanent	 = 	TRUE;

	description	 = 	"Bude rituál zvratu fungovat?";
};

func int DIA_Xardas_BINGESPANNT_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Kapitel == 3)
		&& 	(Xardas_GoesToRitualInnosEye == TRUE)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_BINGESPANNT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_BINGESPANNT_15_00"); //Bude obrácený rituál fungovat?
	AI_Output			(self, other, "DIA_Xardas_BINGESPANNT_14_01"); //To nemùžu vêdêt najisto. Záleží to na tom, co pâesnê chce Vatras udêlat.
};

///////////////////////////////////////////////////////////////////////
//	Info PyroWillNicht
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_PYROWILLNICHT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	37;
	condition	 = 	DIA_Xardas_PYROWILLNICHT_Condition;
	information	 = 	DIA_Xardas_PYROWILLNICHT_Info;

	description	 = 	"Pyrokar se odmítá zúèastnit rituálu.";
};

func int DIA_Xardas_PYROWILLNICHT_Condition ()
{
	if (Pyrokar_DeniesInnosEyeRitual == TRUE)
		&& (Npc_KnowsInfo(other, DIA_Xardas_RITUALREQUEST))
		&& (Kapitel == 3)
		{
				return TRUE;
		};
};

func void DIA_Xardas_PYROWILLNICHT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_00"); //Pyrokar odmítá zúèastnit se rituálu.
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_01"); //Pâedevším chce dùkaz, že ti mùže vêâit.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_02"); //No ano. Pyrokar. Velice zajímavé.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_03"); //Z toho starocha se stává docela mrzout. Ale myslím, že pro tebe mám nêco užiteèného.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_04"); //Když jsem kdysi opouštêl âád ohnivých mágù, vzal jsem si z kláštera pár vêcí.
	//AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_05"); //Jetzt, da ich meinen Turm so nahe der Stadt errichtet habe, muss ich ständig damit rechnen, dass jemand hierher kommt, um danach zu suchen.
	//"hier" passt nicht, weil Xardas am Steinkreis stehen könnte - Satz ist eh überflüssig
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_06"); //Nechtêl jsem, aby náhodou pâišla skupina paladinù nebo ohnivých mágù, prohledali vêž skrz naskrz a ty vêci našli.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_07"); //Tak jsem je schoval na bezpeèná místa, kde by je mágové urèitê nikdy nehledali.
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_08"); //A kde?
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_09"); //Nêkteré z nich jsou zamèené v truhle na Sekobovê farmê.
	Sekob_RoomFree = TRUE;
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_10"); //Tomu Sekobovi vêâíš?
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_11"); //Ne. Ale je možné ho koupit a neklade žádné ošidné otázky. Ta truhla je navíc zamèená. Tady máš klíè.

	CreateInvItems 		(self, ItKe_CHEST_SEKOB_XARDASBOOK_MIS, 1);					
	B_GiveInvItems 		(self, other, ItKe_CHEST_SEKOB_XARDASBOOK_MIS,1);

	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_12"); //Mezi têmi vêcmi je jedna velice stará kniha. Až ji Pyrokar spatâí, bude vêdêt, že pochází ode mê.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_13"); //Už mi není k nièemu. Ale âekl bych, že k tomuhle úkolu by se mohla docela dobâe hodit.
	B_LogEntry (TOPIC_INNOSEYE, "Xardas mi dal klíè od truhlice na Sekobovê statku. Knihu, kterou uvnitâ najdu, mám zanést Pyrokarovi.");
};


///////////////////////////////////////////////////////////////////////
//	Info RitualInnosEyeRepairImportant
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_RitualInnosEyeRepairImportant		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	36;
	condition	 = 	DIA_Xardas_RitualInnosEyeRepairImportant_Condition;
	information	 = 	DIA_Xardas_RitualInnosEyeRepairImportant_Info;
	important	 = 	TRUE;

};

func int DIA_Xardas_RitualInnosEyeRepairImportant_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_RitualInnosEyeRepairImportant_Info ()
{
	AI_Output (self, other, "DIA_Xardas_Add_14_06"); //Teë, když je Innosovo oko opraveno, se musíš postavit drakùm!
	AI_Output (self, other, "DIA_Xardas_Add_14_07"); //Všichni slouží Beliarovi, bohu temnot.
	AI_Output (self, other, "DIA_Xardas_Add_14_08"); //Musí ale existovat nêjaká pozemská síla, která je ovládá. To je mi jasné.
	AI_Output (self, other, "DIA_Xardas_Add_14_09"); //Zjisti, co za sílu je ovládá.
	AI_Output (self, other, "DIA_Xardas_Add_14_10"); //Vraã se sem, jakmile to zjistíš!
	
	Info_ClearChoices	(DIA_Xardas_RitualInnosEyeRepairImportant);
	Info_AddChoice	(DIA_Xardas_RitualInnosEyeRepairImportant, DIALOG_ENDE, DIA_Xardas_RitualInnosEyeRepairImportant_weiter );

};		

 func void DIA_Xardas_RitualInnosEyeRepairImportant_weiter()
 {
	AI_StopProcessInfos (self);
	B_StartOtherRoutine (Xardas,"Zaèít");
  	B_StartOtherRoutine	(Vatras,"Zaèít");

 };

///////////////////////////////////////////////////////////////////////
//	Info wasnun
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_WASNUN		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	36;
	condition	 = 	DIA_Xardas_WASNUN_Condition;
	information	 = 	DIA_Xardas_WASNUN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Innosovo oko je uzdraveno. Co dál?";
};

func int DIA_Xardas_WASNUN_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_WASNUN_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_WASNUN_15_00"); //Innosovo oko je opraveno. Co dál?
	AI_Output			(self, other, "DIA_Xardas_WASNUN_14_01"); //Nezapomeà ho mít na sobê, až budeš stát drakùm tváâí v tváâ.

	if (MIS_ReadyforChapter4 == TRUE)
	{
		AI_Output			(self, other, "DIA_Xardas_WASNUN_14_02"); //Neztrácej èas. Bêž do Hornického údolí a zabij ty draky.
	}
	else
	{
		AI_Output			(self, other, "DIA_Xardas_WASNUN_14_03"); //Jdi za Pyrokarem, aã ti vysvêtlí, jak Oko používat.
	};
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

INSTANCE DIA_Xardas_KAP4_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP4_EXIT_Condition;
	information	= DIA_Xardas_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info perm4
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_PERM4		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	40;
	condition	 = 	DIA_Xardas_PERM4_Condition;
	information	 = 	DIA_Xardas_PERM4_Info;
	permanent	 = 	TRUE;

	description	 = 	"Co je nového?";
};

func int DIA_Xardas_PERM4_Condition ()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_PERM4_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_PERM4_15_00"); //Co je nového?
	AI_Output			(self, other, "DIA_Xardas_PERM4_14_01"); //Pátraèi ještê neodešli. Nedají si pokoje, dokud tê nedostanou.
	AI_Output			(self, other, "DIA_Xardas_PERM4_14_02"); //Zabij draky v Hornickém údolí a zjisti, kdo za têmi útoky stojí. Jinak bude jejich síla neustále narùstat.

};


//#####################################################################
//##
//##
//##							KAPITEL 5 //Xardas ist weg!!
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Xardas_KAP5_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP5_EXIT_Condition;
	information	= DIA_Xardas_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6 //Xardas ist auf der Dracheninsel ->neue Instanz!!!
//##
//##
//#####################################################################



INSTANCE DIA_Xardas_KAP6_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP6_EXIT_Condition;
	information	= DIA_Xardas_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




























































// ************************************************************
// 			  				 Exit 
// ************************************************************
INSTANCE DIA_Addon_AlligatorJack_Exit(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 999;
	condition	= DIA_Addon_AlligatorJack_Exit_Condition;
	information	= DIA_Addon_AlligatorJack_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_AlligatorJack_Exit_Condition()
{
	return TRUE;	
};
var int DIA_Addon_AlligatorJack_Exit_Info_OneTime;
FUNC VOID DIA_Addon_AlligatorJack_Exit_Info()
{	
	
	if (MIS_KrokoJagd == LOG_SUCCESS)
	&& (DIA_Addon_AlligatorJack_Exit_Info_OneTime == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_Exit_12_00"); //Kdybys mê hledal, tak vobvykle bejvám ve svým táboâe naproti palisádê.
	
		if (PIR_1354_Addon_Henry.aivar [AIV_TalkedToPlayer] == FALSE)
		{
			AI_Output (other ,self,"DIA_Addon_AlligatorJack_Exit_15_01"); //Jaké palisádê?
			AI_Output (self ,other,"DIA_Addon_AlligatorJack_Exit_12_02"); //Prostê vodsuë pokraèuj na západ a uvidíš, co myslím.
		};
		
		AI_StopProcessInfos	(self);
		Npc_ExchangeRoutine (self, "START");
		
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		DIA_Addon_AlligatorJack_Exit_Info_OneTime = TRUE;
	};
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_AlligatorJack_PICKPOCKET (C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 900;
	condition	= DIA_Addon_AlligatorJack_PICKPOCKET_Condition;
	information	= DIA_Addon_AlligatorJack_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Addon_AlligatorJack_PICKPOCKET_Condition()
{
	C_Beklauen (100, 333);
};
 
FUNC VOID DIA_Addon_AlligatorJack_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_AlligatorJack_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_AlligatorJack_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_AlligatorJack_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_AlligatorJack_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_AlligatorJack_PICKPOCKET_DoIt);
};

func void DIA_Addon_AlligatorJack_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_AlligatorJack_PICKPOCKET);
};
	
func void DIA_Addon_AlligatorJack_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_AlligatorJack_PICKPOCKET);
};
// ************************************************************
// 			  		Hello
// ************************************************************
INSTANCE DIA_Addon_AlligatorJack_Hello(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 5;
	condition	= DIA_Addon_AlligatorJack_Hello_Condition;
	information	= DIA_Addon_AlligatorJack_Hello_Info;
	permanent	= FALSE;
	Important	= TRUE;
};                       
FUNC INT DIA_Addon_AlligatorJack_Hello_Condition()
{
	if (GregIsBack == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_AlligatorJack_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Hello_12_00"); //Kdo pro všecko na svêtê SEŠ? Nevypadáš jak vostatní.
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_Hello_15_01"); //Jací ostatní?
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Hello_12_02"); //No, mágové, co se poâád potulujou kolem têchhle rozvalin.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Hello_12_03"); //Ty k nim taky patâíš?
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Hello_12_04"); //To máš vodvahu, že se tu procházíš jen tak.
};

///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_WerBistDu		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_WerBistDu_Condition;
	information	 = 	DIA_Addon_AlligatorJack_WerBistDu_Info;

	description	 = 	"Kdo jsi?";
};

func int DIA_Addon_AlligatorJack_WerBistDu_Condition ()
{
	return TRUE;
};

func void DIA_Addon_AlligatorJack_WerBistDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_WerBistDu_15_00"); //Kdo jsi?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_01"); //Urèitê už jsi vo mnê slyšel.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_02"); //(hrdê) Jsem Krokodýl Jack.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_03"); //Bojí se mê celá zem, jsem jeden z nejnebezpeènêjších pirátù.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_04"); //S kapitánem Gregem jsme potopili víc lodí, než dokážem spoèítat.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_05"); //Takže teë koukáš na živoucí legendu.
};

///////////////////////////////////////////////////////////////////////
//	Info Vorschlag
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_Vorschlag		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_Vorschlag_Condition;
	information	 = 	DIA_Addon_AlligatorJack_Vorschlag_Info;

	description	 = 	"Víš nêco o nêjakém maníkovi jménem Havran?";
};

func int DIA_Addon_AlligatorJack_Vorschlag_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_WerBistDu))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_AlligatorJack_Vorschlag_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Vorschlag_15_00"); //Neznáš nêjakého Havrana?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_12_01"); //Jasnê. Je to velitel banditù na východê.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_12_02"); //A co mu chceš?
	
	B_LogEntry (TOPIC_Addon_RavenKDW,"Havran se se svými bandity usadil na východê údolí.");
	
	Info_ClearChoices	(DIA_Addon_AlligatorJack_Vorschlag);
	Info_AddChoice	(DIA_Addon_AlligatorJack_Vorschlag, "Chci se k nêmu pâidat.", DIA_Addon_AlligatorJack_Vorschlag_join );
	Info_AddChoice	(DIA_Addon_AlligatorJack_Vorschlag, "Chci ho zabít.", DIA_Addon_AlligatorJack_Vorschlag_tot );
};

func void 	B_AlligatorJack_Besser ()
{
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Besser_12_00"); //Mám lepší nápad.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Besser_12_01"); //Pâidej se k nám.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Besser_12_02"); //Budeš mít pak èas si to promyslet.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Besser_12_03"); //Když jednou koštneš náš domácí rum, budeš na vêci koukat jinak.
	Info_ClearChoices	(DIA_Addon_AlligatorJack_Vorschlag);
};
func void DIA_Addon_AlligatorJack_Vorschlag_tot ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Vorschlag_tot_15_00"); //Musím ho zabít.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_01"); //(smêje se) Cože? TY? A jak si myslíš, že to provedeš?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_02"); //Není to trochu nad tvý možnosti?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_03"); //Dyk se k nêmu ani nedostaneš. To tê jeho banditi dâív stáhnou zaživa z kùže.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_04"); //Nedostaneš se ani pâes jejich první základnu.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_05"); //Vypadáš tak, že tê banditi zahlídnou už na míli daleko.
	
	B_AlligatorJack_Besser ();
};
func void DIA_Addon_AlligatorJack_Vorschlag_join ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Vorschlag_join_15_00"); //Chci se k nêmu pâidat.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_join_12_01"); //(mazanê) Vážnê?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_join_12_02"); //Ale nevypadáš jako nêkdo, kdo by se chtêl pâidat k takovejm cvokùm.

	B_AlligatorJack_Besser ();
};

///////////////////////////////////////////////////////////////////////
//	Info BDTRuestung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_BDTRuestung		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_BDTRuestung_Condition;
	information	 = 	DIA_Addon_AlligatorJack_BDTRuestung_Info;

	description	 = 	"Potâebuju zbroj banditù.";
};

func int DIA_Addon_AlligatorJack_BDTRuestung_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_Vorschlag))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_BDTRuestung_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_BDTRuestung_15_00"); //Potâebuju zbroj banditù.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_01"); //A co s ní chceš dêlat?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_02"); //Pokud tê v ní nêkdo zahlídne, budeš z toho mít akorát polízanici.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_03"); //Všichni tê budou považovat za banditu a pùjdou po tobê jak slepice po flusu.
	//AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_04"); //Außer den Banditen SELBST vielleicht.
	//AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_05"); //Die werden dich höchstens noch für einen von ihnen halten.
	
	Info_ClearChoices	(DIA_Addon_AlligatorJack_BDTRuestung);
	Info_AddChoice	(DIA_Addon_AlligatorJack_BDTRuestung, "Netušíš, kde bych sehnal takovéhle brnêní?", DIA_Addon_AlligatorJack_BDTRuestung_wo );
	Info_AddChoice	(DIA_Addon_AlligatorJack_BDTRuestung, "To zní dobâe...", DIA_Addon_AlligatorJack_BDTRuestung_gut );
};
func void DIA_Addon_AlligatorJack_BDTRuestung_gut ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_BDTRuestung_gut_15_00"); //To zní dobâe.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_gut_12_01"); //Jo, ale jen pro nêkoho se sebevražednejma sklonama.
};
func void DIA_Addon_AlligatorJack_BDTRuestung_wo ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_BDTRuestung_wo_15_00"); //Netušíš, kde bych takovou zbroj sehnal?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_wo_12_01"); //Jednu jsme mívali v pirátským táboâe.
	//AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_wo_12_02"); //Mmh ... Ich denke, die hatte genau deine Größe.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_wo_12_03"); //Ale nevím, kde je teë.
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Zbroj banditù bych mêl sehnat u pirátù, jenže Krokodýl Jack mi neâekne, jestli opravdu existuje."); 
	
	Info_ClearChoices	(DIA_Addon_AlligatorJack_BDTRuestung);
};

///////////////////////////////////////////////////////////////////////
//	Info Greg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_Greg		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_Greg_Condition;
	information	 = 	DIA_Addon_AlligatorJack_Greg_Info;

	description	 = 	"Váš kapitán se jmenuje Greg?";
};

func int DIA_Addon_AlligatorJack_Greg_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_WerBistDu))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Greg_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Greg_15_00"); //Váš kapitán se jmenuje Greg?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_01"); //Jo, je to nejvêtší pirát, jakýho kdy moâe zrodilo.
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Greg_15_02"); //Myslím, že vašeho kapitána znám, potkal jsem ho v Khorinidu.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_03"); //(smêje se) Greg a v Khorinidu? Blbost!
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_04"); //Greg ještê s nêkolika chlapama vyjel loupit na moâe.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_05"); //Jediný, co by Grega mohlo pâitáhnout do Khorinidu, je královská vêzeàská galéra.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_06"); //Je jedním z nejhledanêjších lidí v zemi.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_07"); //Nikdy by dobrovolnê nevlez do mêsta, aby ho královská stráž mohla hned zatknout.
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Greg_15_08"); //Když to âíkáš.
};

///////////////////////////////////////////////////////////////////////
//	Info PIRLager
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_PIRLager		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_PIRLager_Condition;
	information	 = 	DIA_Addon_AlligatorJack_PIRLager_Info;

	description	 = 	"Kde leží ten tvùj pirátský tábor?";
};

func int DIA_Addon_AlligatorJack_PIRLager_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_WerBistDu))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_PIRLager_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_PIRLager_15_00"); //Kde je ten váš pirátský tábor?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_01"); //Vidíš tamhle tu jeskyni? Projdi na druhou stranu a pak pokraèuj k západu. Dâív nebo pozdêjc dorazíš na naši pláž.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_02"); //Tam máme svý sruby.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_03"); //Když budeš chtít, mùžu tê tam zavést, ale napâed vod tebe budu chtít jednu laskavost.
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_PIRLager_15_04"); //Co to má být?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_05"); //Než se vrátím do tábora, musím chlapùm vobstarat trochu masa.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_06"); //A ty seš silák.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_07"); //Takže by se mi hodila pomoc pâi lovu. Máš zájem?

	Log_CreateTopic (TOPIC_Addon_RatHunt,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_RatHunt,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RatHunt,"Krokodýl Jack potâebuje pomoci s lovem.");

};

///////////////////////////////////////////////////////////////////////
//	Info WasJagen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_WasJagen		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_WasJagen_Condition;
	information	 = 	DIA_Addon_AlligatorJack_WasJagen_Info;

	description	 = 	"Co lovíš?";
};

func int DIA_Addon_AlligatorJack_WasJagen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_PIRLager))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_WasJagen_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_WasJagen_15_00"); //Co lovíš?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_01"); //Obvykle jenom krokodýly, ale ti se nedají moc jíst.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_02"); //A beztak už tu žádní nezbyli.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_03"); //Takže teë beru, co se dá – moèálový krysy.
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_WasJagen_15_04"); //Cože?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_05"); //Vêtšina zdejších potvor chutná jak špinavý fusekle nebo maj stejnê tvrdý maso jako krokodýli.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_06"); //Tlustý moèálový krysy jsou to jedný, co se ještê jakž-takž dá žrát.

	B_LogEntry (TOPIC_Addon_RatHunt,"Jediné, co se tu dá aspoà trochu jíst, jsou moèálové krysy.");
};

// ************************************************************
//				Pirates
// ************************************************************
INSTANCE DIA_Addon_AlligatorJack_Pirates(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 5;
	condition	= DIA_Addon_AlligatorJack_Pirates_Condition;
	information	= DIA_Addon_AlligatorJack_Pirates_Info;
	permanent	= FALSE;
	description	= "Povêz mi o vás pirátech víc.";
};                       
FUNC INT DIA_Addon_AlligatorJack_Pirates_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_PIRLager))
		{
			return TRUE;
		};
};

FUNC VOID DIA_Addon_AlligatorJack_Pirates_Info()
{
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_Pirates_15_00"); //Povêz mi o vás pirátech nêco víc.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_01"); //Už tu žijem celý léta. Eštê pâed válkou nás znal každej vodsuë až na pevninu.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_02"); //Staèil jedinej pohled na naši vlajku a posádky kupeckejch lodí byly podêlaný hrùzou.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_03"); //Ale to už je dávno pryè. Už je to pár tejdnù, co jsme narazili na nêjakou kupeckou loë.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_04"); //Náš kapitán Greg chtêl zkusit àákou pâepadnout.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_05"); //My vostatní sedíme tady v táboâe, chytáme lelky a èekáme, až se vrátí.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_06"); //Doufám, že pâiveze tuènou koâist.
};


// ************************************************************
// 			  			Lass uns jagen gehen
// ************************************************************
INSTANCE DIA_Addon_AlligatorJack_LetsGoHunting(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 5;
	condition	= DIA_Addon_AlligatorJack_LetsGoHunting_Condition;
	information	= DIA_Addon_AlligatorJack_LetsGoHunting_Info;
	permanent	= TRUE;
	description = "Vzhùru na lov!";
};                       
FUNC INT DIA_Addon_AlligatorJack_LetsGoHunting_Condition()
{
	if (MIS_KrokoJagd == FALSE)
	&& (Npc_KnowsInfo (other,DIA_Addon_AlligatorJack_WasJagen)) 
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_AlligatorJack_LetsGoHunting_Info()
{	
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_LetsGoHunting_15_00"); //Tak pojëme na lov.
	AI_Output (self,other ,"DIA_Addon_AlligatorJack_LetsGoHunting_12_01"); //Dobâe, ve dvou to bude hraèka.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_LetsGoHunting_12_02"); //Jsi pâipravenej?
	
	Info_ClearChoices (DIA_Addon_AlligatorJack_LetsGoHunting);
	Info_AddChoice (DIA_Addon_AlligatorJack_LetsGoHunting,"Ne, ještê ne.",DIA_Addon_AlligatorJack_LetsGoHunting_No);
	Info_AddChoice (DIA_Addon_AlligatorJack_LetsGoHunting,"Ano.",DIA_Addon_AlligatorJack_LetsGoHunting_Yes);
};
const int AlligatorJack_Inter1 = 1;
const int AlligatorJack_Kessel = 2;
const int AlligatorJack_Inter2 = 3;
const int AlligatorJack_Canyon = 4;
FUNC VOID DIA_Addon_AlligatorJack_LetsGoHunting_Yes()
{
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_LetsGoHunting_Yes_15_00"); //Ano.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_LetsGoHunting_Yes_12_01"); //Skvêlý, tak se drž za mnou.
	
	AI_StopProcessInfos (self);
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (self, "HUNT1");
		
		
	Wld_InsertNpc (Swamprat ,"ADW_PIRATECAMP_WATERHOLE_06");
	Wld_InsertNpc (Swamprat ,"ADW_PIRATECAMP_WATERHOLE_07");
	Wld_InsertNpc (Swamprat ,"ADW_PIRATECAMP_WATERHOLE_07");

	Wld_InsertNpc (Swamprat ,"ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc (Swamprat ,"ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc (Swamprat ,"ADW_CANYON_TELEPORT_PATH_06");
		
	AlligatorJack_JagdStart = AlligatorJack_Inter1;
	
	MIS_KrokoJagd = LOG_RUNNING;
};

FUNC VOID DIA_Addon_AlligatorJack_LetsGoHunting_No()
{
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_LetsGoHunting_No_15_00"); //Ne, ještê ne.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_LetsGoHunting_No_12_01"); //Tak si pospêš.
	
	Info_ClearChoices (DIA_Addon_AlligatorJack_LetsGoHunting);
};

///////////////////////////////////////////////////////////////////////
//	Info AlligatorJackInter1
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_AlligatorJackInter1		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_AlligatorJackInter1_Condition;
	information	 = 	DIA_Addon_AlligatorJack_AlligatorJackInter1_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_AlligatorJack_AlligatorJackInter1_Condition ()
{
	if (AlligatorJack_JagdStart == AlligatorJack_Inter1)
	&& Npc_GetDistToWP (self,"ADW_PIRATECAMP_WAY_16") <= 500  
		{
			return TRUE;
		};
};

func void DIA_Addon_AlligatorJack_AlligatorJackInter1_Info ()
{
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_AlligatorJackInter1_12_00"); //Údolí.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_AlligatorJackInter1_12_01"); //Nêkde by tu nêjaký ty potvory mêly bejt.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_AlligatorJackInter1_12_02"); //Pojë za mnou.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "HUNT2");
	AlligatorJack_JagdStart = AlligatorJack_Kessel;
};


///////////////////////////////////////////////////////////////////////
//	Info Das habe ich befürchtet
///////////////////////////////////////////////////////////////////////

instance DIA_Addon_AlligatorJack_TheHunt		(C_INFO)
{
	npc			 = 	PIR_1352_Addon_AlligatorJack;
	nr			 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_TheHunt_Condition;
	information	 = 	DIA_Addon_AlligatorJack_TheHunt_Info;
	permanent 	 = 	FALSE;
	important	 = 	TRUE;

};

func int DIA_Addon_AlligatorJack_TheHunt_Condition ()
{
	if (AlligatorJack_JagdStart == AlligatorJack_Kessel)
	&& (Npc_GetDistToWP (self,"ADW_PIRATECAMP_WATERHOLE_07") <= 500)
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_TheHunt_Info ()
{
	AI_Output	(self,other , "DIA_Addon_AlligatorJack_TheHunt_12_00"); //Toho jsem se bál.
	AI_Output 	(other ,self, "DIA_Addon_AlligatorJack_TheHunt_15_01"); //Èeho?
	AI_Output	(self,other , "DIA_Addon_AlligatorJack_TheHunt_12_02"); //Têchhle pár potvor je tak pùlka, než kolik bych potâeboval.
	AI_Output	(self,other , "DIA_Addon_AlligatorJack_TheHunt_12_03"); //Budem to muset vzít do kaàonu.
	AI_Output	(self,other , "DIA_Addon_AlligatorJack_TheHunt_12_04"); //Dávej bacha, dál v kaàonu je to pêknê o hubu.
	AI_Output	(self,other , "DIA_Addon_AlligatorJack_TheHunt_12_05"); //Jestli je ti život milej, drž se co nejblíž u mê.
	
	Wld_InsertNpc (Waran ,"ADW_ENTRANCE_2_VALLEY_10");
	Wld_InsertNpc (Waran ,"ADW_ENTRANCE_2_VALLEY_10");

	Info_ClearChoices (DIA_Addon_AlligatorJack_TheHunt);
	Info_AddChoice (DIA_Addon_AlligatorJack_TheHunt,"A co má v tom kaàonu jako být?",DIA_Addon_AlligatorJack_TheHunt_Enough);
	Info_AddChoice (DIA_Addon_AlligatorJack_TheHunt,"No tak pojëme.",DIA_Addon_AlligatorJack_TheHunt_Running);
};

FUNC VOID DIA_Addon_AlligatorJack_TheHunt_Enough ()
{
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_TheHunt_Enough_15_00"); //Co PÂESNÊ má v tom kaàonu být?
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_TheHunt_Enough_12_01"); //Vyhejbáme se mu, jak jen to jde.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_TheHunt_Enough_12_02"); //Žijou tam bâitovci, a ty jsou fakt tuhý. Jestli se chceš dožít rána, tak se vod nich drž co nejdál.
};

FUNC VOID DIA_Addon_AlligatorJack_TheHunt_Running ()
{
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_TheHunt_Running_15_00"); //Fajn, tak pojëme.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_TheHunt_Running_12_01"); //Dobâe.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "HUNT3");
	AlligatorJack_JagdStart = AlligatorJack_Inter2;
};

///////////////////////////////////////////////////////////////////////
//	Info AlligatorJackInter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_AlligatorJackInter2		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_AlligatorJackInter2_Condition;
	information	 = 	DIA_Addon_AlligatorJack_AlligatorJackInter2_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_AlligatorJack_AlligatorJackInter2_Condition ()
{
	if (AlligatorJack_JagdStart == AlligatorJack_Inter2)
	&& (Npc_GetDistToWP (self,"ADW_PIRATECAMP_WAY_16") <= 500)
	&& (GregIsBack == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_AlligatorJack_AlligatorJackInter2_Info ()
{
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_AlligatorJackInter2_12_00"); //Ale no tak.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "HUNT4");
	AlligatorJack_JagdStart = AlligatorJack_Canyon;
};

///////////////////////////////////////////////////////////////////////
//	Info Das ist jetzt aber genug
///////////////////////////////////////////////////////////////////////

instance DIA_Addon_AlligatorJack_HuntEnd		(C_INFO)
{
	npc			 = 	PIR_1352_Addon_AlligatorJack;
	nr			 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_HuntEnd_Condition;
	information	 = 	DIA_Addon_AlligatorJack_HuntEnd_Info;
	permanent 	 = 	FALSE;
	important	 = 	TRUE;

};

func int DIA_Addon_AlligatorJack_HuntEnd_Condition ()
{
	if (AlligatorJack_JagdStart == AlligatorJack_Canyon)
	&& (Npc_GetDistToWP (self,"ADW_CANYON_TELEPORT_PATH_06") <= 500)
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_HuntEnd_Info ()
{
	if (AlligatorJack_KrokosKilled == 0)
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_00"); //Hele, mùžeš mi âíct, proè tê tu s sebou vlastnê tahám?
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_01"); //Ještê jsi nezabil ani jednu krysu.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_02"); //No, snad budeš užiteènej nêjak jinak.
		
	}
	else if AlligatorJack_KrokosKilled == 1
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_03"); //Výbornê, nêkdo jako ty se nám vždycky hodí.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_04"); //Hned napoprvý jsi jednu z nich sundal, to není špatný.
	}
	else	//mehr als 1!!
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_05"); //Seš schopnej lovec.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_06"); //Tý vole! Jestli budeš takhle pokraèovat, tak pâíštê rovnou zùstanu v táboâe.
	};
	
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_07"); //Odnes prosím tohle maso z moèálovejch krys starýmu Morganovi.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_08"); //Najdeš ho v našem táboâe.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_09"); //Nejspíš si bude dávat šlofíka nêkde na pláži, ale èeká na nêj.
	
	if (PIR_1354_Addon_Henry.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_10"); //Vchod do tábora vobvykle hlídá Henry, drží hlídku kvùli banditùm.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_11"); //Jestli tê nepustí dovnitâ, âekni mu, že tê posílám já.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_12"); //Pak by mêl bejt pâíjemnêjší.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_13"); //Henry je trochu moc nažhavenej a panovaènej.
	};
	
	MIS_AlligatorJack_BringMeat = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Addon_BringMeat,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_BringMeat,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BringMeat,"Krokodýl Jack mi dal 10 plátkù masa, které mám donést Morganovi.");

	B_LogEntry (TOPIC_Addon_RatHunt,"Lov byl úspêšný. Chytili jsme nêkolik moèálových krys.");
	
	B_GiveInvItems (self ,other,ItFoMuttonRaw,10);
	MIS_KrokoJagd = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_KrokoJagd);
};


///////////////////////////////////////////////////////////////////////
//		Angus
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_Angus		(C_INFO)
{
	npc			 = 	PIR_1352_Addon_AlligatorJack;
	nr			 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_Angus_Condition;
	information	 = 	DIA_Addon_AlligatorJack_Angus_Info;
	permanent 	 = 	FALSE;
	description	 = 	"Znáš Anguse a jeho kamaráda Hanka?";

};

func int DIA_Addon_AlligatorJack_Angus_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Bill_AngusnHank)	== TRUE)
	{
		return TRUE;
	};	
};

func void DIA_Addon_AlligatorJack_Angus_Info ()
{
	AI_Output	(other,self , "DIA_Addon_AlligatorJack_Angus_15_00"); //Znáš Anguse a jeho kámoše Hanka?
	AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Angus_12_03"); //Už jsem je àákou dobu nevidêl.
	AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Angus_12_04"); //A ani by mi nevadilo, kdyby se už nikdy nevrátili.
	AI_Output	(other,self , "DIA_Addon_AlligatorJack_Angus_15_05"); //Proè?
	AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Angus_12_06"); //Ti dva srabi se furt jenom poflakovali kolem jezera.
};

///////////////////////////////////////////////////////////////////////
//		Angus
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_Lake		(C_INFO)
{
	npc			 = 	PIR_1352_Addon_AlligatorJack;
	nr			 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_Lake_Condition;
	information	 = 	DIA_Addon_AlligatorJack_Lake_Info;
	permanent 	 = 	FALSE;
	description	 = 	"JAKÉ jezero to má být?";
};

func int DIA_Addon_AlligatorJack_Lake_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Addon_AlligatorJack_Angus) == TRUE)
	&& (MIS_Addon_Morgan_SeekTraitor != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Lake_Info ()
{
	AI_Output	(other,self , "DIA_Addon_AlligatorJack_Lake_15_00"); //Kolem jakého jezera?

	if (MIS_KrokoJagd == LOG_SUCCESS)
	{
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_01"); //Pamatuješ se na ten náš lov?
		AI_Output	(other,self , "DIA_Addon_AlligatorJack_Lake_15_02"); //Jo.
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_03"); //Jezero je v tom údolí. A tam jsem je obvykle vídal.
	}
	else
	{
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_04"); //Jezero je v tom velkým údolí.
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_05"); //Staèí jít z tábora smêrem na východ, to údolí nemùžeš minout.
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_06"); //Je tam spousta malejch vodopádù.
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_07"); //Ale pozor – pokud pod nohama ucejtíš už jenom suchej písek, tak jsi to pâešel a už jsi v kaàonu.
	};
	
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Jeskynê by mêla být v údolí východnê od tábora, pâímo u jezera.");
};
	
///////////////////////////////////////////////////////////////////////
//	Info kannst du mir was beibringen?
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_CanLearn		(C_INFO)
{
	npc			 = 	PIR_1352_Addon_AlligatorJack;
	nr			 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_CanLearn_Condition;
	information	 = 	DIA_Addon_AlligatorJack_CanLearn_Info;
	permanent 	 = 	TRUE;
	description	 = 	"Mùžeš mê nêèemu nauèit?";

};

func int DIA_Addon_AlligatorJack_CanLearn_Condition ()
{
	if (AlligatorJack_Addon_TeachPlayer == FALSE)
	{
		if ((Npc_KnowsInfo (other,DIA_Addon_AlligatorJack_HuntEnd) == TRUE)
		|| (GregIsBack == TRUE))
		{
			return TRUE;
		};	
	};
};

func void DIA_Addon_AlligatorJack_CanLearn_Info ()
{
	AI_Output	(other,self ,"DIA_Addon_AlligatorJack_CanLearn_15_00"); //Mùžeš mê nêco nauèit?
	
	if MIS_KrokoJagd > LOG_RUNNING
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_CanLearn_12_01"); //Jasnê, jsem dobrej lovec a mùžu ti ukázat, jak zvíâatùm stáhnout kùži a vyndat zuby.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_CanLearn_12_02"); //Jestli chceš, nauèím tê to.
		
		Log_CreateTopic (Topic_Addon_PIR_Teacher,LOG_NOTE);
		B_LogEntry		(Topic_Addon_PIR_Teacher,"Krokodýl Jack mi mùže ukázat, jak stahovat zvíâata z kùže a jak jim vyjímat zuby. Krom toho mê také pocvièí v lukostâelbê.");
		
		AlligatorJack_Addon_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_CanLearn_12_03"); //Ale napâed mi pâedveë, že taky umíš lovit.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_CanLearn_12_04"); //Až si spolu zalovíme, tak to tâeba udêlám.
	};
};
///////////////////////////////////////////////////////////////////////
FUNC VOID B_AJ_Teach()
{
	Info_ClearChoices (DIA_Addon_AlligatorJack_Teach);
		
	Info_AddChoice (DIA_Addon_AlligatorJack_Teach,DIALOG_BACK,DIA_Addon_AlligatorJack_Teach_Back);
	Info_AddChoice (DIA_Addon_AlligatorJack_Teach, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*5) ,DIA_Addon_AlligatorJack_Teach_Bow_5);
	Info_AddChoice (DIA_Addon_AlligatorJack_Teach, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))	 ,DIA_Addon_AlligatorJack_Teach_Bow_1);
	Info_AddChoice	(DIA_Addon_AlligatorJack_Teach, B_BuildLearnString ("Stahovat zvíâata",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ReptileSkin)),  DIA_Addon_AlligatorJack_Teach_FUR);
	Info_AddChoice	(DIA_Addon_AlligatorJack_Teach, B_BuildLearnString ("Vyjímat zuby",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)),  DIA_Addon_AlligatorJack_Teach_Teeth);
};
///////////////////////////////////////////////////////////////////////
//	Info Unterrichte mich!
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_Teach		(C_INFO)
{
	npc			 = 	PIR_1352_Addon_AlligatorJack;
	nr			 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_Teach_Condition;
	information	 = 	DIA_Addon_AlligatorJack_Teach_Info;
	permanent 	 = 	TRUE;
	description	 = 	"Nauè mê...";
};
func int DIA_Addon_AlligatorJack_Teach_Condition ()
{
	if (AlligatorJack_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};	
};
func void DIA_Addon_AlligatorJack_Teach_Info ()
{
	AI_Output	(other,self ,"DIA_Addon_AlligatorJack_Teach_15_00"); //Nauè mê nêco!
	AI_Output 	(self ,other,"DIA_Addon_AlligatorJack_Teach_12_01"); //Co bys rád umêl?
		
	B_AJ_Teach();

	//Wird nicht mehr gebraucht M.F. 
	//AI_Output 	(self ,other,"DIA_Addon_AlligatorJack_Teach_12_02"); //Ich kann dir nichts mehr beibringen.
};
FUNC VOID DIA_Addon_AlligatorJack_Teach_Back ()
{
	Info_ClearChoices	(DIA_Addon_AlligatorJack_Teach);
};
func void DIA_Addon_AlligatorJack_Teach_Bow_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 1, 75);
	B_AJ_Teach();
};
func void DIA_Addon_AlligatorJack_Teach_Bow_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 5, 75);
	B_AJ_Teach();
};
FUNC VOID DIA_Addon_AlligatorJack_Teach_FUR()
{
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ReptileSkin] == FALSE)
	{
		if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ReptileSkin))
		{
			AI_Output (self, other, "DIA_Addon_AlligatorJack_Teach_Fur_12_00"); //Âez vždycky zaèínej na bâiše, jinak bude výsledek nekvalitní.
		};
	}
	else
	{
		B_Say (self, other, "$NOLEARNYOUREBETTER");
	};
	B_AJ_Teach();
};
FUNC VOID DIA_Addon_AlligatorJack_Teach_Teeth()
{
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
	{
		 B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Teeth);
	}
	else
	{
		B_Say (self, other, "$NOLEARNYOUREBETTER");
	};
	B_AJ_Teach();
};

// ************************************************************
// *** 														***
// 						Mitkommen (Greg)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
func void B_AlliJack_AlliKlar()
{
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Anheuern_12_01"); //No dobâe.
};
// ------------------------------------------------------------
instance DIA_Addon_AlligatorJack_Anheuern(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 11;
	condition	= DIA_Addon_AlligatorJack_Anheuern_Condition;
	information	= DIA_Addon_AlligatorJack_Anheuern_Info;
	permanent	= FALSE;
	description = "Tak vzhùru na lov.";
};                       
FUNC INT DIA_Addon_AlligatorJack_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_AlligatorJack_Anheuern_Info()
{	
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_Anheuern_15_00"); //Tak pojëme lovit.
	B_AlliJack_AlliKlar();
	AI_StopProcessInfos (self);
	B_Addon_PiratesFollowAgain();
	Npc_ExchangeRoutine	(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_AlligatorJack_ComeOn(C_INFO)
{
	npc			= 	PIR_1352_Addon_AlligatorJack;
	nr		 	= 	12;
	condition	= 	DIA_Addon_AlligatorJack_ComeOn_Condition;
	information	= 	DIA_Addon_AlligatorJack_ComeOn_Info;
	permanent	= 	TRUE;
	description	= 	"Tak pojë.";
};
func int DIA_Addon_AlligatorJack_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_AlligatorJack_ComeOn_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_KommMit_15_00"); //Pojë.
	if (C_GregsPiratesTooFar() == TRUE)
	{
		B_Say (self, other, "$NOTNOW");
		AI_StopProcessInfos (self);
	}
	else
	{
		B_AlliJack_AlliKlar();
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_AlligatorJack_GoHome(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 13;
	condition	= DIA_Addon_AlligatorJack_GoHome_Condition;
	information	= DIA_Addon_AlligatorJack_GoHome_Info;
	permanent	= TRUE;
	description = "Už tê nepotâebuju.";
};                       
FUNC INT DIA_Addon_AlligatorJack_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_AlligatorJack_GoHome_Info()
{	
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_DontNeedYou_15_00"); //Už tê nepotâebuju.
	B_AlliJack_AlliKlar();

	AI_StopProcessInfos (self); 
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START"); //START! HOGE
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_AlligatorJack_TooFar(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 14;
	condition	= DIA_Addon_AlligatorJack_TooFar_Condition;
	information	= DIA_Addon_AlligatorJack_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_AlligatorJack_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_AlligatorJack_TooFar_Info()
{	
	B_Say(self, other, "$RUNAWAY");
	
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};






	




	







































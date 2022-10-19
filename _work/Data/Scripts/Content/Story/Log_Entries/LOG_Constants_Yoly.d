// ***************************
// LOG_Constants für Missionen
// ---------------------------
// (LOG_MISSION)
// ***************************
//ADDON
const string	TOPIC_Addon_PickForConstantino	=	"Byliny pro Constantina";			
const string	TOPIC_Addon_Greg_NW				=	"Muž s páskou pâes oko";			
const string	TOPIC_Addon_Ornament			=	"Portál";			
const string	TOPIC_Addon_HolRiordian			=	"Riordian";			
const string	TOPIC_Addon_RingOfWater			=	"Kruh vody";
const string	TOPIC_Addon_KDW					=	"Mágové vody";
const string	TOPIC_Addon_CavalornTheHut		=	"Cavalornova stará chatrè";
var int			TOPIC_End_CavalornTheHut;
const string	TOPIC_Addon_KillBrago			=	"Cavalornovi bandité";
const string	TOPIC_Addon_Bandittrader		=	"Obchodník se zbranêmi pro bandity";
const string	TOPIC_Addon_MissingPeople		=	"Pohâešovaní lidé";
const string	TOPIC_Addon_WhoStolePeople		=	"Kam se podêli pohâešovaní lidé?";
const string	TOPIC_Addon_BringRangerToLares	=	"Pomoc Laresovi";
const string	TOPIC_Addon_TeleportsNW			=	"Teleportaèní kameny";
const string	TOPIC_Addon_Stoneplates			=	"Kamenné tabulky";
const string	TOPIC_Addon_RangerHelpKDF		=	"Snadný pâístup do kláštera";
var int			TOPIC_End_RangerHelpKDF;
const string	TOPIC_Addon_RangerHelpSLD		=	"Snadný pâístup mezi žoldnéâe";
var int			TOPIC_End_RangerHelpSLD;
const string	TOPIC_Addon_RangerHelpMIL		=	"Snadný pâístup k domobranê";
const string	TOPIC_Addon_Joe					=	"Joe";
var int			TOPIC_END_Joe;
const string	TOPIC_Addon_BromorsGold			=	"Bromorovo zlaté nádobí";

const string	TOPIC_Addon_TeleportsADW		=	"Síla ohniskových kamenù";
const string	TOPIC_Addon_Sklaven				=	"Havranovi otroci";
const string	TOPIC_Addon_Relicts				=	"Relikvie"; 
const string	TOPIC_Addon_RavenKDW			=	"Havran"; 
const string	TOPIC_Addon_Lance				=	"Pâedvoj mágù vody."; 
var int			TOPIC_End_Lance;
const string	TOPIC_Addon_HousesOfRulers		=	"Obydlí stavitelù."; 
const string	TOPIC_Addon_CanyonOrcs			=	"Skâeti v kaàonu."; 
var int			TOPIC_END_CanyonOrcs;
const string	TOPIC_Addon_BDTRuestung			=	"Zbroj banditù"; 
const string	TOPIC_Addon_Quarhodron			=	"Síla strážcù mrtvých"; 
const string	TOPIC_Addon_Klaue				=	"Beliarùv dráp"; 
var int			TOPIC_END_Klaue;
const string	TOPIC_Addon_Kammern				=	"Chrámové komnaty"; 
const string	TOPIC_Addon_Flut				=	"Zatopené mêsto"; 
var int			TOPIC_END_Flut;
const string	TOPIC_Addon_BaltramSkipTrade	=	"Pirátský obchod";  
var int			TOPIC_END_BaltramSkipTrade; 							
const string	TOPIC_Addon_FarimsFish			=	"Problém s domobranou"; 
const string	TOPIC_Addon_Lucia				=	"Lucia"; 
var int			TOPIC_END_Lucia;
const string	TOPIC_Addon_Erol				=	"Pâepadení kupce"; 


const string	TOPIC_Addon_VatrasAbloesung		=	"Pomoc Vatrasovi";

// ******** Texte, die in alte Topics gepackt werden müssen *************

const string	LogText_Addon_SCKnowsMisspeapl 		=	"V Khorinidu se pohâešuje mnoho obyvatel. Nikdo netuší, co se s nimi stalo.";
const string	LogText_Addon_WilliamLeiche	 		=	"Ve zâíceninách východnê od tábora mágù vody leží têlo mrtvého rybáâe.";
const string	LogText_Addon_RavensGoldmine	 	=	"Havran vlastní dùl, kde nutí otroky, aby pro nêj têžili zlato.";
const string	LogText_Addon_KDWRight			 	=	"Do kruhu vody mùže nového èlena pâijmout pouze ten, kdo sám k mágùm tohoto kruhu patâí.";
const string	LogText_Addon_WilliamMissing	 	=	"Mezi zmizelými je i rybáâ z khorinidského pâístavu jménem William.";
const string	LogText_Addon_Relicts	 			=	"V Adanovê chrámu nechali jharkendarští vládci vybudovat i 3 místnosti plné smrtících nástrah a dalších záhad, které mají zastavit každého opovážlivého vetâelce. Odemykají se barevnými relikviemi jejich stavitelù.";
const string	LogText_Addon_SkipsRumToBaltram		=	"Skip mi dal rum, který mám donést Baltramovi.";

// Teach
const string	LogText_Addon_Cavalorn_Teach		=	"Cavalorn mê nauèí, jak používat luk a jak se plížit.";
const string	LogText_Addon_SaturasTeach	 		=	"Saturas mê zasvêtí do kruhù magie.";
const string	LogText_Addon_MyxirTeach	 		=	"Myxir mê nauèí prastarému jazyku stavitelù.";
const string	LogText_Addon_RiordianTeach	 		=	"Riordian nauèí mou bludièku, jak hledat vêci.";
const string	LogText_Addon_RiordianTeachAlchemy 	=	"Riordian mê zasvêtí do tajemství míchání lektvarù.";
const string	LogText_Addon_NefariusTeach			=	"Nefarius mê nauèí vyrábêt runy.";
const string	LogText_Addon_Erol_Teach	 		=	"Obchodník Erol mi vysvêtlí, jak se stát silnêjším.";

// Trade
const string	LogText_Addon_CronosTrade	 		=	"Mág vody Cronos má na prodej spoustu zajímavých vêcí.";
const string	LogText_Addon_VatrasTrade	 		=	"Vatrase zajímají ty podivné kamenné tabulky, které se tu všude povalují. Slíbil mi za nê dobrou cenu.";
const string	LogText_Addon_MartinTrade	 		=	"Martin mi mùže prodat spoustu užiteèností z paladinských zásob.";
const string	LogText_Addon_ErolTrade	 			=	"Obchodník Erol prodává všechny možné vêci. Má chatrè mezi Onarovým statkem a hospodou U Mrtvé harpyje.";

//WispDetector
const string	LogText_Addon_WispLearned 			=	"Bludièka mi mùže vyhledat tyto vêci:";
const string	LogText_Addon_WispLearned_NF 		=	"Zbranê pro boj zblízka";
const string	LogText_Addon_WispLearned_FF	 	=	"Zbranê na dálku a stâelivo";
const string	LogText_Addon_WispLearned_NONE 		=	"Zlato, klíèe a nádobí";
const string	LogText_Addon_WispLearned_RUNE 		=	"Runy a svitky";
const string	LogText_Addon_WispLearned_MAGIC   	=	"Prsteny a amulety";
const string	LogText_Addon_WispLearned_FOOD 		=	"Jídlo a rostliny";
const string	LogText_Addon_WispLearned_POTIONS 	=	"Lektvary, magie a pravidelnê používané vêci";

//Language
const string	LogText_Addon_Language_1 			=	"Znám jazyk rolníkù. A obvykle jím hovoâili i stavitelé.";
const string	LogText_Addon_Language_2 			=	"Znám jazyk váleèníkù.";
const string	LogText_Addon_Language_3 			=	"Znám jazyk knêží.";























//Gothic 2
// ------ Kapitel 1 ------
const string	TOPIC_Bronkoeingeschuechtert	=	"Líný sedlák";			
const string	TOPIC_BalthasarsSchafe			=	"Zakázaná pastvina";			
const string	TOPIC_AkilsSLDStillthere		=	"Chudý sedlák";			
var int 		TOPIC_END_AkilsSLDStillthere;
const string	TOPIC_Wettsaufen				=	"Až do dna!";			
const string	TOPIC_GaanSchnaubi				=	"Funící bestie";			
const string	TOPIC_GromAskTeacher			=	"Hladový lovec";			
const string	TOPIC_DragomirsArmbrust			=	"Dragomirova kuše";			
const string	TOPIC_KillLighthouseBandits		=	"Banditi na Jackovê majáku";			
const string	TOPIC_HannaRetrieveLetter		=	"Postrádá se nêco?";			

// ------ Kapitel 2 ------
// ------ Kapitel 3 ------

const string	TOPIC_INNOSEYE					=	"Innosovo oko";
var int 		TOPIC_END_INNOSEYE;
const string	TOPIC_DEMENTOREN				=	"Pátraèi";
var int 		TOPIC_END_DEMENTOREN;
const string	TOPIC_Buster_KillShadowbeasts	=	"Roh stínové šelmy pro Bustera";
const string	TOPIC_Ulthar_HeileSchreine_PAL	=	"Znesvêcené svatynê";
const string	TOPIC_TraitorPedro				=	"Zrádce Pedro";
const string	TOPIC_SekobDMT					=	"Vyhoštêný sedlák";
var int 		TOPIC_END_SekobDMT;
const string	TOPIC_AkilSchafDiebe			=	"Zlodêji ovcí";
const string	TOPIC_HealHilda					=	"Lék pro Hildu";
const string	TOPIC_MalethsGehstock			=	"Malethova vycházková hùl";
var int 		TOPIC_END_MalethsGehstock;
const string	TOPIC_BengarALLEIN				=	"Sám a bezmocný";
const string	TOPIC_MinenAnteile				=	"Padêlané dùlní akcie";
var int 		TOPIC_END_MinenAnteile;
const string	TOPIC_RichterLakai				=	"Pomocník soudu";
const string	TOPIC_KillTrollBlack			=	"Èerná kùže";
const string	TOPIC_Torlof_Dmt				=	"Torlofùv strach z temných postav";
const string	TOPIC_KillHoshPak				=	"Hosh-Pak";
const string	TOPIC_Urshak					=	"Ur-Shak";

// ------ Kapitel 4 ------
const string	TOPIC_DRACHENJAGD				=	"Lov drakù";
const string	TOPIC_Dragonhunter				=	"Drakobijci";	 
const string	TOPIC_LobartsOrKProblem			=	"Lobartùv problém se skâety";			
var int 		TOPIC_END_LobartsOrKProblem;
const string	TOPIC_SylvioKillIceGolem		=	"Dva ledoví obâi pro Sylvia";			
var int 		TOPIC_END_SylvioKillIceGolem;
const string	TOPIC_AngarsAmulett				=	"Angarùv amulet";			
const string	TOPIC_JanBecomesSmith			=	"Jan a kovárna";			
const string	TOPIC_FerrosSword				=	"Ferùv meè";			
const string	TOPIC_DRACHENEIERNeoras			=	"Neorasovo vaâené draèí vejce";			
const string	TOPIC_DRACHENEIER				=	"Draèí vejce";			
var int 		TOPIC_END_DRACHENEIER;
const string	TOPIC_OrcElite					=	"Hordy elitních skâetích váleèníkù";			
var int  		TOPIC_END_OrcElite;	
const string	TOPIC_Dar_BringOrcEliteRing		=	"Vejtaha";			
const string	TOPIC_FoundVinosKellerei		=	"Vlèí mlha";			
const string	TOPIC_BrutusMeatbugs			=	"Záludný mizera";			
var int  		TOPIC_END_BrutusMeatbugs;	
const string	TOPIC_Sengrath_Missing			=	"Ztracen v temnotách";			
var int  		TOPIC_END_Sengrath_Missing;	
const string	TOPIC_Talbin_Runs				=	"Honem pryè!";			
var int  		TOPIC_END_Talbin_Runs;	
const string	TOPIC_KerolothsGeldbeutel		=	"Krádež";			
var int   		TOPIC_END_KerolothsGeldbeutel;

// ------ Kapitel 5 ------
const string	TOPIC_BuchHallenVonIrdorath		=	"Pán drakù";			
const string	TOPIC_RosisFlucht				=	"Rosiin boj";			
const string	TOPIC_bringRosiBackToSekob		=	"Sekob ztatil svou ženu";			
const string	TOPIC_HealRandolph				=	"Útlak";
const string	TOPIC_GeroldGiveFood			=	"Hlad";

// ------ Kapitel 6 ------
const string	TOPIC_HallenVonIrdorath			=	"Irdorathské sínê";			
const string	TOPIC_BackToShip				=	"Zpátky na loë";			
const string	TOPIC_MyCrew					=	"Moje posádka";			

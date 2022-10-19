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
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_Exit_12_00"); //Jeœli bêdziesz mnie szukaæ, to najprawdopodobniej bêdê siedzia³ gdzieœ w pobli¿u palisady.
	
		if (PIR_1354_Addon_Henry.aivar [AIV_TalkedToPlayer] == FALSE)
		{
			AI_Output (other ,self,"DIA_Addon_AlligatorJack_Exit_15_01"); //Palisady?
			AI_Output (self ,other,"DIA_Addon_AlligatorJack_Exit_12_02"); //PrzejdŸ siê na zachód, a zobaczysz, o co mi chodzi.
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
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Hello_12_00"); //A kim ty w³aœciwie jesteœ? Ró¿nisz siê od pozosta³ych.
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_Hello_15_01"); //Jakich pozosta³ych?
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Hello_12_02"); //Mia³em na myœli wszystkich magów ganiaj¹cych po ruinach jak kot z pêcherzem.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Hello_12_03"); //Jesteœ z nimi?
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Hello_12_04"); //Samotne szwendanie siê po tej okolicy to kiepski pomys³.
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

	description	 = 	"Kim jesteœ?";
};

func int DIA_Addon_AlligatorJack_WerBistDu_Condition ()
{
	return TRUE;
};

func void DIA_Addon_AlligatorJack_WerBistDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_WerBistDu_15_00"); //Kim jesteœ?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_01"); //Na pewno o mnie s³ysza³eœ.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_02"); //Jestem Jack Aligator.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_03"); //Boj¹ siê mnie prawie wszyscy! Jesteœmy najstraszliwszymi piratami p³ywaj¹cymi po tych wodach.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_04"); //Pod wodz¹ kapitana Grega z³upiliœmy wiêcej statków kupieckich, ni¿ jestem w stanie zliczyæ.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_05"); //Rozmawiasz z ¿yw¹ legend¹, ¿e siê tak wyra¿ê.
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

	description	 = 	"Znasz niejakiego Kruka?";
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
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Vorschlag_15_00"); //Znasz niejakiego Kruka?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_12_01"); //Oczywiœcie. To herszt bandytów ze wschodu.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_12_02"); //A czego od niego chcesz?
	
	B_LogEntry (TOPIC_Addon_RavenKDW,"Kruk i jego bandyci zaszyli siê we wschodniej czêœci doliny.");
	
	Info_ClearChoices	(DIA_Addon_AlligatorJack_Vorschlag);
	Info_AddChoice	(DIA_Addon_AlligatorJack_Vorschlag, "Chcê siê do niego przy³¹czyæ.", DIA_Addon_AlligatorJack_Vorschlag_join );
	Info_AddChoice	(DIA_Addon_AlligatorJack_Vorschlag, "Muszê go zabiæ.", DIA_Addon_AlligatorJack_Vorschlag_tot );
};

func void 	B_AlligatorJack_Besser ()
{
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Besser_12_00"); //Mam lepszy pomys³.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Besser_12_01"); //Do³¹cz do nas.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Besser_12_02"); //Razem wszystko obgadamy.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Besser_12_03"); //A kiedy skosztujesz naszego rumu, œwiat od razu wyda ci siê piêkniejszy.
	Info_ClearChoices	(DIA_Addon_AlligatorJack_Vorschlag);
};
func void DIA_Addon_AlligatorJack_Vorschlag_tot ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Vorschlag_tot_15_00"); //Muszê go zabiæ.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_01"); //Co ty? Myœlisz, ¿e da siê dopaœæ pierwszemu lepszemu awanturnikowi?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_02"); //Nie s¹dzisz, ¿e to zadanie ciê przerasta?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_03"); //Nawet go nie zobaczysz. Jego siepacze roznios¹ ciê na strzêpy, jeœli tylko zbli¿ysz siê do ich obozu.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_04"); //Bêdzie dobrze, jeœli przejdziesz choæby przez jeden posterunek.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_05"); //Tak wygl¹dasz, ¿e bandyci najpewniej naszpikuj¹ ciê strza³ami, jak tylko ciê zobacz¹.
	
	B_AlligatorJack_Besser ();
};
func void DIA_Addon_AlligatorJack_Vorschlag_join ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Vorschlag_join_15_00"); //Chcê siê do niego przy³¹czyæ.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_join_12_01"); //Serio?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_join_12_02"); //Nie wygl¹dasz na kogoœ, kto chcia³by zadawaæ siê z tymi szaleñcami.

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

	description	 = 	"Potrzebny mi pancerz bandytów.";
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
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_BDTRuestung_15_00"); //Potrzebny mi pancerz bandytów.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_01"); //A na co ci on?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_02"); //Tylko napytasz sobie biedy, jeœli ktoœ ciê w nim zobaczy.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_03"); //Ka¿dy pomyœli, ¿e jesteœ bandyt¹, i bêdzie próbowa³ ciê zabiæ.
	//AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_04"); //Außer den Banditen SELBST vielleicht.
	//AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_05"); //Die werden dich höchstens noch für einen von ihnen halten.
	
	Info_ClearChoices	(DIA_Addon_AlligatorJack_BDTRuestung);
	Info_AddChoice	(DIA_Addon_AlligatorJack_BDTRuestung, "Wiesz mo¿e, gdzie znaleŸæ taki pancerz?", DIA_Addon_AlligatorJack_BDTRuestung_wo );
	Info_AddChoice	(DIA_Addon_AlligatorJack_BDTRuestung, "Brzmi nieŸle.", DIA_Addon_AlligatorJack_BDTRuestung_gut );
};
func void DIA_Addon_AlligatorJack_BDTRuestung_gut ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_BDTRuestung_gut_15_00"); //Brzmi nieŸle.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_gut_12_01"); //Chyba dla kogoœ, komu ¿ycie siê ju¿ znudzi³o.
};
func void DIA_Addon_AlligatorJack_BDTRuestung_wo ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_BDTRuestung_wo_15_00"); //Wiesz mo¿e, gdzie znaleŸæ taki pancerz?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_wo_12_01"); //Mieliœmy jeden w obozie piratów.
	//AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_wo_12_02"); //Mmh ... Ich denke, die hatte genau deine Größe.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_wo_12_03"); //Ale nie wiem, czy wci¹¿ tam jest.
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Piraci mieli kiedyœ zbrojê bandytów, ale Jack Aligator nie wie, co siê z ni¹ sta³o."); 
	
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

	description	 = 	"Wasz kapitan ma na imiê Greg?";
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
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Greg_15_00"); //Wasz kapitan ma na imiê Greg?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_01"); //Tak. To najwiêkszy pirat, jakiego kiedykolwiek spotka³em.
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Greg_15_02"); //Myœlê, ¿e go znam. Spotka³em siê z nim w Khorinis.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_03"); //Greg? W Khorinis? Niemo¿liwe...
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_04"); //Nasz kapitan wyp³yn¹³ na morze z czêœci¹ ch³opaków.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_05"); //Jeœli Greg kiedykolwiek przybêdzie do Khorinis, to tylko jako wiêzieñ na królewskiej galerze.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_06"); //Jest przecie¿ jednym z najbardziej poszukiwanych ludzi!
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_07"); //Na pewno nie poszed³by do miasta z w³asnej woli. Zosta³by od razu pojmany przez królewsk¹ stra¿ i wtr¹cony do lochu.
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Greg_15_08"); //Jeœli tak mówisz...
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

	description	 = 	"Gdzie znajduje siê wasz obóz?";
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
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_PIRLager_15_00"); //Gdzie znajduje siê wasz obóz?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_01"); //Widzisz ten tunel? Jeœli przejdziesz nim spory kawa³ek na zachód, prêdzej czy póŸniej trafisz na nasz¹ pla¿ê.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_02"); //Tam znajdziesz nasz obóz.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_03"); //Mogê pokazaæ ci drogê, jeœli chcesz. Chocia¿ bêdê ciê musia³ poprosiæ o ma³¹ przys³ugê.
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_PIRLager_15_04"); //Co masz na myœli?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_05"); //Zanim wrócê do obozu, przyda³oby mi siê trochê miêsa dla ch³opaków.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_06"); //Wygl¹dasz na silnego.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_07"); //Mo¿e przydasz mi siê na polowaniu. To co, zainteresowany?

	Log_CreateTopic (TOPIC_Addon_RatHunt,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_RatHunt,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RatHunt,"Jackowi Aligatorowi przyda³aby siê pomoc przy polowaniu.");

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

	description	 = 	"Na co polujesz?";
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
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_WasJagen_15_00"); //Na co polujesz?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_01"); //Zwykle na aligatory, ale ich miêso jest raczej niejadalne.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_02"); //No i dawno ich tu nie widzia³em.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_03"); //Musi mi wiêc wystarczyæ to, co znajdê. Na przyk³ad bagienne szczury.
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_WasJagen_15_04"); //Co takiego?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_05"); //Wiêkszoœæ bagiennych istot œmierdzi jak stary but i ma miêso twarde jak jego podeszwa.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_06"); //Bagienne szczury s¹ przynajmniej jadalne.

	B_LogEntry (TOPIC_Addon_RatHunt,"Jedyne po¿ywienie tutaj to bagienne szczury.");
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
	description	= "Opowiedz mi o piratach.";
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
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_Pirates_15_00"); //Opowiedz mi o piratach.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_01"); //Mieszkamy tu od lat. Przed wojn¹ byliœmy znani w tych okolicach i na kontynencie.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_02"); //Wystarczy³o wywiesiæ flagê, ¿eby kupcy natychmiast siê poddawali.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_03"); //Niestety, te czasy ju¿ minê³y. Od miesiêcy nie mieliœmy okazji napaœæ ¿adnego statku.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_04"); //Nasz kapitan w³aœnie wzi¹³ czêœæ ch³opaków i wyp³yn¹³, ¿eby przechwyciæ jakiœ towar.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_05"); //A reszta siedzi w obozie, wygrzewa siê na s³oñcu i czeka na powrót kapitana.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_06"); //Miejmy nadziejê, ¿e Greg wróci z porz¹dnym ³upem.
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
	description = "ChodŸmy zapolowaæ.";
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
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_LetsGoHunting_15_00"); //ChodŸmy zapolowaæ.
	AI_Output (self,other ,"DIA_Addon_AlligatorJack_LetsGoHunting_12_01"); //Dobrze. Dla nas dwóch to betka.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_LetsGoHunting_12_02"); //Jesteœ gotowy?
	
	Info_ClearChoices (DIA_Addon_AlligatorJack_LetsGoHunting);
	Info_AddChoice (DIA_Addon_AlligatorJack_LetsGoHunting,"Jeszcze nie.",DIA_Addon_AlligatorJack_LetsGoHunting_No);
	Info_AddChoice (DIA_Addon_AlligatorJack_LetsGoHunting,"Tak.",DIA_Addon_AlligatorJack_LetsGoHunting_Yes);
};
const int AlligatorJack_Inter1 = 1;
const int AlligatorJack_Kessel = 2;
const int AlligatorJack_Inter2 = 3;
const int AlligatorJack_Canyon = 4;
FUNC VOID DIA_Addon_AlligatorJack_LetsGoHunting_Yes()
{
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_LetsGoHunting_Yes_15_00"); //Tak.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_LetsGoHunting_Yes_12_01"); //Dobrze. Trzymaj siê blisko mnie.
	
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
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_LetsGoHunting_No_15_00"); //Jeszcze nie.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_LetsGoHunting_No_12_01"); //Wiêc pospiesz siê.
	
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
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_AlligatorJackInter1_12_00"); //Kotlina.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_AlligatorJackInter1_12_01"); //To tutaj zaczniemy szukaæ tych bestii.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_AlligatorJackInter1_12_02"); //ChodŸ za mn¹.
	
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
	AI_Output	(self,other , "DIA_Addon_AlligatorJack_TheHunt_12_00"); //Tego w³aœnie siê obawia³em.
	AI_Output 	(other ,self, "DIA_Addon_AlligatorJack_TheHunt_15_01"); //Czego?
	AI_Output	(self,other , "DIA_Addon_AlligatorJack_TheHunt_12_02"); //Nie wystarczy nam tego miêsa.
	AI_Output	(self,other , "DIA_Addon_AlligatorJack_TheHunt_12_03"); //Musimy iœæ do kanionu.
	AI_Output	(self,other , "DIA_Addon_AlligatorJack_TheHunt_12_04"); //Uwa¿aj. Im dalej, tym bardziej niebezpiecznie.
	AI_Output	(self,other , "DIA_Addon_AlligatorJack_TheHunt_12_05"); //Jeœli cenisz swoje ¿ycie, trzymaj siê mnie.
	
	Wld_InsertNpc (Waran ,"ADW_ENTRANCE_2_VALLEY_10");
	Wld_InsertNpc (Waran ,"ADW_ENTRANCE_2_VALLEY_10");

	Info_ClearChoices (DIA_Addon_AlligatorJack_TheHunt);
	Info_AddChoice (DIA_Addon_AlligatorJack_TheHunt,"Co takiego ¿yje w kanionie?",DIA_Addon_AlligatorJack_TheHunt_Enough);
	Info_AddChoice (DIA_Addon_AlligatorJack_TheHunt,"Dobrze, chodŸmy.",DIA_Addon_AlligatorJack_TheHunt_Running);
};

FUNC VOID DIA_Addon_AlligatorJack_TheHunt_Enough ()
{
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_TheHunt_Enough_15_00"); //Co takiego ¿yje w kanionie?
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_TheHunt_Enough_12_01"); //Nie chodzimy tam, jeœli nie musimy.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_TheHunt_Enough_12_02"); //Siedz¹ tam brzytwiaki, a one potrafi¹ byæ cholernie twarde. Unikaj ich, jeœli ci ¿ycie mi³e.
};

FUNC VOID DIA_Addon_AlligatorJack_TheHunt_Running ()
{
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_TheHunt_Running_15_00"); //Dobrze, chodŸmy.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_TheHunt_Running_12_01"); //W porz¹dku.
	
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
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_AlligatorJackInter2_12_00"); //ChodŸ.
	
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
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_00"); //Powiedz mi, po co ja w ogóle ciê zabra³em?
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_01"); //Nie upolowa³eœ ani jednego szczura.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_02"); //Mo¿e potrafisz robiæ coœ innego.
		
	}
	else if AlligatorJack_KrokosKilled == 1
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_03"); //Doskonale! Takich ludzi nam potrzeba.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_04"); //Pierwsze polowanie i ju¿ z³apa³eœ jednego. NieŸle, nieŸle...
	}
	else	//mehr als 1!!
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_05"); //Masz dryg do polowania, nie ma co.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_06"); //A niech mnie! Jeœli tak dalej pójdzie, to nie bêdê mia³ co robiæ na polowaniach.
	};
	
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_07"); //WeŸ szczura i zanieœ go temu leniowi Morganowi.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_08"); //Znajdziesz go w obozie.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_09"); //Pewnie bêdzie siê wygrzewa³ na pla¿y, czekaj¹c na ciebie.
	
	if (PIR_1354_Addon_Henry.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_10"); //Przy wejœciu spotkasz Henry'ego, który pilnuje, ¿eby nie podkradli siê tu bandyci.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_11"); //Powiedz mu, ¿e to ja ciê przys³a³em.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_12"); //Powinien ciê wpuœciæ.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_13"); //Henry jest przewra¿liwiony, a przy tym lubi zgrywaæ wa¿niaka.
	};
	
	MIS_AlligatorJack_BringMeat = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Addon_BringMeat,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_BringMeat,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BringMeat,"Jack Aligator da³ mi 10 kawa³ków miêsa. Mam je zanieœæ Morganowi.");

	B_LogEntry (TOPIC_Addon_RatHunt,"Polowanie by³o udane. Zabiliœmy kilka bagiennych szczurów.");
	
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
	description	 = 	"Znasz mo¿e Angusa i jego kumpla, Hanka?";

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
	AI_Output	(other,self , "DIA_Addon_AlligatorJack_Angus_15_00"); //Znasz mo¿e Angusa i jego kumpla, Hanka?
	AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Angus_12_03"); //Nie widzia³em ich od jakiegoœ czasu.
	AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Angus_12_04"); //W sumie nie mia³bym nic przeciwko temu, ¿eby przepadli na dobre.
	AI_Output	(other,self , "DIA_Addon_AlligatorJack_Angus_15_05"); //Dlaczego?
	AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Angus_12_06"); //Ci obwiesie krêc¹ siê zwykle w pobli¿u jeziora, skutecznie odstraszaj¹c zwierzynê.
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
	description	 = 	"A jak myœlisz, nad którym jeziorem przebywaj¹ najczêœciej?";
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
	AI_Output	(other,self , "DIA_Addon_AlligatorJack_Lake_15_00"); //A jak myœlisz, nad którym jeziorem przebywaj¹ najczêœciej?

	if (MIS_KrokoJagd == LOG_SUCCESS)
	{
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_01"); //Pamiêtasz nasze polowanie?
		AI_Output	(other,self , "DIA_Addon_AlligatorJack_Lake_15_02"); //Tak.
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_03"); //Chyba w kotlinie... Tam ich widywa³em najczêœciej.
	}
	else
	{
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_04"); //Nad jeziorem w kotlinie.
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_05"); //Na wschód od naszego obozu. Nie sposób nie trafiæ.
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_06"); //Wpada do niego kilka ma³ych wodospadów.
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_07"); //Tylko uwa¿aj. Kiedy zejdziesz na ca³kowicie piaszczysty teren, to znaczy, ¿e Ÿle skrêci³eœ i wszed³eœ do kanionu.
	};
	
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Jaskinia zapewne znajduje siê w kotlinie na wschód od obozu, tu¿ przy jeziorze.");
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
	description	 = 	"Mo¿esz mnie czegoœ nauczyæ?";

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
	AI_Output	(other,self ,"DIA_Addon_AlligatorJack_CanLearn_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	
	if MIS_KrokoJagd > LOG_RUNNING
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_CanLearn_12_01"); //Pewnie. Jestem dobrym myœliwym i mogê ci powiedzieæ, jak najlepiej œcigaæ zwierzynê i pozyskiwaæ k³y.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_CanLearn_12_02"); //Wystarczy, ¿e zapytasz.
		
		Log_CreateTopic (Topic_Addon_PIR_Teacher,LOG_NOTE);
		B_LogEntry		(Topic_Addon_PIR_Teacher,"Jack Aligator mo¿e pokazaæ mi, jak obdzieraæ zwierzêta ze skór i jak wyci¹gaæ ich zêby. Mo¿e te¿ nauczyæ mnie strzelania z ³uku.");
		
		AlligatorJack_Addon_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_CanLearn_12_03"); //Najpierw musisz jednak pokazaæ, ¿e wiesz cokolwiek o polowaniu.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_CanLearn_12_04"); // Jeœli pójdziesz ze mn¹ na polowanie, mogê ciê tego nauczyæ.
	};
};
///////////////////////////////////////////////////////////////////////
FUNC VOID B_AJ_Teach()
{
	Info_ClearChoices (DIA_Addon_AlligatorJack_Teach);
		
	Info_AddChoice (DIA_Addon_AlligatorJack_Teach,DIALOG_BACK,DIA_Addon_AlligatorJack_Teach_Back);
	Info_AddChoice (DIA_Addon_AlligatorJack_Teach, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*5) ,DIA_Addon_AlligatorJack_Teach_Bow_5);
	Info_AddChoice (DIA_Addon_AlligatorJack_Teach, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))	 ,DIA_Addon_AlligatorJack_Teach_Bow_1);
	Info_AddChoice	(DIA_Addon_AlligatorJack_Teach, B_BuildLearnString ("Skórowanie zwierz¹t",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ReptileSkin)),  DIA_Addon_AlligatorJack_Teach_FUR);
	Info_AddChoice	(DIA_Addon_AlligatorJack_Teach, B_BuildLearnString ("Wyci¹ganie zêbów",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)),  DIA_Addon_AlligatorJack_Teach_Teeth);
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
	description	 = 	"Naucz mnie.";
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
	AI_Output	(other,self ,"DIA_Addon_AlligatorJack_Teach_15_00"); //Naucz mnie.
	AI_Output 	(self ,other,"DIA_Addon_AlligatorJack_Teach_12_01"); //Czego chcesz siê dowiedzieæ?
		
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
			AI_Output (self, other, "DIA_Addon_AlligatorJack_Teach_Fur_12_00"); //Zawsze rozcinaj skórê wzd³u¿ brzucha, inaczej nie bêdzie siê do niczego nadawaæ.
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
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Anheuern_12_01"); //Rozumiem.
};
// ------------------------------------------------------------
instance DIA_Addon_AlligatorJack_Anheuern(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 11;
	condition	= DIA_Addon_AlligatorJack_Anheuern_Condition;
	information	= DIA_Addon_AlligatorJack_Anheuern_Info;
	permanent	= FALSE;
	description = "ChodŸmy na polowanie.";
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
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_Anheuern_15_00"); //ChodŸmy na polowanie.
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
	description	= 	"ChodŸ ze mn¹.";
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
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_KommMit_15_00"); //ChodŸ ze mn¹.
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
	description = "Nie potrzebujê ju¿ twojej pomocy.";
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
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_DontNeedYou_15_00"); //Nie potrzebujê ju¿ twojej pomocy.
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






	




	







































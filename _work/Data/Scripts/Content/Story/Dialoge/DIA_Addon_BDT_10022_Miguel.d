//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_EXIT   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 999;
	condition   = DIA_Addon_Miguel_EXIT_Condition;
	information = DIA_Addon_Miguel_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Miguel_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Miguel_PICKPOCKET (C_INFO)
{
	npc			= BDT_10022_Addon_Miguel;
	nr			= 900;
	condition	= DIA_Addon_Miguel_PICKPOCKET_Condition;
	information	= DIA_Addon_Miguel_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Miguel_PICKPOCKET_Condition()
{
	C_Beklauen (40, 48);
};
 
FUNC VOID DIA_Addon_Miguel_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Miguel_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Miguel_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Miguel_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Miguel_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Miguel_PICKPOCKET_DoIt);
};

func void DIA_Addon_Miguel_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Miguel_PICKPOCKET);
};
	
func void DIA_Addon_Miguel_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Miguel_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Hi   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 1;
	condition   = DIA_Addon_Miguel_Hi_Condition;
	information = DIA_Addon_Miguel_Hi_Info;
	permanent   = FALSE;
	description = "Co tu robisz?";
};
FUNC INT DIA_Addon_Miguel_Hi_Condition()
{		
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Hi_15_00");//Co tu robisz?
	
	if Wld_IsTime (06,00,22,00)
	{
		AI_Output (other, self, "DIA_Addon_Miguel_Hi_15_01");//Szukasz czegoœ?
		AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_02");//Roœlin - szukam roœlin.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_03");//Zwykle szukam roœlin.
	};
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_04");//Wiêkszoœæ tego, co tu roœnie, mo¿na wykorzystaæ.
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_05");//Wiele zió³ ma w³aœciwoœci lecznicze, a bagienne ziele mo¿na paliæ.
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_06");//Zanim umieœcili mnie za barier¹, pracowa³em u alchemika.
};
//---------------------------------------------------------------------
//	Info Story
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Story   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 2;
	condition   = DIA_Addon_Miguel_Story_Condition;
	information = DIA_Addon_Miguel_Story_Info;
	permanent   = FALSE;
	description = "Za co ciê zamknêli za barier¹?";
};
FUNC INT DIA_Addon_Miguel_Story_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Miguel_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Story_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Story_15_00");//Za co ciê zamknêli za barier¹?
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_01");//Eksperymentowa³em z ró¿nymi miksturami, które wp³ywaj¹ na umys³ i pozwalaj¹ nim manipulowaæ.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_02");//Ignaz, mój mistrz, wypi³ kiedyœ jeden z moich "eksperymentów" zamiast wina.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_03");//No... zacz¹³ siê zachowywaæ... nieco irracjonalnie. Od tamtej pory jest... troszkê niezrównowa¿ony.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_04");//Magowie zes³ali mnie do kolonii karnej za "prowadzenie badañ w zakazanej dziedzinie".
};

//---------------------------------------------------------------------
//	LAGER
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Lager   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 3;
	condition   = DIA_Addon_Miguel_Lager_Condition;
	information = DIA_Addon_Miguel_Lager_Info;
	permanent   = FALSE;
	description = "Co mo¿esz mi powiedzieæ o obozowisku?";
};
FUNC INT DIA_Addon_Miguel_Lager_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_Lager_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Lager_15_00"); //Co mo¿esz mi powiedzieæ o obozowisku?
	AI_Output (self, other, "DIA_Addon_Miguel_Lager_11_01"); //Niewiele. Nigdy tam nie by³em.
	AI_Output (self, other, "DIA_Addon_Miguel_Lager_11_02"); //Tylko ludzie Kruka byli tam od pocz¹tku. Wszyscy pozostali przyszli póŸniej albo wci¹¿ czekaj¹ na przyjêcie. Tak jak ja.
};

//-----------------------------------------
//	Woher
//-----------------------------------------
instance DIA_Addon_Miguel_WhereFrom (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 4;
	condition   = DIA_Addon_Miguel_WhereFrom_Condition;
	information = DIA_Addon_Miguel_WhereFrom_Info;
	permanent   = FALSE;
	description = "Jak siê tu dosta³eœ?";
};
FUNC INT DIA_Addon_Miguel_WhereFrom_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Hi)
	|| Npc_KnowsInfo (other,DIA_Addon_Miguel_Lager)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_WhereFrom_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_WhereFrom_15_00"); //Jak siê tu dosta³eœ?
	AI_Output (self, other, "DIA_Addon_Miguel_WhereFrom_11_01"); //Myœlê, ¿e t¹ sam¹ drog¹ co ty. Z piratami przez morze.
	AI_Output (self, other, "DIA_Addon_Miguel_WhereFrom_11_02"); //Ta dolina jest niedostêpna z wyspy. Mo¿na siê do niej dostaæ tylko morzem.
	AI_Output (other, self, "DIA_Addon_Miguel_WhereFrom_15_03"); //Dok³adnie.
};

//-----------------------------------------
//	Angefordert
//-----------------------------------------
instance DIA_Addon_Miguel_Angefordert (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 4;
	condition   = DIA_Addon_Miguel_Angefordert_Condition;
	information = DIA_Addon_Miguel_Angefordert_Info;
	permanent   = FALSE;
	description = "Kiedy zwykle potrzebuj¹ nowych ludzi?";
};
FUNC INT DIA_Addon_Miguel_Angefordert_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Lager)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Angefordert_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Angefordert_15_00"); //Kiedy zwykle potrzebuj¹ nowych ludzi?
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_01"); //Gdy jest ich za ma³o...
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_02"); //Gdy kogoœ zabije kopalniany pe³zacz, potrzebuj¹ drugiego na wymianê.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_03"); //No i czasem ch³opaki siê pozabijaj¹. Ale ostatnio nie jest tak Ÿle.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_04"); //Kruk zdo³a³ to jakoœ zorganizowaæ i pilnuje, ¿eby w kopalni nie pracowali wszyscy naraz.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_05"); //Nie mam pojêcia, jak to dok³adnie funkcjonuje. Nigdy tam nie by³em.
};

//---------------------------------------------------------------------
//	Info Fortuno
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Fortuno   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 6;
	condition   = DIA_Addon_Miguel_Fortuno_Condition;
	information = DIA_Addon_Miguel_Fortuno_Info;
	permanent   = FALSE;
	description = "Fortuno sprawia wra¿enie ob³¹kanego.";
};
FUNC INT DIA_Addon_Miguel_Fortuno_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Fortuno_FREE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Fortuno_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_00");//Fortuno sprawia wra¿enie ob³¹kanego. Myœlê, ¿e jakaœ mikstura mo¿e przywróciæ mu pamiêæ.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_01");//Fortuno? To jeden ze s³u¿¹cych Kruka.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_02");//Teraz to tylko wrak. A wszystko z winy Kruka.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_03");//Kruk. Nigdy o nim wiele nie myœla³em. Hmm, dobra. Niestety, nie mogê warzyæ mikstur tutaj, na bagnach.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_04");//Móg³bym przyrz¹dziæ miksturê. W obozie jest odpowiedni stó³. Gdybym tylko mia³ przepis...
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_05");//Lepiej b¹dŸ ostro¿ny z tym przepisem. Warzenie mikstur to niebezpieczne zajêcie.
	B_GiveInvItems (self, other, ITWr_Addon_MCELIXIER_01,1);
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_06");//Je¿eli u¿yjesz nieodpowiednich sk³adników albo coœ pójdzie nie tak, mikstura bêdzie œmierteln¹ trucizn¹.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_07");//Bêdê uwa¿a³.
	
	B_LogEntry (Topic_Addon_Fortuno,"Miguel da³ mi przepis na miksturê, która ma pomóc Fortuna w odzyskaniu pamiêci. Powinienem przyrz¹dziæ j¹ dopiero wtedy, gdy dobrze poznam dzia³anie wszystkich sk³adników. Inaczej mo¿e byæ zabójcza.");
};

//---------------------------------------------------------------------
//	Info BRAU
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_BRAU   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 7;
	condition   = DIA_Addon_Miguel_BRAU_Condition;
	information = DIA_Addon_Miguel_BRAU_Info;
	permanent   = FALSE;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};
FUNC INT DIA_Addon_Miguel_BRAU_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Story)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_BRAU_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_BRAU_15_00");//Mo¿esz mnie czegoœ nauczyæ?
	AI_Output (self, other, "DIA_Addon_Miguel_BRAU_11_01");//Nie mam na to czasu. Przyszed³em tu zdobyæ trochê z³ota. Na razie, dopóki nie wpuszcz¹ mnie do obozowiska, zarabiam na handlu zio³ami.
	AI_Output (self, other, "DIA_Addon_Miguel_BRAU_11_02");//Mogê jednak zaopatrzyæ ciê w mikstury.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Od Miguela mogê kupiæ roœliny i mikstury.");
};

//---------------------------------------------------------------------
//	Info trade
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_trade   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 888;
	condition   = DIA_Addon_Miguel_trade_Condition;
	information = DIA_Addon_Miguel_trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Miguel_trade_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_BRAU)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_trade_Info()
{
	B_Say (other,self,"$TRADE_1");
	B_GiveTradeInv(self);
};




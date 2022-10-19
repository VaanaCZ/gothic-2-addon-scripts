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
	description = "Co tady dêláš?";
};
FUNC INT DIA_Addon_Miguel_Hi_Condition()
{		
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Hi_15_00");//Co tu chceš?
	
	if Wld_IsTime (06,00,22,00)
	{
		AI_Output (other, self, "DIA_Addon_Miguel_Hi_15_01");//Hledáš nêco?
		AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_02");//Byliny - hledám byliny.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_03");//Obvykle hledám byliny.
	};
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_04");//Tady vêtšinou rostou samý užiteèný vêci.
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_05");//Vêtšina zdejších rostlin je léèivá a dá se kouâit jako cigára z trávy z bažin.
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_06");//Tehdá za bariérou jsem pracoval jako alchymista.
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
	description = "Proè tê hodili za bariéru?";
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
	AI_Output (other, self, "DIA_Addon_Miguel_Story_15_00");//Proè tê vlastnê shodili za bariéru?
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_01");//Moc jsem si zahrával s lektvary, který pozmêàovaly mysl.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_02");//Jednou veèer si mùj mistr Ignaz omylem spletl mùj 'experiment' s vínem.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_03");//Byl potom naèas tak nêjak, ehm, nevypoèitatelný. A i pak byl z toho všeho tak nêjak popletený.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_04");//(hoâce) Mágové mê za to hodili za bariéru. Âíkali tomu 'bádání v zakázané oblasti'.
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
	description = "Co mi mùžeš âíci o táboâe?";
};
FUNC INT DIA_Addon_Miguel_Lager_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_Lager_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Lager_15_00"); //Co bys mi âekl o táboâe?
	AI_Output (self, other, "DIA_Addon_Miguel_Lager_11_01"); //Nic moc. Nikdy jsem tam sám nebyl.
	AI_Output (self, other, "DIA_Addon_Miguel_Lager_11_02"); //Od zaèátku tam byli jenom Havranovi lidi. Všichni ostatní pâišli pozdêji, vèetnê mê, a museli èekat, až budou potâebovat nový lidi.
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
	description = "Odkud jsi pâišel?";
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
	AI_Output (other, self, "DIA_Addon_Miguel_WhereFrom_15_00"); //Odkud jsi pâišel?
	AI_Output (self, other, "DIA_Addon_Miguel_WhereFrom_11_01"); //No, nejspíš tam odtud co ty. S piráty po moâi.
	AI_Output (self, other, "DIA_Addon_Miguel_WhereFrom_11_02"); //Tohle údolí je komplet odâíznutý, není tu žádný spojení na pevninu.
	AI_Output (other, self, "DIA_Addon_Miguel_WhereFrom_15_03"); //(zamyšlenê) Pravda.
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
	description = "Kdy budou potâebovat nové lidi?";
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
	AI_Output (other, self, "DIA_Addon_Miguel_Angefordert_15_00"); //A kdy budou potâebovat nové lidi?
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_01"); //No, až jim bude nêkdo scházet.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_02"); //Když nêkoho z kopáèù sežere dùlní èerv, jdou za náma, aby ho nêkdo nahradil.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_03"); //Obèas se taky zabíjejí mezi sebou, ale poslední dobou už je to lepší.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_04"); //Havran nêjak ovládá pâístup do dolu, takže se tam hned tak nêkdo nedostane.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_05"); //Ale nevím pâesnê, jak to funguje, nikdy jsem tam nebyl.
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
	description = "Co se týèe Fortuna...";
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
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_00");//Fortuno je pêknê zmatený a hodil by se mu nêjaký lektvar na osvêžení pamêti.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_01");//Fortuno? Ten snad slouží Havranovi, ne?
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_02");//Sloužíval, ale teë je z nêj troska. A mùže za to Havran.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_03");//Havran? Doteëka jsem o nêm mêl vysoký mínêní. No dobâe, ale tady v bažinách nenamíchám nic.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_04");//Mùžu si ten lektvar namíchat sám, v táboâe je alchymistická kolona. Staèí mi jenom recept.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_05");//S tím receptem opatrnê, pâíprava tohohle lektvaru je nebezpeèná.
	B_GiveInvItems (self, other, ITWr_Addon_MCELIXIER_01,1);
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_06");//Pokud nêco zkazíš nebo tam nedáš správné ingredience, mùže ti z toho vyjít zabijácký dryák.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_07");//Dám si pozor.
	
	B_LogEntry (Topic_Addon_Fortuno,"Miguel mi dal recept na nêjaký lektvar, který by mêl oživit Fortunovu pamêã. Ale mohu jej namíchat, pouze až budu znát všechny pâísady, jinak by to mohlo mít smrtonosné následky.");
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
	description = "Mùžeš mê nêèemu nauèit?";
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
	AI_Output (other, self, "DIA_Addon_Miguel_BRAU_15_00");//Mùžeš mê nêco nauèit?
	AI_Output (self, other, "DIA_Addon_Miguel_BRAU_11_01");//Není èas. Jsem tu, abych získal zlato, a dokud se nedostanu do tábora, musím si na živobytí vydêlávat prodejem bylin.
	AI_Output (self, other, "DIA_Addon_Miguel_BRAU_11_02");//Ale kdybys potâeboval lektvary, nêjaký tady mám.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"U Miguela mohu nakupovat lektvary a byliny.");
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




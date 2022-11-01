// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Abuyin_EXIT(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 999;
	condition	= DIA_Abuyin_EXIT_Condition;
	information	= DIA_Abuyin_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Abuyin_EXIT_Condition()
{
	
	return TRUE;
};
FUNC VOID DIA_Abuyin_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
 // ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Abuyin_PICKPOCKET (C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 900;
	condition	= DIA_Abuyin_PICKPOCKET_Condition;
	information	= DIA_Abuyin_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Abuyin_PICKPOCKET_Condition()
{
	C_Beklauen (75, 200);
};
 
FUNC VOID DIA_Abuyin_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Abuyin_PICKPOCKET);
	Info_AddChoice		(DIA_Abuyin_PICKPOCKET, DIALOG_BACK 		,DIA_Abuyin_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Abuyin_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Abuyin_PICKPOCKET_DoIt);
};

func void DIA_Abuyin_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Abuyin_PICKPOCKET);
};
	
func void DIA_Abuyin_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Abuyin_PICKPOCKET);
};
// ************************************************************
// 			  		Hallo
// ************************************************************
INSTANCE DIA_Abuyin_Hallo(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Hallo_Condition;
	information	= DIA_Abuyin_Hallo_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       
FUNC INT DIA_Abuyin_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Hallo_Info()
{	
	AI_Output (self, other,"DIA_Addon_Abuyin_Hallo_13_00");//(pâemýšlí) ...je to divné, ale mám neodbytný pocit, že jsem tę už nękde vidęl, poutníku...
	AI_Output (self, other,"DIA_Addon_Abuyin_Hallo_13_01");//No, čas a prostor jsou prostę záhadné elementy. Ale omluv mou nezdvoâilost, ó synu trpęlivosti. Ještę jsem tę ani nepozdravil.
	AI_Output (self, other,"DIA_Addon_Abuyin_Hallo_13_02");//Vítám tę, pâíteli! Uveleb se na mých skrovných kobercích a v klidu si vychutnej dobrou dýmku.
};
// ************************************************************
// 			  		Wer bist du?
// ************************************************************
INSTANCE DIA_Abuyin_du(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_du_Condition;
	information	= DIA_Abuyin_du_Info;
	permanent	= FALSE;
	description	= "Kdo jsi?";
};                       
FUNC INT DIA_Abuyin_du_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Abuyin_du_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_du_15_00");//Kdo jsi?
	AI_Output (self, other,"DIA_Abuyin_du_13_01");//Jmenuju se Abú Džín ibn Džadír ibn Omar Chalíd ben Hádží al-Šarídí. Jsem vęštcem a prorokem, astrologem a dodavatelem tabáku.
};
// ************************************************************
// 			  		Kraut
// ************************************************************
INSTANCE DIA_Abuyin_Kraut(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Kraut_Condition;
	information	= DIA_Abuyin_Kraut_Info;
	permanent	= FALSE;
	description	= "Jaký tabák mi můžeš nabídnout?";
};                       
FUNC INT DIA_Abuyin_Kraut_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Abuyin_du)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Kraut_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Kraut_15_00");//Jaký tabák nabízíš?
	AI_Output (self, other,"DIA_Abuyin_Kraut_13_01");//Mé dýmky jsou naplnęny pikantním a osvęžujícím jablečným tabákem.
	AI_Output (self, other,"DIA_Abuyin_Kraut_13_02");//Posluž si, kdykoli budeš chtít, synu dobrodružství.
};
// ************************************************************
// 			  	anderen Tabak?
// ************************************************************
INSTANCE DIA_Abuyin_anderen(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_anderen_Condition;
	information	= DIA_Abuyin_anderen_Info;
	permanent	= FALSE;
	description	= "Máš i jiný tabák?";
};                       
FUNC INT DIA_Abuyin_anderen_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Abuyin_Kraut)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_anderen_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_anderen_15_00");//Máš i jiný tabák?
	AI_Output (self, other,"DIA_Abuyin_anderen_13_01");//Nabízím pouze ten nejlepší tabák. Tato jablečná smęs má podobné vlastnosti jako tabák z mé domoviny, Jižních ostrovů.
	AI_Output (self, other,"DIA_Abuyin_anderen_13_02");//Ale samozâejmę se nijak nebráním vyzkoušet jakýkoli jiný druh - pokud tedy nękdo dokáže vyrobit opravdu dobrý tabák.
	AI_Output (other, self,"DIA_Abuyin_anderen_15_03");//Jak se to dęlá?
	AI_Output (self, other,"DIA_Abuyin_anderen_13_04");//Jako základ doporučuji můj jablečný tabák. A pak můžeš vyzkoušet kombinace s dalšími ingrediencemi.
	AI_Output (self, other,"DIA_Abuyin_anderen_13_05");//Výroba probíhá v alchymistické kolonę a vyžaduje základní znalosti alchymie.
};
// ************************************************************
// 			  	Woher 
// ************************************************************
INSTANCE DIA_Abuyin_Woher(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Woher_Condition;
	information	= DIA_Abuyin_Woher_Info;
	permanent	= FALSE;
	description	= "Kde se dá sehnat jablečný tabák?";
};                       
FUNC INT DIA_Abuyin_Woher_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Abuyin_anderen)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Woher_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Woher_15_00");//Kde se dá sehnat jablečný tabák?
	AI_Output (self, other,"DIA_Abuyin_Woher_13_01");//Dám ti dvę dávky. Je jen na tvé moudrosti, jak s ním naložíš.
	AI_Output (self, other,"DIA_Abuyin_Woher_13_02");//Pokud budeš chtít další, zajdi pâímo za Zuridem, mistrem lektvarů. Dęlá si svůj vlastní tabák a také ho samozâejmę prodává.
	
	B_GiveInvItems (self, other, ItMi_ApfelTabak,2);
};
// ************************************************************
FUNC VOID B_TabakProbieren()
{
	AI_Output (self, other,"DIA_Abuyin_Mischung_Nichts_13_00");//Nech mę ten tabák vyzkoušet.
	CreateInvItems (self, ItMi_Joint,1);
	B_UseItem (self, ItMi_Joint);
	AI_Output (self, other,"DIA_Abuyin_Mischung_Nichts_13_01");//Ne, obávám se, že mi tahle smęs nebude vyhovovat. Ale možná se ti podaâí nalézt nękoho jiného, kdo ehm... ocení takovou delikatesu.
};
// ************************************************************
// 			  	Mischung 
// ************************************************************
INSTANCE DIA_Abuyin_Mischung(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 10;
	condition	= DIA_Abuyin_Mischung_Condition;
	information	= DIA_Abuyin_Mischung_Info;
	permanent	= TRUE;
	description	= "Mám novou smęs tabáku...";
};                       
FUNC INT DIA_Abuyin_Mischung_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Abuyin_anderen)
	&& (Abuyin_Honigtabak == FALSE)
	&& ((Npc_HasItems (other, ItMi_SumpfTabak) >= 1)
	|| (Npc_HasItems (other, ItMi_PilzTabak) >= 1)
	|| (Npc_HasItems (other, ItMi_DoppelTabak) >= 1)
	|| (Npc_HasItems (other, ItMi_Honigtabak) >= 1))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Mischung_Info()
{	
	
	AI_Output (other, self,"DIA_Abuyin_Mischung_15_00");//Mám novou smęs tabáku.
	
	Info_ClearChoices (DIA_Abuyin_Mischung);
	Info_AddChoice (DIA_Abuyin_Mischung,DIALOG_BACK,DIA_Abuyin_Mischung_BACK);
	
	if (Npc_HasItems (other, ItMi_SumpfTabak) >= 1)
	{
		Info_AddChoice (DIA_Abuyin_Mischung,PRINT_KRAUT,DIA_Abuyin_Mischung_Sumpf);
	};
	if (Npc_HasItems (other, ItMi_PilzTabak) >= 1)
	{
		Info_AddChoice (DIA_Abuyin_Mischung,PRINT_PILZ,DIA_Abuyin_Mischung_Pilz);
	};
	if (Npc_HasItems (other, ItMi_DoppelTabak) >= 1)
	{
		Info_AddChoice (DIA_Abuyin_Mischung,PRINT_DOPPEL,DIA_Abuyin_Mischung_Doppel);
	};
	if (Npc_HasItems (other, ItMi_Honigtabak) >= 1)
	{
		Info_AddChoice (DIA_Abuyin_Mischung,PRINT_HONIG,DIA_Abuyin_Mischung_Super);
	};
};	
FUNC VOID DIA_Abuyin_Mischung_BACK()
{
	Info_ClearChoices (DIA_Abuyin_Mischung);
};
FUNC VOID DIA_Abuyin_Mischung_Sumpf ()
{
	B_GiveInvItems (other, self, ItMi_SumpfTabak, 1);
	B_TabakProbieren();
	Info_ClearChoices (DIA_Abuyin_Mischung);
};
FUNC VOID DIA_Abuyin_Mischung_Pilz ()
{
	B_GiveInvItems (other, self, ItMi_PilzTabak, 1);
	B_TabakProbieren();
	Info_ClearChoices (DIA_Abuyin_Mischung);
};
FUNC VOID DIA_Abuyin_Mischung_Doppel ()
{
	B_GiveInvItems (other, self, ItMi_DoppelTabak, 1);
	B_TabakProbieren();
	Info_ClearChoices (DIA_Abuyin_Mischung);
};
FUNC VOID DIA_Abuyin_Mischung_Super ()
{
	
	B_GiveInvItems (other, self, ItMi_Honigtabak, 1);
		
	AI_Output (self, other,"DIA_Abuyin_Mischung_Super_13_00");//Nech mę ten tabák vyzkoušet.
	CreateInvItems (self, ItMi_Joint,1);
	B_UseItem (self, ItMi_Joint);
	AI_Output (self, other,"DIA_Abuyin_Mischung_Super_13_01");//Chutná to pâímo neuvęâitelnę! Nikdy jsem nic lepšího nekouâil!
	AI_Output (self, other,"DIA_Abuyin_Mischung_Super_13_02");//Jak jsi tu smęs pâipravil?
	AI_Output (other, self,"DIA_Abuyin_Mischung_Super_15_03");//Smíchal jsem tabák s medem.
	AI_Output (self, other,"DIA_Abuyin_Mischung_Super_13_04");//To se ti opravdu povedlo, otče umęní mísení. Byl bych potęšen, kdybych smęl své nuzné dýmky naplnit tak vzácnou smęsí.
	AI_Output (other, self,"DIA_Abuyin_Mischung_Super_15_05");//Tak je naplŕ.
	AI_Output (self, other,"DIA_Abuyin_Mischung_Super_13_06");//Díky, synu velkorysosti. Žádná jiná smęs nemůže být tak dobrá jako tato. Koupím od tebe veškerou smęs tohoto druhu, co mi pâineseš.
	
	Abuyin_Honigtabak = TRUE;
	B_GivePlayerXP ((XP_Ambient)*2);
	
	Info_ClearChoices (DIA_Abuyin_Mischung);
};	
// ************************************************************
// 			  Honigtabak verkaufen 
// ************************************************************
INSTANCE DIA_Abuyin_Trade(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Trade_Condition;
	information	= DIA_Abuyin_Trade_Info;
	permanent	= TRUE;
	description	= "Mám pro tebe trochu medového tabáku.";
};                       
FUNC INT DIA_Abuyin_Trade_Condition()
{	
	if (Abuyin_Honigtabak == TRUE)
	&& (Npc_HasItems (other, ItMi_HonigTabak) >= 1) 
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Trade_Info()
{	
	Abuyin_Score = 0;
	
	Abuyin_Score = (Npc_HasItems (other, Itmi_Honigtabak)* Value_Itmi_Honigtabak);
	
	AI_Output (other, self,"DIA_Abuyin_Trade_15_00");//Mám pro tebe trochu medového tabáku.
	
	B_GiveInvItems (other, self, ItmI_HonigTabak, Npc_HasItems (other, Itmi_Honigtabak));
	B_GiveInvItems (self, other, ItmI_Gold, Abuyin_Score);
	
	AI_Output (self, other,"DIA_Abuyin_Trade_13_01");//Obchodovat s tebou je mi neskonalým potęšením.
};
// ************************************************************
// 			  		Herb - KrautPaket
// ************************************************************
INSTANCE DIA_Abuyin_Herb(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Herb_Condition;
	information	= DIA_Abuyin_Herb_Info;
	permanent	= FALSE;
	description	= "Zajímal by tę tenhle balíček trávy?";
};                       
FUNC INT DIA_Abuyin_Herb_Condition()
{	
	if (Npc_HasItems (other, Itmi_Herbpaket) >= 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Herb_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Herb_15_00");//Zajímal by tę tenhle balíček drog?
	AI_Output (self, other,"DIA_Abuyin_Herb_13_01");//Balík bylinek - neâíkej, že to je tráva z bažin. Ó, dej to pryč, synu lehkovážnosti.
	AI_Output (self, other,"DIA_Abuyin_Herb_13_02");//Jestli mę s tím chytí męstské stráže, pošlou mę rovnou za mâíže - a ty nedopadneš o moc lépe!
	AI_Output (self, other,"DIA_Abuyin_Herb_13_03");//Pokud chceš tu zásobu prodat, dám ti jednu radu - opusă tohle męsto.
	AI_Output (self, other,"DIA_Abuyin_Herb_13_04");//Pokus se toho zbavit nękde za hradbami. Všechno, co za to můžeš dostat tady, je spousta trablů.
};
// ************************************************************
// 			  Kannst du mir eine Weissagung geben?
// ************************************************************
INSTANCE DIA_Abuyin_Weissagung(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Weissagung_Condition;
	information	= DIA_Abuyin_Weissagung_Info;
	permanent	= FALSE;
	description	= "Můžeš mi pâedpovędęt budoucnost?";
};                       
FUNC INT DIA_Abuyin_Weissagung_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_du)
	&& (Kapitel == 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Weissagung_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Weissagung_15_00");//Dokážeš mi pâedpovędęt budoucnost?
	AI_Output (self, other,"DIA_Abuyin_Weissagung_13_01");//Za menší poplatek jsem ti k službám, ó otče velkorysosti.
	AI_Output (other, self,"DIA_Abuyin_Weissagung_15_02");//Kolik chceš?
	AI_Output (self, other,"DIA_Abuyin_Weissagung_13_03");//Za pouhých 25 zlatých budu kvůli tobę riskovat pohled skrze čas.
	AI_Output (self, other,"DIA_Abuyin_Weissagung_13_04");//Ale pamatuj - budoucnost je vždycky nejistá. Vše, co mohu udęlat, je zbęžnę prolétnout nękolik útržků času.
};
// ************************************************************
// 			Weisagen lassen Kapitel 1
// ************************************************************
INSTANCE DIA_Abuyin_Zukunft(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Zukunft_Condition;
	information	= DIA_Abuyin_Zukunft_Info;
	permanent	= TRUE;
	description	= "Pâedpovęz mi budoucnost (zaplatit 25 zlaăáků).";
};                    
//---------------------------------------   
var int DIA_Abuyin_Zukunft_permanent;
//---------------------------------------
FUNC INT DIA_Abuyin_Zukunft_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_Weissagung)
	&& (DIA_Abuyin_Zukunft_permanent == FALSE)
	&& (Kapitel == 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Zukunft_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Zukunft_15_00");//Pâedpovęz mi mou budoucnost.
	
	if B_GiveInvItems (other,self, ItMI_Gold, 25)
	{ 
		AI_Output (self, other,"DIA_Abuyin_Zukunft_13_01");//Dobrá, hledači vędomostí. Teë se musím dostat do hypnotického stavu. Jsi pâipraven?
		Info_ClearChoices (DIA_Abuyin_Zukunft);
		Info_AddChoice (DIA_Abuyin_Zukunft,"Jsem pâipraven!",DIA_Abuyin_Zukunft_Trance);
	}
	else 
	{
		AI_Output (self, other,"DIA_Abuyin_Zukunft_13_02");//Ó, otče mincí, žádám tę o 25 zlatých, za to, že nahlédnu do budoucnosti.
	};

};
FUNC VOID DIA_Abuyin_Zukunft_Trance()
{
		AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
		Wld_PlayEffect("SPELLFX_TELEPORT",  self, self, 0, 0, 0, FALSE );
		
		AI_Output (self, other,"DIA_Abuyin_Zukunft_Trance_13_00");//(V transu)... Skâeti... hlídají vstup... stará chodba... Hornické údolí...
		AI_Output (self, other,"DIA_Abuyin_Zukunft_Trance_13_01");//(V transu)... Muž v záâivé zbroji... mág... je s ním tvůj pâítel... čeká na tebe...
		AI_Output (self, other,"DIA_Abuyin_Zukunft_Trance_13_02");//(V transu)... Oheŕ! Útok... mocná stvoâení... plameny... mnoho... jich zemâe...
		
		AI_Output (self, other,"DIA_Addon_Abuyin_Zukunft_Trance_13_00");//(V transu) Copak je tohle...? Męsto... Zâíceniny... Quarhodron v... v Jharkendaru...
		AI_Output (self, other,"DIA_Addon_Abuyin_Zukunft_Trance_13_01");//(V transu)...je vyvolán... Quarhodron v Jharkendaru!
		
		AI_PlayAni  (self,"T_HEASHOOT_2_STAND");
		AI_Output (self, other,"DIA_Abuyin_Zukunft_Trance_13_03");//Je mi líto, ale vize je u konce. Už tu není nic, co bych mohl spatâit.
		
		DIA_Abuyin_Zukunft_permanent = TRUE; 
		Abuyin_Zukunft = 1;
		Info_ClearChoices (DIA_Abuyin_Zukunft);
		
		B_GivePlayerXP ((XP_Ambient*4));
};
// ************************************************************
// 		Kannst du mir noch eine Weissagung geben?
// ************************************************************
INSTANCE DIA_Abuyin_Nochmal(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Nochmal_Condition;
	information	= DIA_Abuyin_Nochmal_Info;
	permanent	= TRUE;
	description	= "Můžeš mi prorokovat ještę nęco jiného?";
};                       
FUNC INT DIA_Abuyin_Nochmal_Condition()
{	
	if (Kapitel == Abuyin_Zukunft)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Nochmal_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Nochmal_15_00");//Můžeš mi udęlat ještę další proroctví?
	AI_Output (self, other,"DIA_Abuyin_Nochmal_13_01");//Ó synu záhadné budoucnosti, není v mé moci poodhalit závoj času.
	AI_Output (self, other,"DIA_Abuyin_Nochmal_13_02");//Pouze pokud mi čas sešle další znamení, budu schopen do nęj nahlédnout znovu.
	
	if (Abuyin_Erzaehlt == FALSE)
	{
		AI_Output (other, self,"DIA_Abuyin_Nochmal_15_03");//A kdy to bude?
		AI_Output (self, other,"DIA_Abuyin_Nochmal_13_04");//Až se budoucnost stane pâítomností a ty budeš pokračovat ve své cestę.
		Abuyin_Erzaehlt = TRUE;
	};
};

//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

FUNC void B_Abuyin_Weissagung ()
{	
	AI_Output (other, self,"B_Abuyin_Weissagung_15_00");//Můžeš mi pâedpovędęt budoucnost?
	AI_Output (self, other,"B_Abuyin_Weissagung_13_01");//Ano, čas postoupil a já ti na oplátku za nękolik mincí sdęlím proroctví.
	AI_Output (other, self,"B_Abuyin_Weissagung_15_02");//Kolik?
};


// ************************************************************
// 			  Kannst du mir eine Weissagung geben?
// ************************************************************
INSTANCE DIA_Abuyin_Weissagung2(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Weissagung2_Condition;
	information	= DIA_Abuyin_Weissagung2_Info;
	permanent	= FALSE;
	description	= "Můžeš mi pâedpovędęt budoucnost?";
};                       
FUNC INT DIA_Abuyin_Weissagung2_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_du)
	&& (Kapitel == 2)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Weissagung2_Info()
{	
	B_Abuyin_Weissagung ();
	AI_Output (self, other,"DIA_Abuyin_Weissagung2_13_00");//Za pouhých 100 zlatých budu kvůli tobę riskovat pohled skrze čas.
};
// ************************************************************
// 			Weisagen lassen Kapitel 2
// ************************************************************
INSTANCE DIA_Abuyin_Zukunft2(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Zukunft2_Condition;
	information	= DIA_Abuyin_Zukunft2_Info;
	permanent	= TRUE;
	description	= "Pâedpovęz mi budoucnost (zaplatit 100 zlaăáků).";
};                    
//---------------------------------------   
var int DIA_Abuyin_Zukunft2_permanent;
//---------------------------------------
FUNC INT DIA_Abuyin_Zukunft2_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_Weissagung2)
	&& (DIA_Abuyin_Zukunft2_permanent == FALSE)
	&& (Kapitel == 2)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Zukunft2_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Zukunft2_15_00");//Pâedpovęz mi mou budoucnost.
	
	if B_GiveInvItems (other,self, ItMI_Gold, 100)
	{ 
		AI_Output (self, other,"DIA_Abuyin_Zukunft2_13_01");//Dobrá, synu udatnosti. Teë se dostanu do hypnotického stavu. Jsi pâipraven?
		
		Info_ClearChoices (DIA_Abuyin_Zukunft2);
		Info_AddChoice (DIA_Abuyin_Zukunft2,"Jsem pâipraven!",DIA_Abuyin_Zukunft2_Trance);
	}
	else 
	{
		AI_Output (self, other,"DIA_Abuyin_Zukunft2_13_02");//Ó otče mincí, žádám tę o 100 zlatých za to, že nahlédnu do budoucnosti.
	};

};	
FUNC VOID DIA_Abuyin_Zukunft2_Trance()
{
	AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",  self, self, 0, 0, 0, FALSE );
	
	AI_Output (self, other,"DIA_Abuyin_Zukunft2_Trance_13_00");//(V transu)... Žoldák... bude tę potâebovat... strašná vražda... Oko...
	AI_Output (self, other,"DIA_Abuyin_Zukunft2_Trance_13_01");//(V transu)... Zlovęstní stoupenci... pâicházejí... hledají tebe... strážce padne...
	AI_Output (self, other,"DIA_Abuyin_Zukunft2_Trance_13_02");//(V transu)... ale tâi se spojí... jedinę pak získáš, co ti náleží...
	
	AI_PlayAni  (self,"T_HEASHOOT_2_STAND");
	AI_Output (self, other,"DIA_Abuyin_Zukunft2_Trance_13_03");//To je vše. Není nic, co bych ještę mohl spatâit.
	
	DIA_Abuyin_Zukunft2_permanent = TRUE; 
	Abuyin_Zukunft = 2;
	Info_ClearChoices (DIA_Abuyin_Zukunft2);
	
	B_GivePlayerXP ((XP_Ambient*4));
};
//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################


// ************************************************************
// 			  Kannst du mir eine Weissagung geben?
// ************************************************************
INSTANCE DIA_Abuyin_Weissagung3(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Weissagung3_Condition;
	information	= DIA_Abuyin_Weissagung3_Info;
	permanent	= FALSE;
	description	= "Můžeš mi pâedpovędęt budoucnost?";
};                       
FUNC INT DIA_Abuyin_Weissagung3_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_du)
	&& (Kapitel == 3)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Weissagung3_Info()
{	
	B_Abuyin_Weissagung ();
	AI_Output (self, other,"DIA_Abuyin_Weissagung3_13_00");//Za pouhých 250 zlatých budu kvůli tobę riskovat pohled skrze čas.
};
// ************************************************************
// 			Weisagen lassen Kapitel 3
// ************************************************************
INSTANCE DIA_Abuyin_Zukunft3(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Zukunft3_Condition;
	information	= DIA_Abuyin_Zukunft3_Info;
	permanent	= TRUE;
	description	= "Pâedpovęz mi budoucnost (zaplatit 250 zlaăáků).";
};                    
//---------------------------------------   
var int DIA_Abuyin_Zukunft3_permanent;
//---------------------------------------
FUNC INT DIA_Abuyin_Zukunft3_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_Weissagung3)
	&& (DIA_Abuyin_Zukunft3_permanent == FALSE)
	&& (Kapitel == 3)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Zukunft3_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Zukunft3_15_00");//Pâedpovęz mi budoucnost.
	
	if B_GiveInvItems (other,self, ItMI_Gold, 250)
	{ 
		AI_Output (self, other,"DIA_Abuyin_Zukunft3_13_01");//Dobrá, synu vędomostí. Teë se dostanu do hypnotického stavu. Jsi pâipraven?
		
		Info_ClearChoices (DIA_Abuyin_Zukunft3);
		Info_AddChoice (DIA_Abuyin_Zukunft3,"Jsem pâipraven!",DIA_Abuyin_Zukunft3_Trance);
	}
	else 
	{
		AI_Output (self, other,"DIA_Abuyin_Zukunft3_13_02");//Ó otče mincí, žádám tę o 250 zlatých za to, že nahlédnu do budoucnosti.
	};

};	
FUNC VOID  DIA_Abuyin_Zukunft3_Trance()
{
	AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",  self, self, 0, 0, 0, FALSE );
	
	AI_Output (self, other,"DIA_Abuyin_Zukunft3_Trance_13_00");//(V transu)... Musíš donutit... co není osud nikoho jiného, pouze tvůj...
	AI_Output (self, other,"DIA_Abuyin_Zukunft3_Trance_13_01");//(V transu)... pâes sníh a oheŕ... pâes led a plameny...
	AI_Output (self, other,"DIA_Abuyin_Zukunft3_Trance_13_02");//(V transu)... Muži v podivné zbroji... bažiny... ještęâi... čekají na tebe...
	
	AI_PlayAni  (self,"T_HEASHOOT_2_STAND");
	AI_Output (self, other,"DIA_Abuyin_Zukunft3_Trance_13_03");//To je vše. Není nic, co bych ještę mohl spatâit.
	
	DIA_Abuyin_Zukunft3_permanent = TRUE; 
	Abuyin_Zukunft = 3;
	Info_ClearChoices (DIA_Abuyin_Zukunft3);
	
	B_GivePlayerXP ((XP_Ambient*4));
};
//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 			  Kannst du mir eine Weissagung geben?
// ************************************************************
INSTANCE DIA_Abuyin_Weissagung4(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Weissagung4_Condition;
	information	= DIA_Abuyin_Weissagung4_Info;
	permanent	= FALSE;
	description	= "Můžeš mi pâedpovędęt budoucnost?";
};                       
FUNC INT DIA_Abuyin_Weissagung4_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_du)
	&& (Kapitel == 4)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Weissagung4_Info()
{	
	B_Abuyin_Weissagung ();
	AI_Output (self, other,"DIA_Abuyin_Weissagung4_13_00");//Za pouhých 500 zlatých budu kvůli tobę riskovat pohled skrze čas.
};
// ************************************************************
// 			Weisagen lassen Kapitel 4
// ************************************************************
INSTANCE DIA_Abuyin_Zukunft4(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Zukunft4_Condition;
	information	= DIA_Abuyin_Zukunft4_Info;
	permanent	= TRUE;
	description	= "Pâedpovęz mi budoucnost (zaplatit 500 zlaăáků).";
};                    
//---------------------------------------   
var int DIA_Abuyin_Zukunft4_permanent;
//---------------------------------------
FUNC INT DIA_Abuyin_Zukunft4_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_Weissagung4)
	&& (DIA_Abuyin_Zukunft4_permanent == FALSE)
	&& (Kapitel == 4)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Zukunft4_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Zukunft4_15_00");//Pâedpovęz mi mou budoucnost.
	
	if B_GiveInvItems (other,self, ItMI_Gold, 500)
	{ 
		AI_Output (self, other,"DIA_Abuyin_Zukunft4_13_01");//Dobrá, synu vędomostí. Teë se dostanu do hypnotického stavu. Jsi pâipraven?
		
		Info_ClearChoices (DIA_Abuyin_Zukunft4);
		Info_AddChoice (DIA_Abuyin_Zukunft4,"Jsem pâipraven!",DIA_Abuyin_Zukunft4_Trance);	
	}
	else 
	{
		AI_Output (self, other,"DIA_Abuyin_Zukunft4_13_02");//Ó otče mincí, žádám tę o 500 zlatých za to, že nahlédnu do budoucnosti.
	};

};
FUNC VOID DIA_Abuyin_Zukunft4_Trance()
{
	AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",  self, self, 0, 0, 0, FALSE );
	
	AI_Output (self, other,"DIA_Abuyin_Zukunft4_Trance_13_00");//(V transu)... Místo vędomostí... jiná zemę... temné místo široko daleko...
	AI_Output (self, other,"DIA_Abuyin_Zukunft4_Trance_13_01");//(V transu)... udatní společníci... musíš zvolit...
	AI_Output (self, other,"DIA_Abuyin_Zukunft4_Trance_13_02");//(V transu)... chrám... leží osamocen v Adanovę âíši... skrytý v mlze...
	
	AI_PlayAni  (self,"T_HEASHOOT_2_STAND");
	AI_Output (self, other,"DIA_Abuyin_Zukunft4_Trance_13_03");//To je vše. Není nic, co bych ještę mohl spatâit.
	
	DIA_Abuyin_Zukunft4_permanent = TRUE; 
	Abuyin_Zukunft = 4;
	Info_ClearChoices (DIA_Abuyin_Zukunft4);
	
	B_GivePlayerXP ((XP_Ambient*4));
};
//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################


// ************************************************************
// 			  Kannst du mir eine Weissagung geben?
// ************************************************************
INSTANCE DIA_Abuyin_Weissagung5(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Weissagung5_Condition;
	information	= DIA_Abuyin_Weissagung5_Info;
	permanent	= FALSE;
	description	= "Můžeš mi pâedpovędęt budoucnost?";
};                       
FUNC INT DIA_Abuyin_Weissagung5_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_du)
	&& (Kapitel == 5)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Weissagung5_Info()
{	
	B_Abuyin_Weissagung ();
	AI_Output (self, other,"DIA_Abuyin_Weissagung5_13_00");//Za pouhých 1000 zlatých budu kvůli tobę riskovat pohled skrze čas.
};
// ************************************************************
// 			Weisagen lassen Kapitel 5
// ************************************************************
INSTANCE DIA_Abuyin_Zukunft5(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Zukunft5_Condition;
	information	= DIA_Abuyin_Zukunft5_Info;
	permanent	= TRUE;
	description	= "Pâedpovęz mi budoucnost (zaplatit 1000 zlaăáků).";
};                    
//---------------------------------------   
var int DIA_Abuyin_Zukunft5_permanent;
//---------------------------------------
FUNC INT DIA_Abuyin_Zukunft5_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_Weissagung5)
	&& (DIA_Abuyin_Zukunft5_permanent == FALSE)
	&& (Kapitel == 5)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Zukunft5_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Zukunft5_15_00");//Pâedpovęz mi mou budoucnost.
	
	if B_GiveInvItems (other,self, ItMI_Gold, 1000)
	{ 
		AI_Output (self, other,"DIA_Abuyin_Zukunft5_13_01");//Dobrá, synu vędomostí. Teë se dostanu do hypnotického stavu. Jsi pâipraven?
		
		Info_ClearChoices (DIA_Abuyin_Zukunft5);
		Info_AddChoice (DIA_Abuyin_Zukunft5,"Jsem pâipraven!",DIA_Abuyin_Zukunft5_Trance);
	}
	else 
	{
		AI_Output (self, other,"DIA_Abuyin_Zukunft5_13_02");//Ó, otče mincí, žádám tę o 1000 zlatých za to, že nahlédnu do budoucnosti.
	};

};
FUNC VOID DIA_Abuyin_Zukunft5_Trance ()
{
	AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",  self, self, 0, 0, 0, FALSE );
	
	AI_Output (self, other,"DIA_Abuyin_Zukunft5_Trance_13_00");//(V transu)... Temnota pohltí zemi... zlo zvítęzí...
	AI_Output (self, other,"DIA_Abuyin_Zukunft5_Trance_13_01");//(V transu)... král prohraje válku se skâety...
	AI_Output (self, other,"DIA_Abuyin_Zukunft5_Trance_13_02");//(V transu)... vrátíš se, ale nenalezneš klidu...
	
	AI_PlayAni  (self,"T_HEASHOOT_2_STAND");
	AI_Output (self, other,"DIA_Abuyin_Zukunft5_Trance_13_03");//To je vše. Není nic, co bych ještę mohl spatâit.
		
	DIA_Abuyin_Zukunft5_permanent = TRUE; 
	Abuyin_Zukunft = 5;
	
	Info_ClearChoices (DIA_Abuyin_Zukunft5);
	
	B_GivePlayerXP ((XP_Ambient*4));
};


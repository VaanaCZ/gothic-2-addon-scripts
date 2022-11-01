//---------------------------------------------------------------------
var int Scatty_Start;
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_EXIT   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 999;
	condition   = DIA_Addon_Scatty_EXIT_Condition;
	information = DIA_Addon_Scatty_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Scatty_EXIT_Condition()	
	{
		return TRUE;
	};
FUNC VOID DIA_Addon_Scatty_EXIT_Info()
{
	AI_StopProcessInfos (self);
	
	if (Scatty_Start == FALSE)
	{
		Npc_ExchangeRoutine (self, "START");
		Scatty_Start = TRUE;
	};
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Scatty_PICKPOCKET (C_INFO)
{
	npc			= BDT_1086_Addon_Scatty;
	nr			= 900;
	condition	= DIA_Addon_Scatty_PICKPOCKET_Condition;
	information	= DIA_Addon_Scatty_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       
FUNC INT DIA_Addon_Scatty_PICKPOCKET_Condition()
{
	C_Beklauen (60, 90);
};
 
FUNC VOID DIA_Addon_Scatty_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Scatty_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Scatty_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Scatty_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Scatty_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Scatty_PICKPOCKET_DoIt);
};

func void DIA_Addon_Scatty_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Scatty_PICKPOCKET);
};
	
func void DIA_Addon_Scatty_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Scatty_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Hi   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_Hi_Condition;
	information = DIA_Addon_Scatty_Hi_Info;
	permanent   = FALSE;
	description = "Come vanno gli affari?";
};
FUNC INT DIA_Addon_Scatty_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Scatty_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Hi_15_00");//Come vanno gli affari?
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_01");//Da quando la tomba è stata aperta, la richiesta è calata.
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_02");//A Raven non servono più gli schiavi ecco perché ora estraggono l'oro. Agli ordini di Bloodwyn.
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_03");//E gli scavatori se la stanno prendendo comoda. (riflette) Gli scavatori che se la prendono comoda non fanno fare buoni affari.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Scatty vende diverse merci.");
};
/*
	Ich bin hier auch sowas wie der Proviantmeister. Wenn du was brauchst, kannst du mit mir handeln. 
	(lacht) Vom Arenameister zum Proviantmeister. Ist das ein Auf-  oder ein Abstieg? 
*/
//---------------------------------------------------------------------
//	Info last
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_last   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_last_Condition;
	information = DIA_Addon_Scatty_last_Info;
	permanent   = FALSE;
	description = "Bloodwyn? La sua parola conta qualcosa da queste parti?";
};
FUNC INT DIA_Addon_Scatty_last_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Hi)
	&& !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_last_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_last_15_00");//Bloodwyn? È lui il capo qui?
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_01");//Ha la supervisione della miniera. Ma non viene quasi mai quaggiù. Passa la maggior parte del suo tempo al tempio con Raven.
	AI_Output (other, self, "DIA_Addon_Scatty_last_15_02");//Che cosa significa esattamente 'quasi mai'?
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_03");//L'ultima volta che l'ho visto è stato quando è uscito dalla tomba
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_04");//(frettolosamente) No, aspetta! L'ultima volta è stato qui quando ha mandato gli schiavi a estrarre l'oro.
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_05");//A differenza di Raven, LUI è molto interessato all'oro.
};
//---------------------------------------------------------------------
//	Info Gruft
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Gruft   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_Gruft_Condition;
	information = DIA_Addon_Scatty_Gruft_Info;
	permanent   = FALSE;
	description = "Che tipo di tomba?";
};
FUNC INT DIA_Addon_Scatty_Gruft_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_HI)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_Gruft_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Gruft_15_00");//Che tipo di tomba?
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_01");//Una tomba maledetta dalla sfortuna! I guardiani della tomba hanno ucciso molti uomini!
	AI_Output (other, self, "DIA_Addon_Scatty_Gruft_15_02");//Guardiani? Parli di quelle creature di pietra? Piuttosto piatte e con la testa rotonda?
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_03");//È proprio questo che intendevo! Sono uscite a decine dalle profondità della pietra.
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_04");//Sapevo fin dall'inizio che era meglio non scavare la tomba.
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_05");//Ma Raven era ossessionato dall'idea di scavare qui. E una volta che la tomba è stata finalmente scoperta, ci è entrato marciando con le sue guardie.
};
//---------------------------------------------------------------------
//	Info GruftAgain
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_GruftAgain   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_GruftAgain_Condition;
	information = DIA_Addon_Scatty_GruftAgain_Info;
	permanent   = FALSE;
	description = "Che cosa cercava Raven, nella tomba?";
};
FUNC INT DIA_Addon_Scatty_GruftAgain_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Gruft)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_GruftAgain_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_00");//Che cosa cercava Raven, nella tomba?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_01");//(si interrompe bruscamente) Mmmh… sei proprio curioso. Mi ricordi un tizio che conoscevo.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_02");//Era curioso proprio come te. E alla fine è stata la sua rovina.
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_03");//Arriva al punto. Cosa è successo nella tomba?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_04");//Beh… Ehm… ho la gola piuttosto secca
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_05");//Senti Scatty, ADESSO NO. È una cosa importante: che cosa ha fatto Raven laggiù?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_06");//D'accordo. (respira profondamente) Ha… ha chiamato… ha evocato qualcosa. Ha continuato a ripetere parole in una lingua straniera.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_07");//Dalla tomba è uscita una gran luce poi ho sentito un grido che mi ha passato da parte a parte: un grido diabolico.
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_08");//E poi?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_09");//Questo è tutto quello che so. In quel momento Bloodwyn è uscito dalla tomba e ha detto che dovevo levarmi di torno. Ed è esattamente quello che ho fatto.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_10");//E non ci è voluto molto prima che Raven e i suoi ragazzi scomparissero nel tempio. Da quel momento Raven non si è più visto.
};
//---------------------------------------------------------------------
//	Info Trinken
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Trinken   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 99;
	condition   = DIA_Addon_Scatty_Trinken_Condition;
	information = DIA_Addon_Scatty_Trinken_Info;
	permanent   = FALSE;
	description = "Gradisci qualcosa da bere?";
};
FUNC INT DIA_Addon_Scatty_Trinken_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Scatty_GruftAgain)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_Trinken_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Trinken_15_00");//Gradisci qualcosa da bere?
	AI_Output (self, other, "DIA_Addon_Scatty_Trinken_01_01");//Una birra andrebbe proprio bene. Al campo di birra ce n'è ben poca.
	AI_Output (self, other, "DIA_Addon_Scatty_Trinken_01_02");//Ma forse Lucia ne ha ancora una bottiglia
};
//---------------------------------------------------------------------
//	Info Bier geben
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Bier   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 99;
	condition   = DIA_Addon_Scatty_Bier_Condition;
	information = DIA_Addon_Scatty_Bier_Info;
	permanent   = FALSE;
	description = "Alla tua salute. (dai la birra)";
};
FUNC INT DIA_Addon_Scatty_Bier_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Trinken)
	&& Npc_HasItems (other, ItFo_beer) 
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_Bier_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Bier_15_00");//Ecco qua.
	
	if B_GiveInvItems (other, self, ItFo_Beer, 1)
	{
		AI_UseItem (self, ItFo_Beer);
	};
	AI_Output (self, other, "DIA_Addon_Scatty_Bier_01_01");//Oh, è proprio buona. Grazie amico. Sei il mio eroe.
	
	B_GivePlayerXP (XP_Ambient* 5);
};

//---------------------------------------------------------------------
//	Info Gold
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Gold   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_Gold_Condition;
	information = DIA_Addon_Scatty_Gold_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};
FUNC INT DIA_Addon_Scatty_Gold_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Scatty_Gold_Info()
{
	B_Say 	  (other, self, "$ADDON_GOLD_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_00");//Prendi in mano un piccone e dai un colpo deciso a un pezzo d'oro: lo sanno fare tutti.
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_01");//Ma in quel modo molte pepite si frantumeranno. Per questo dovrebbero farlo solo le persone che si intendono di estrazione.
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_02");//Posso dirti qualcosa di più quando avrai un po' più di esperienza.

	B_Upgrade_Hero_HackChance(5);
};
//---------------------------------------------------------------------
//	Info teach
//---------------------------------------------------------------------
var int Scatty_teach_perm;
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_teach   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_teach_Condition;
	information = DIA_Addon_Scatty_teach_Info;
	permanent   = TRUE;
	description = "Impara a estrarre l'oro (costo: 2 PA/10 percento)";
};
FUNC INT DIA_Addon_Scatty_teach_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Gold)
	&& (Scatty_teach_perm == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_teach_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_teach_15_00");//Dimmi qualcosa in più su come si estrae l'oro.
	
	if (other.lp >= 1)  
	{
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_01");//Innanzitutto devi sapere che l'oro non è un metallo. È morbido come il burro. Se colpisci troppo forte, va tutto in briciole.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_02");//Ogni scavatore ha i suoi trucchi per ricavare delle pepite decenti dalla roccia.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_03");//In fin dei conti, sono proprio questi trucchi che distinguono uno scavatore qualunque da un bravo scavatore.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_04");//Inoltre, con la pratica si migliora. Puoi migliorare solo scavando e scavando.
		
		other.lp = (other.lp -1);
		B_Upgrade_Hero_HackChance(10);
		Scatty_teach_perm = TRUE;
	}
	else
	{
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};	
};

//---------------------------------------------------------------------
//	Info tot
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_tot   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_tot_Condition;
	information = DIA_Addon_Scatty_tot_Info;
	permanent   = FALSE;
	description = "Bloodwyn è morto.";
};
FUNC INT DIA_Addon_Scatty_tot_Condition()
{	
	if Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_tot_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_tot_15_00");//Bloodwyn è morto.
	AI_Output (self, other, "DIA_Addon_Scatty_tot_01_01");//Ehm, non l'avrei augurato a molta gente, ma Bloodwyn è meglio morto.
};
//---------------------------------------------------------------------
//	Info trade
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_trade   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 99;
	condition   = DIA_Addon_Scatty_trade_Condition;
	information = DIA_Addon_Scatty_trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Scatty_trade_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (other,self,"$TRADE_1");
};



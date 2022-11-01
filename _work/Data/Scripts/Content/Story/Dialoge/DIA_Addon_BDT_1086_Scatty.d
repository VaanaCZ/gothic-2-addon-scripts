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
	description = "Comment vont les affaires ?";
};
FUNC INT DIA_Addon_Scatty_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Scatty_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Hi_15_00");//Comment vont les affaires ?
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_01");//Depuis l'ouverture du tombeau, la demande n'est pas bien grande...
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_02");//Raven n'a plus besoin des esclaves. C'est pour ça qu'ils ont été envoyés à la mine afin d'extraire de l'or, sur l'ordre de Bloodwyn.
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_03");//Depuis, les mineurs se la coulent douce. (marmonne) Quand les mineurs se la coulent douce, les affaires ne vont pas bien.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Scatty propose différentes marchandises.");
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
	description = "Bloodwyn ? Depuis quand sa parole a-t-elle quelque valeur, ici ?";
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
	AI_Output (other, self, "DIA_Addon_Scatty_last_15_00");//Bloodwyn ? Est-ce lui, le responsable ici ?
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_01");//Il supervise la mine, mais il n'y descend pour ainsi dire jamais. Il passe la plupart de son temps à l'intérieur du temple, avec Raven.
	AI_Output (other, self, "DIA_Addon_Scatty_last_15_02");//Qu'entendez-vous exactement, par 'pour ainsi dire' ?
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_03");//La dernière fois que je l'ai vu, il sortait du tombeau...
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_04");//(hâtivement) ...Non, attendez ! La dernière fois qu'il est venu, c'était pour envoyer des esclaves à la mine afin d'extraire de l'or.
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_05");//A la différence de Raven, Bloodwyn s'intéresse BEAUCOUP à l'or.
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
	description = "Quelle sorte de tombeau ?";
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
	AI_Output (other, self, "DIA_Addon_Scatty_Gruft_15_00");//Quelle sorte de tombeau ?
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_01");//Un tombeau maudit, empli de mauvais sorts ! Les gardiens du tombeau ont tué de nombreux hommes !
	AI_Output (other, self, "DIA_Addon_Scatty_Gruft_15_02");//Des gardiens ? Vous parlez des créatures de pierre ? Assez plates, avec une tête ronde ?
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_03");//C'est exactement cela ! Elles sont sorties des profondeurs du tombeau par dizaines !
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_04");//Je savais depuis le début que l'ouverture du tombeau était une mauvaise idée.
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_05");//Mais Raven était obsédé par la volonté d'exhumer ce lieu. Et lorsqu'il est parvenu à ouvrir le tombeau, lui et ses gardes y sont rentrés en force.
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
	description = "Que cherchait Raven dans cette tombe ?";
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
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_00");//Que cherchait Raven dans cette tombe ?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_01");//(s'interrompt) Hum... vous êtes plutôt curieux. Vous me faites penser à un type que j'ai connu, autrefois.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_02");//Il était aussi curieux que vous. Et pour finir, ça lui a coûté la vie.
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_03");//Venez-en aux faits. Que s'est-il passé à l'intérieur du tombeau ?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_04");//Eh bien... heu... j'ai vraiment la gorge sèche.
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_05");//PAS MAINTENANT, Scatty. C'est important - qu'a fait Raven à l'intérieur du tombeau ?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_06");//Bien. (inspire profondément) Il... il a appelé... ou invoqué quelque chose. Il répétait sans cesse des mots dans une langue étrange.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_07");//Une lumière éclatante a inondé le tombeau, et j'ai entendu un cri qui m'a proprement transpercé - un cri vraiment démoniaque.
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_08");//Et ensuite ?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_09");//C'est tout ce que je sais. A cet instant, Bloodwyn est sorti du tombeau et m'a conseillé de déguerpir en vitesse. C'est exactement ce que j'ai fait.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_10");//Raven et ses gars n'ont pas attendu bien longtemps avant de retourner à l'intérieur du temple. Depuis, personne n'a plus vu Raven.
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
	description = "Voulez-vous quelque chose à boire ?";
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
	AI_Output (other, self, "DIA_Addon_Scatty_Trinken_15_00");//Voulez-vous quelque chose à boire ?
	AI_Output (self, other, "DIA_Addon_Scatty_Trinken_01_01");//Une bière serait vraiment la bienvenue. On ne trouve pratiquement plus de bière ici, à l'intérieur du camp.
	AI_Output (self, other, "DIA_Addon_Scatty_Trinken_01_02");//Mais peut-être Lucia en a-t-elle encore une bouteille...
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
	description = "A votre santé ! (donner une bière)";
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
	AI_Output (other, self, "DIA_Addon_Scatty_Bier_15_00");//Tenez.
	
	if B_GiveInvItems (other, self, ItFo_Beer, 1)
	{
		AI_UseItem (self, ItFo_Beer);
	};
	AI_Output (self, other, "DIA_Addon_Scatty_Bier_01_01");//Oh, c'est délicieux. Merci, mon gars. Vous êtes mon héros.
	
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
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_00");//Prenez une pioche, et allez attaquer un bloc d'or - tout le monde sait faire ça.
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_01");//Mais si vous faites ça, les pépites auront tendance à éclater. C'est pourquoi seuls les mineurs expérimentés devraient s'essayer à cela.
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_02");//Je vous en dirai plus lorsque vous aurez acquis davantage d'expérience.

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
	description = "Apprendre à extraire de l'or (Coût : 2 PA/10 pour cent)";
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
	AI_Output (other, self, "DIA_Addon_Scatty_teach_15_00");//Parlez-moi de l'extraction de l'or.
	
	if (other.lp >= 1)  
	{
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_01");//Surtout, gardez à l'esprit que l'or n'est en rien comme du minerai - il est aussi tendre que du beurre. Si vous frappez trop fort, votre pépite éclatera.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_02");//Tous les mineurs ont leurs petits trucs pour extraire des pépites de taille convenable de la roche.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_03");//Au final, ces petits trucs font toute la différence entre un mineur et un bon mineur.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_04");//De plus, vous ne progresserez qu'en pratiquant. Ce n'est qu'au fil du temps que vous deviendrez un meilleur mineur.
		
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
	description = "Bloodwyn est mort.";
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
	AI_Output (other, self, "DIA_Addon_Scatty_tot_15_00");//Bloodwyn est mort.
	AI_Output (self, other, "DIA_Addon_Scatty_tot_01_01");//Hum, je ne souhaite pas cela à grand monde... mais dans le cas de Bloodwyn, c'est mieux ainsi.
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



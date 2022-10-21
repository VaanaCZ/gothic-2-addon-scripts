//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_EXIT   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 999;
	condition   = DIA_Addon_Fisk_EXIT_Condition;
	information = DIA_Addon_Fisk_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Fisk_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Fisk_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Fisk_PICKPOCKET (C_INFO)
{
	npc			= BDT_1097_Addon_Fisk;
	nr			= 900;
	condition	= DIA_Addon_Fisk_PICKPOCKET_Condition;
	information	= DIA_Addon_Fisk_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       
FUNC INT DIA_Addon_Fisk_PICKPOCKET_Condition()
{
	C_Beklauen (118, 300);
};
 
FUNC VOID DIA_Addon_Fisk_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Fisk_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Fisk_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Fisk_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Fisk_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Fisk_PICKPOCKET_DoIt);
};

func void DIA_Addon_Fisk_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Fisk_PICKPOCKET);
};
	
func void DIA_Addon_Fisk_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Fisk_PICKPOCKET);
};
//--------------------------------------------------------------------
//	Info Hi
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Hi   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 1;
	condition   = DIA_Addon_Fisk_Hi_Condition;
	information = DIA_Addon_Fisk_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Fisk_Hi_Condition()
{	
	if (Npc_GetDistToWP (self, "BL_INN_UP_06") > 500)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Fisk_Hi_12_00");//Hé, si vous recherchiez un bon marchand dans ce camp, vous venez de le trouver !
	AI_Output (self, other, "DIA_Addon_Fisk_Hi_12_01");//Ma cabane se trouve derrière celle d'Esteban. Alors si vous avez besoin de quelque chose, venez faire un tour.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Fisk propose toutes sortes de marchandises.");
	
	AI_StopProcessInfos  (self);
	Npc_ExchangeRoutine  (self,"START");
};
//--------------------------------------------------------------------
//	Info Trade
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Trade   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 888;
	condition   = DIA_Addon_Fisk_Trade_Condition;
	information = DIA_Addon_Fisk_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;

};
FUNC INT DIA_Addon_Fisk_Trade_Condition()
{	
	if (Npc_GetDistToWP (self, "BL_INN_UP_06") > 500)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Trade_Info()
{
	B_Say (other,self,"$TRADE_2");
	B_GiveTradeInv(self);
	
	//Bolzen nachfüllen
	if (Npc_HasItems (self, ItRw_Bolt) < 50)
	{
		CreateInvItems (self,ItRw_Bolt, (50 - Npc_HasItems (self, ItRw_Bolt))); 
	};
	//Pfeile nachfüllen
	if (Npc_HasItems (self, ItRw_Arrow) < 50)
	{
		CreateInvItems (self,ItRw_Arrow, (50 - Npc_HasItems (self, ItRw_Arrow))); 
	};
};
//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
instance DIA_Addon_Fisk_Attentat   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 2;
	condition   = DIA_Addon_Fisk_Attentat_Condition;
	information = DIA_Addon_Fisk_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Fisk_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_00"); //Ecoutez, je ne veux rien avoir à faire avec ça, compris ?!
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_01"); //(innocemment) J'ai mes propres ennuis... je suis moi-même une victime.
	AI_Output (other, self, "DIA_Addon_Fisk_Attentat_15_02"); //C'est-à-dire ?
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_03"); //J'ai versé beaucoup d'or pour ma dernière livraison.
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_04"); //Mais elle n'est jamais arrivée à bon port. Un quelconque fumier a dû s'en emparer.
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_05"); //(outré) J'ai été volé - probablement par quelqu'un parmi les nôtres !
};

//---------------------------------------------------------------------
//	Lieferung
//---------------------------------------------------------------------
instance DIA_Addon_Fisk_Lieferung   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 3;
	condition   = DIA_Addon_Fisk_Lieferung_Condition;
	information = DIA_Addon_Fisk_Lieferung_Info;
	permanent   = FALSE;
	description	= "Quelle sorte de livraison ?";
};
FUNC INT DIA_Addon_Fisk_Lieferung_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Fisk_Attentat))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Lieferung_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Lieferung_15_00"); //Quelle sorte de livraison ?
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_01"); //Un paquet de crochets. Quelqu'un devait se rendre chez les pirates et me les ramener.
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_02"); //Mais un type nommé Juan me les a pris. (furieux) Il m'a aussi dérobé l'or que j'ai versé pour les crochets !
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_03"); //Ce fumier se cache quelque part dans les marais.
	
	MIS_Lennar_Lockpick = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Addon_Fisk,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Fisk,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_KillJuan,"Un type nommé Juan était impliqué dans les affaires des bandits. Apparemment, il se terre quelque part aux confins des marais.");
	B_LogEntry (Topic_Addon_Fisk,"Un type nommé Juan a subtilisé la livraison (un lot de crochets) à Fisk. Il se terre quelque part dans les marais.");
};
	
//---------------------------------------------------------------------
//	Paket abgeben 
//---------------------------------------------------------------------
	func void B_Addon_Fisk_AboutJuan()
	{	
		if (Npc_IsDead(Juan))
		{
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_00"); //Il est mort.
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_01"); //Bien, alors il ne me causera plus d'ennuis...
		}
		else
		{
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_02"); //Il est toujours en vie...
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_03"); //Vous avez laissé ce fumier en vie ?
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_04"); //Il n'était pas seul...
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_05"); //Aucune importance - je m'occuperai moi-même de cette vermine...
		};
	};
//---------------------------------------------------------------------
	func void B_Addon_Fisk_Belohnung()
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_00"); //En ce qui vous concerne...
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_01"); //Je suis en bons termes avec Huno.
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_02"); //Je veillerai à ce que vous puissiez obtenir votre armure à bon prix, dorénavant.
		Huno_ArmorCheap = TRUE;
		
		if (other.guild  == GIL_KDF)
		{
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_03"); //Et tenez - cette gemme m'a autrefois été remise par Corristo.
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_04"); //C'est la seule chose qui ait survécu à ma fuite par-delà la Barrière. Je pense qu'elle vous sera plus utile qu'à moi.
			B_GiveInvItems (self, other, ItMi_RuneBlank,1);
		}
		else 
		{
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_05"); //Je vais aussi vous donner l'une de mes armes.
		
			if (other.HitChance[NPC_TALENT_2H] > other.HitChance[NPC_TALENT_1H])   
			{
				B_GiveInvItems (self, other, ItMw_Streitaxt1,1);
			}
			else //1h größer oder beide gleich
			{
				B_GiveInvItems (self, other, ItMw_Bartaxt,1);
			};
		};
		
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_06"); //(avec malice) Une main lave l'autre - ça n'a pas changé avec le temps.
	};
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_GivePaket (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 4;
	condition   = DIA_Addon_Fisk_GivePaket_Condition;
	information = DIA_Addon_Fisk_GivePaket_Info;
	permanent   = FALSE;
	description = "J'ai votre paquet.";
};
FUNC INT DIA_Addon_Fisk_GivePaket_Condition()
{	
	if (MIS_Lennar_Lockpick == LOG_RUNNING)
	&& (Npc_HasItems (other, ItMi_Addon_Lennar_Paket) >= 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_GivePaket_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_GivePaket_15_00"); //J'ai votre paquet.
	B_GiveInvItems (other, self, ItMi_Addon_Lennar_Paket, 1);
	
	MIS_Lennar_Lockpick = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_LennarPaket);
	
	AI_Output (self, other, "DIA_Addon_Fisk_GivePaket_12_01"); //(content) En effet ! (soupçonneux) Et Juan ?
	
	B_Addon_Fisk_AboutJuan();
	
	B_Addon_Fisk_Belohnung();
};

//---------------------------------------------------------------------
//	Paket OPEN - 
//---------------------------------------------------------------------
instance DIA_Addon_Fisk_PaketOpen (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 5;
	condition   = DIA_Addon_Fisk_PaketOpen_Condition;
	information = DIA_Addon_Fisk_PaketOpen_Info;
	permanent   = FALSE;
	description = "J'ai ouvert votre paquet !";
};
FUNC INT DIA_Addon_Fisk_PaketOpen_Condition()
{	
	if (MIS_Lennar_Lockpick == LOG_RUNNING)
	&& (LennarPaket_Open == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_PaketOpen_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_PaketOpen_15_00"); //J'ai ouvert votre paquet !
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_01"); //(rit) Bien sûr ! Vous ne pouviez pas attendre, hein ?!
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_02"); //Vous avez toujours les crochets, au moins ?
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_03"); //Et, plus important encore, qu'est devenu Juan ?

	B_Addon_Fisk_AboutJuan();
};

//---------------------------------------------------------------------
//	- Dietriche abgeben! 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_GivePicks (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 6;
	condition   = DIA_Addon_Fisk_GivePicks_Condition;
	information = DIA_Addon_Fisk_GivePicks_Info;
	permanent   = TRUE;
	description = "Voici votre lot de crochets...";
};
FUNC INT DIA_Addon_Fisk_GivePicks_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Fisk_PaketOpen))
	&& (MIS_Lennar_Lockpick == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_GivePicks_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_GivePicks_15_00"); //Voici une douzaine de crochets...

	if (B_GiveInvItems (other, self, itke_lockpick, 12))
	{
		AI_Output (self, other, "DIA_Addon_Fisk_GivePicks_12_01"); //Très bien. Certaines personnes attendent déjà la nouvelle marchandise.
		B_Addon_Fisk_Belohnung();
		
		MIS_Lennar_Lockpick = LOG_SUCCESS;
		B_GivePlayerXP (XP_Addon_LennarPaket);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Fisk_GivePicks_12_02"); //Il n'y en a pas une douzaine ! (fielleux) Vous n'essayeriez pas de me berner, par hasard ?
	};
};


//---------------------------------------------------------------------
//	Inspektor
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Inspektor (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 7;
	condition   = DIA_Addon_Fisk_Inspektor_Condition;
	information = DIA_Addon_Fisk_Inspektor_Info;
	permanent   = FALSE;
	description = "Juan travaillait pour Esteban !";
};
FUNC INT DIA_Addon_Fisk_Inspektor_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Fisk_Lieferung))
	&& (Npc_KnowsInfo (other, DIA_Addon_Tom_Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Inspektor_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_15_00"); //Juan travaillait pour Esteban !
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_01"); //(sidéré) Quoi ?
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_15_02"); //Ne jouez pas à ça avec moi ! Vous le saviez !
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_03"); //(calmement) Bon... vous avez raison. Mais j'espère que vous comprenez également pourquoi je ne vous en ai pas parlé.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_04"); //Tout le monde dans le camp sait que vous travaillez pour Esteban.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_05"); //Je n'ai aucunement l'intention de me laisser entraîner dans vos affaires simplement parce que vous brûlez d'envie de vous emparer d'une pierre rouge...
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"Je ne travaille pas vraiment pour Esteban...",DIA_Addon_Fisk_Inspektor_AntiEsteban);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"Je ne vous crois pas !",DIA_Addon_Fisk_Inspektor_DontBelieve);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"Je vois.",DIA_Addon_Fisk_Inspektor_ISee);
};

func void DIA_Addon_Fisk_Inspektor_ISee()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_ISee_15_00"); //Je vois !
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_ISee_12_01"); //Bien ! Alors restons-en là. Il ne faudrait pas que quelqu'un nous entende.
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_DontBelieve()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_DontBelieve_15_00"); //Je ne vous crois pas !
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_DontBelieve_12_01"); //Croyez ce que vous voulez. Mais je vous préviens, si vous comptez raconter je ne sais quelle légende sur moi à Esteban, vous êtes le prochain sur la liste !
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_AntiEsteban()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_AntiEsteban_15_00"); //En réalité, je ne travaille pas vraiment pour Esteban...
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_01"); //Et alors ? Vous essayez de berner ce vieux singe ?
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_02"); //Dans ce cas, je vous donne un conseil : gardez cela pour vous.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_03"); //Lorsque vous parlez d'Esteban, ne faites confiance à PERSONNE - pas même à moi, compris ?
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_04"); //Cela suffit, maintenant - il ne faudrait pas que quelqu'un nous entende !
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

//--------------------------------------------------------------------
//	Info Meeting
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Meeting   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 2;
	condition   = DIA_Addon_Fisk_Meeting_Condition;
	information = DIA_Addon_Fisk_Meeting_Info;
	permanent   = FALSE;
	description = "Alors, c'est VOUS, le commanditaire de l'attaque.";
};
FUNC INT DIA_Addon_Fisk_Meeting_Condition()
{	
	if (Npc_GetDistToWP  (self, "BL_INN_UP_06") <= 500)
	&& (Npc_IsInState (self, ZS_Talk))
	&& (MIS_Judas == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Meeting_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_15_00");//Alors, c'est VOUS, le commanditaire de l'attaque.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_01");//Oui. Esteban se mêle trop de mes affaires.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_02");//Il refuse à tous les bandits qui travaillent pour moi le droit d'entrer à la mine. Il veille à ce que TOUT LE MONDE travaille pour lui - et uniquement pour lui.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_03");//Ainsi, il empoche un pourcentage de toutes les transactions et s'assure également le contrôle du camp tout entier.
	
	Info_ClearChoices (DIA_Addon_Fisk_Meeting);
	
	Info_AddChoice (DIA_Addon_Fisk_Meeting,"Que comptez-vous faire maintenant ?",DIA_Addon_Fisk_Meeting_now);
	Info_AddChoice (DIA_Addon_Fisk_Meeting,"Vous aspirez à prendre sa place ?",DIA_Addon_Fisk_Meeting_You);
	if (!Npc_IsDead(Esteban))
	{
		Info_AddChoice (DIA_Addon_Fisk_Meeting,"Je pourrais vous dénoncer à Esteban...",DIA_Addon_Fisk_Meeting_sell);
	};
};
FUNC VOID DIA_Addon_Fisk_Meeting_You()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_You_15_00");//Vous aspirez à prendre sa place ?
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_You_12_01");//Non, je ne suis qu'un marchand. Je veux juste qu'on me laisse conclure mes affaires en paix.
};
FUNC VOID DIA_Addon_Fisk_Meeting_sell()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_sell_15_00");//Je pourrais vous dénoncer à Esteban...
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_sell_12_01");//Et après ? Selon vous, qu'arrivera-t-il ensuite ? Vous pensez qu'il cèdera à vos demandes ?
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_sell_12_02");//Laissez tomber - j'ai une meilleure idée.
};
FUNC VOID DIA_Addon_Fisk_Meeting_now()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_00");//Que comptez-vous faire ?
	
	if (!Npc_IsDead (Esteban))
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_01");//Nous allons éliminer Esteban. Ça signifie que VOUS le tuerez et vous prendrez sa place.
		AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_02");//Aussi longtemps que ses gardes du corps seront à ses côtés, je n'ai pas la moindre chance.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_03");//Dans ce cas, nous allons devoir les inciter à le laisser seul - en leur disant la vérité.
		AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_04");//Quelle vérité ?
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_05");//Vous avez fait votre travail. Vous savez que je suis le commanditaire de l'attaque.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_06");//Allez le dire à Esteban, et il enverra ses gardes me tuer. Je les attendrai ici.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_07");//Lorsqu'ils seront partis, vous pourrez vous occuper de ce fumier pendant que je m'occuperai des gardes.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_08"); //Esteban est mort. Je peux à nouveau me consacrer à mes affaires...
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_09"); //Tenez, c'est pour vous...
		B_GiveInvItems (self, other, itmi_gold, 500);
	};
	
	Info_ClearChoices (DIA_Addon_Fisk_Meeting);
	MIS_Judas = LOG_SUCCESS;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"AMBUSH");
	B_LogEntry (Topic_Addon_Esteban, "Fisk a fomenté la tentative d'assassinat d'Esteban.");
};
//--------------------------------------------------------------------
//	Info Sieg
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Sieg   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 2;
	condition   = DIA_Addon_Fisk_Sieg_Condition;
	information = DIA_Addon_Fisk_Sieg_Info;
	permanent   = FALSE;
	description = "Esteban n'est plus qu'un mauvais souvenir.";
};
FUNC INT DIA_Addon_Fisk_Sieg_Condition()
{	
	if (MIS_Judas == LOG_SUCCESS)
	&&  Npc_IsDead (Esteban)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Sieg_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Sieg_15_00");//Esteban n'est plus qu'un mauvais souvenir.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_01");//J'ai longtemps attendu cet instant.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_02");//Je crois que vous avez bien des choses à faire, quant à moi, je dois retourner à mes petites affaires.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_03");//Alors si vous avez besoin d'autre chose, vous savez où me trouver.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "START");
	B_GivePlayerXP (XP_Ambient); 
};


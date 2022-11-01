///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Baltram_EXIT   (C_INFO)
{
	npc         = VLK_410_Baltram;
	nr          = 999;
	condition   = DIA_Baltram_EXIT_Condition;
	information = DIA_Baltram_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Baltram_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Baltram_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////AUSKOMMENTIERT WEGEN ADDON M.F. (Missionen passen nicht mehr, Spielfluß hemmend)
//	Info Sperre
///////////////////////////////////////////////////////////////////////
/*
instance DIA_Baltram_Sperre		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	1;
	condition	 = 	DIA_Baltram_Sperre_Condition;
	information	 = 	DIA_Baltram_Sperre_Info;
	permanent	 =  TRUE;
	important	 = 	TRUE;
};
func int DIA_Baltram_Sperre_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&& (Npc_IsInState (self, ZS_Talk ))
	&& ((!Npc_KnowsInfo (other, DIA_Addon_Baltram_LaresAbloese))
	|| (SCIsWearingRangerRing == FALSE))
	{
		return TRUE;
	};
};
func void DIA_Baltram_Sperre_Info ()
{
	AI_Output (self, other, "DIA_Baltram_Sperre_01_00"); //Was willst du? Du bist ein Sträfling aus der Minenkolonie. Mit dir mache ich keine Geschäfte!
	AI_StopProcessInfos (self);	 
};
*/
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Hallo		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	2;
	condition	 = 	DIA_Baltram_Hallo_Condition;
	information	 = 	DIA_Baltram_Hallo_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Baltram_Hallo_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	//&& (Canthar_Sperre == FALSE)
	&& (MIS_Nagur_Bote == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Baltram_Hallo_Info ()
{
	if (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_Baltram_Hallo_01_00"); //Bienvenue, étranger. Je me nomme Baltram. Vous venez vous approvisionner en nourriture ?
		AI_Output (self, other, "DIA_Baltram_Hallo_01_01"); //J'ai bien peur de devoir vous décevoir, mais je n'ai pas grand-chose en stock, en ce moment.
		AI_Output (self, other, "DIA_Baltram_Hallo_01_02"); //Mais j'attends une nouvelle livraison prochainement.
	}
	else
	{
		AI_Output (self, other, "DIA_Baltram_Hallo_01_03"); //Si vous venez m'acheter de la nourriture, autant repartir sans attendre.
		AI_Output (self, other, "DIA_Baltram_Hallo_01_04"); //Je n'ai pas une haute opinion des mercenaires tels que vous. Vous ne faites que causer des ennuis aux honnêtes gens.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info LaresAbloese
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Baltram_LaresAbloese		(C_INFO)
{
	npc		 	= VLK_410_Baltram;
	nr		 	= 1;
	condition	= DIA_Addon_Baltram_LaresAbloese_Condition;
	information	= DIA_Addon_Baltram_LaresAbloese_Info;

	important 	= TRUE;
};

func int DIA_Addon_Baltram_LaresAbloese_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (SCIsWearingRangerRing == TRUE)
	&& (MIS_Lares_BringRangerToMe == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Baltram_LaresAbloese_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_00"); //Pourquoi semblez-vous si sceptique ?
	AI_Output	(self, other, "DIA_Addon_Baltram_LaresAbloese_01_01"); //Je vois que vous portez le signe de l'Anneau de l'eau.
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_02"); //Êtes-vous aussi un membre ?
	AI_Output	(self, other, "DIA_Addon_Baltram_LaresAbloese_01_03"); //Quand bien même j'en serai un ?
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_04"); //Alors je vous pourrais vous dire que Lares souhaite être relevé de son poste là-bas au port.
	AI_Output	(self, other, "DIA_Addon_Baltram_LaresAbloese_01_05"); //Parfait. S'il en est ainsi, je vais voir si quelqu'un peut s'en occuper.
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_06"); //Je vois.
	B_GivePlayerXP (XP_Ambient);

	B_LogEntry (TOPIC_Addon_BringRangerToLares,"Baltram, le commerçant de la place du marché, veillera à ce que Lares soit relâché. Peut-être que Lares pourrait quitter le port dès maintenant."); 

	SC_KnowsBaltramAsRanger = TRUE;
	Baltram_Exchange4Lares = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Job
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Job		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	3;
	condition	 = 	DIA_Baltram_Job_Condition;
	information	 = 	DIA_Baltram_Job_Info;
	permanent	 =  FALSE;
	description  =  "Avez-vous du travail pour moi ?";
};
func int DIA_Baltram_Job_Condition ()
{
	if (MIS_Nagur_Bote != LOG_RUNNING)
	&& (MIS_Nagur_Bote != LOG_SUCCESS)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
func void DIA_Baltram_Job_Info ()
{
	AI_Output (other, self, "DIA_Baltram_Job_15_00"); //Vous avez du travail pour moi ?
	AI_Output (self, other, "DIA_Baltram_Job_01_01"); //Non, j'ai déjà un garçon de courses. Demandez aux autres marchands.
};
///////////////////////////////////////////////////////////////////////
//	Info Trick
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Trick		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	4;
	condition	 = 	DIA_Baltram_Trick_Condition;
	information	 = 	DIA_Baltram_Trick_Info;
	permanent	 =  FALSE;
	important 	 =  TRUE;
};
func int DIA_Baltram_Trick_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_Nagur_Bote == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Baltram_Trick_Info ()
{
	AI_Output (self, other, "DIA_Baltram_Trick_01_00"); //Vous êtes à la recherche d'un emploi ?
	AI_Output (other, self, "DIA_Baltram_Trick_15_01"); //Oui. C'est à quel sujet ?
	AI_Output (self, other, "DIA_Baltram_Trick_01_02"); //Mon garçon de courses ne revient pas et j'attends une livraison en provenance d'Akil le fermier.
	AI_Output (other, self, "DIA_Baltram_Trick_15_03"); //Combien ça me rapporte ?
	AI_Output (self, other, "DIA_Baltram_Trick_01_04"); //Je suis prêt à vous payer 50 pièces d'or.
	AI_Output (other, self, "DIA_Baltram_Trick_15_05"); //D'accord, ça me va.
	AI_Output (self, other, "DIA_Baltram_Trick_01_06"); //Très bien. Dites à Akil que c'est moi qui vous envoie et ramenez-moi le paquet qu'il vous confiera.
	
	MIS_Baltram_ScoutAkil = LOG_RUNNING;
	B_LogEntry (TOPIC_Nagur,"Baltram m'a engagé comme coursier. Je dois m'occuper d'une livraison à la ferme d'Akil.");
	
	Log_CreateTopic (TOPIC_Baltram,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Baltram,LOG_RUNNING);
	B_LogEntry (TOPIC_Baltram, "Si j'apporte à Baltram sa livraison, il me donnera 50 pièces d'or.");
};
///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
var int Baltram_TradeLOG;
// --------------------------------------------------------------
instance DIA_Baltram_WAREZ		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	2;
	condition	 = 	DIA_Baltram_WAREZ_Condition;
	information	 = 	DIA_Baltram_WAREZ_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Montrez-moi vos marchandises.";
};

func int DIA_Baltram_WAREZ_Condition ()
{
	return TRUE;
};
func void DIA_Baltram_WAREZ_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self,"DIA_Baltram_WAREZ_15_00"); //Montrez-moi vos marchandises.
	
	if (Baltram_TradeLOG == FALSE)
	{
		Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
		B_LogEntry (Topic_CityTrader,"Baltram vend de la nourriture sur la place du marché.");
		Baltram_TradeLOG = TRUE;
	};
	
	if (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_01"); //Jamais la situation n'aurait dû dégénérer à ce point. L'un des mercenaires a tué un paladin.
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_02"); //Il fallait bien qu'on en arrive là un jour ou l'autre.
	};
	if ((MIS_BaltramTrade != LOG_SUCCESS)
	&& ((hero.guild == GIL_SLD)
	||  (hero.guild == GIL_DJG)))
	{
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_03"); //Les gens comme vous n'obtiendront jamais rien de moi.
		AI_Output (other, self,"DIA_Baltram_WAREZ_15_04"); //Pourquoi ?
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_05"); //Vous commencez par provoquer l'agitation chez les fermiers et après, vous faites comme s'il ne s'était rien passé.
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_06"); //Fichez-moi le camp, vous faites fuir mes clients.
		
		MIS_BaltramTrade = LOG_FAILED;
		
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Skip
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Baltram_Skip		(C_INFO)
{
	npc		 = 	VLK_410_Baltram;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Baltram_Skip_Condition;
	information	 = 	DIA_Addon_Baltram_Skip_Info;

	description	 = 	"Vous faites affaires avec les pirates ?";
};

func int DIA_Addon_Baltram_Skip_Condition ()
{
	if (SCKnowsBaltramAsPirateTrader == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Baltram_Skip_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Baltram_Skip_15_00"); //(mine de rien) Vous traitez avec les pirates ?
	AI_Output	(self, other, "DIA_Addon_Baltram_Skip_01_01"); //(se sentant pris au piège) Quoi ? Qui vous a dit cela ?
	AI_Output	(other, self, "DIA_Addon_Baltram_Skip_15_02"); //J'ai parlé à l'un d'eux. Il semble vous attendre dans sa crique.
	AI_Output	(self, other, "DIA_Addon_Baltram_Skip_01_03"); //Que pouvez-vous faire ? Les temps sont durs. Chacun doit se débrouiller.
	
	Info_ClearChoices	(DIA_Addon_Baltram_Skip);
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "N'aviez-vous pas peur d'être pris ?", DIA_Addon_Baltram_Skip_erwischen );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Vous mesurez les conséquences que cela aura !", DIA_Addon_Baltram_Skip_MIL );
};
func void DIA_Addon_Baltram_Skip_Back ()
{
	AI_Output (other, self, "DIA_Addon_Baltram_Skip_Back_15_00"); //C'est tout ce que je voulais savoir.
	Info_ClearChoices	(DIA_Addon_Baltram_Skip);
};

func void DIA_Addon_Baltram_Skip_MIL ()
{
	AI_Output (other, self, "DIA_Addon_Baltram_Skip_MIL_15_00"); //Vous mesurez les conséquences que cela aura !
	AI_Output (self, other, "DIA_Addon_Baltram_Skip_MIL_01_01"); //Hé, écoutez. Je vais vous dire ce que je sais et en contrepartie,  vous ne me dénoncez pas, d'accord ?
	
	Info_ClearChoices (DIA_Addon_Baltram_Skip);
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Qu'est-ce que vous leur vendez ?", DIA_Addon_Baltram_Skip_was );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Que savez-vous sur les pirates ?", DIA_Addon_Baltram_Skip_pirat );
};

func void DIA_Addon_Baltram_Skip_erwischen ()
{
	AI_Output (other, self, "DIA_Addon_Baltram_Skip_erwischen_15_00"); //N'aviez-vous pas peur d'être pris ?
	AI_Output (self, other, "DIA_Addon_Baltram_Skip_erwischen_01_01"); //Ça peut arriver. Vous m'avez bien trouvé.
	AI_Output (self, other, "DIA_Addon_Baltram_Skip_erwischen_01_02"); //Mais vous vous tairez, n'est-ce pas ?
	
	Info_ClearChoices	(DIA_Addon_Baltram_Skip);
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Qu'est-ce que vous leur vendez ?", DIA_Addon_Baltram_Skip_was );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Que savez-vous sur les pirates ?", DIA_Addon_Baltram_Skip_pirat );
};

func void DIA_Addon_Baltram_Skip_was ()
{
	AI_Output			(other, self, "DIA_Addon_Baltram_Skip_was_15_00"); //(brusque) Que trafiquez-vous?
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_was_01_01"); //Je les approvisionne principalement en nourriture.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_was_01_02"); //Et pour cela, ils me donnent le meilleur rhum de Khorinis.
	
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "C'est tout ce que je voulais savoir.", DIA_Addon_Baltram_Skip_Back );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Je pourrais assurer cette transaction pour vous...", DIA_Addon_Baltram_Skip_Ich );
};

func void DIA_Addon_Baltram_Skip_Ich ()
{
	AI_Output			(other, self, "DIA_Addon_Baltram_Skip_Ich_15_00"); //(sourit) Je pourrais m'occuper de cela à votre place.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_Ich_01_01"); //Ça serait fantastique. Je ne peux pas quitter Khorinis en ce moment.
	CreateInvItems (self, ItMi_Packet_Baltram4Skip_Addon, 1);									
	B_GiveInvItems (self, other, ItMi_Packet_Baltram4Skip_Addon, 1);		
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_Ich_01_02"); //Voici, prenez ce paquet et dites à Skip de ne pas être si chiche sur le rhum la prochaine fois.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_Ich_01_03"); //Il devrait y avoir au moins 3 bouteilles.
	
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,"Baltram m'a remis un paquet, que je dois aller porter à Skip."); 
	
	MIS_Addon_Baltram_Paket4Skip = LOG_RUNNING;
};

func void DIA_Addon_Baltram_Skip_pirat ()
{
	AI_Output			(other, self, "DIA_Addon_Baltram_Skip_pirat_15_00"); //(brusque) Que savez-vous sur les pirates ?
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_01"); //(rapidement) Ils vivent au fin fond de l'île de Khorinis.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_02"); //On ne peut s'y rendre qu'en bateau, autant que je sache.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_03"); //Les citoyens de Khorinis en ont peur. À juste titre, car ce ne sont rien d'autre qu'un ramassis de sales assassins
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_04"); //Mais si vous me demandez, ils ne sont pas du tout aussi pourris que les bandits.
};

///////////////////////////////////////////////////////////////////////
//	Info SkipsRum
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Baltram_SkipsRum		(C_INFO)
{
	npc		 = 	VLK_410_Baltram;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Baltram_SkipsRum_Condition;
	information	 = 	DIA_Addon_Baltram_SkipsRum_Info;

	description	 = 	"Je vous apporte le rhum de la part de Skip.";
};

func int DIA_Addon_Baltram_SkipsRum_Condition ()
{
	
	if (Skip_Rum4Baltram == TRUE)
	&& (MIS_Addon_Baltram_Paket4Skip == LOG_RUNNING)
	&& (Npc_HasItems (other,ItFo_Addon_Rum) >= 2)
		{
			return TRUE;
		};
};

func void DIA_Addon_Baltram_SkipsRum_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Baltram_SkipsRum_15_00"); //C'est Skip qui m'a donné le rhum. Mais il ne m'a donné que deux bouteilles.
	AI_Output	(self, other, "DIA_Addon_Baltram_SkipsRum_01_01"); //(acerbe) Diantre, c'est cher. Pour qui se prend-il ? Et bien alors donnez-les moi.
	B_GiveInvItems (other, self, ItFo_Addon_Rum,2); 
	AI_Output	(self, other, "DIA_Addon_Baltram_SkipsRum_01_02"); //Je peux pas vous en donner plus en ce moment. Cela devra faire l'affaire.
	CreateInvItems (self, ItMi_Gold, 10);									
	B_GiveInvItems (self, other, ItMi_Gold, 10);		

	TOPIC_END_BaltramSkipTrade = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info AkilsHof
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_AkilsHof		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  4;
	condition	 = 	DIA_Baltram_AkilsHof_Condition;
	information	 = 	DIA_Baltram_AkilsHof_Info;
	permanent	 =  FALSE;
	description	 = 	"Où puis-je trouver la ferme d'Akil ?";
};
func int DIA_Baltram_AkilsHof_Condition ()
{
	if (MIS_Baltram_ScoutAkil == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Baltram_AkilsHof_Info ()
{
	AI_Output (other, self, "DIA_Baltram_AkilsHof_15_00"); //Où puis-je trouver la ferme d'Akil ?
	AI_Output (self, other, "DIA_Baltram_AkilsHof_01_01"); //Prenez la porte sud et suivez la route menant au sud-est.
	AI_Output (self, other, "DIA_Baltram_AkilsHof_01_02"); //Vous finirez par arriver à un escalier en pierre. Empruntez-le et vous verrez la ferme d'Akil dès que vous arriverez en haut.
};
///////////////////////////////////////////////////////////////////////
//	Info Lieferung geholt
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Lieferung	(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  5;
	condition	 = 	DIA_Baltram_Lieferung_Condition;
	information	 = 	DIA_Baltram_Lieferung_Info;
	permanent 	 =  FALSE;
	description	 = 	"J'ai la livraison d'Akil.";
};

func int DIA_Baltram_Lieferung_Condition ()
{
	if (Npc_HasItems (other, ItMi_BaltramPaket) >=1)
	{
		return TRUE;
	};
};
func void DIA_Baltram_Lieferung_Info ()
{
	AI_Output (other, self, "DIA_Baltram_Lieferung_15_00"); //J'ai le paquet d'Akil.
	AI_Output (self, other, "DIA_Baltram_Lieferung_01_01"); //Excellent ! Je vais enfin pouvoir recommencer à offrir des produits frais à mes clients. Voilà vos 50 pièces d'or.
	
	B_GiveInvItems (other, self, ItMi_BaltramPaket,1);
	B_GiveInvItems (self, other, ItMi_Gold,50);
	
	MIS_Baltram_ScoutAkil = LOG_SUCCESS;
	MIS_Nagur_Bote = LOG_FAILED;
	B_GivePlayerXP (XP_Baltram_ScoutAkil);
	
	Npc_RemoveInvItems (self, ItMi_BaltramPaket,1);
	
	CreateInvItems (self,ItFo_Cheese	,  5); 	
	CreateInvItems (self,ItFo_Apple 	, 10); 
	CreateInvItems (self,ItFo_Beer  	,  5);
	CreateInvItems (self,ItFo_Bacon 	,  5);
	CreateInvItems (self,ItFo_Sausage	,  5);
	
};

///////////////////////////////////////////////////////////////////////
//	Info LetUsTrade
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_LetUsTrade		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  6;
	condition	 = 	DIA_Baltram_LetUsTrade_Condition;
	information	 = 	DIA_Baltram_LetUsTrade_Info;
	permanent	 =  FALSE;
	description	 = 	"Ne pourrions-nous pas faire affaire ensemble ?";
};
func int DIA_Baltram_LetUsTrade_Condition ()
{
	if (MIS_BaltramTrade == LOG_FAILED)
	{
		return TRUE;
	};
};

func void DIA_Baltram_LetUsTrade_Info ()
{
	AI_Output (other, self, "DIA_Baltram_LetUsTrade_15_00"); //Est-ce qu'on ne peut pas faire de nouveau des affaires ensemble ?
	AI_Output (self, other, "DIA_Baltram_LetUsTrade_01_01"); //Apportez-moi dix jambons et dix bouteilles de vin, et c'est d'accord.
	AI_Output (other, self, "DIA_Baltram_LetUsTrade_15_02"); //Je verrai ce que je peux faire.
	
	MIS_BaltramTrade = LOG_RUNNING;
};

var int BaltramEnoughBacon;
var int BaltramEnoughWine;

///////////////////////////////////////////////////////////////////////
//	Info HaveYourWarez
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_HaveYourWarez		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  6;
	condition	 = 	DIA_Baltram_HaveYourWarez_Condition;
	information	 = 	DIA_Baltram_HaveYourWarez_Info;
	permanent	 =  TRUE;
	description	 = 	"J'ai vos marchandises.";
};
func int DIA_Baltram_HaveYourWarez_Condition ()
{
	if (MIS_BaltramTrade == LOG_RUNNING)
	&& (MIS_BaltramTrade != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Baltram_HaveYourWarez_Info ()
{
	AI_Output (other, self, "DIA_Baltram_HaveYourWarez_15_00"); //J'ai ce que vous vouliez.
	AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_01"); //Montrez moi.
	
	if (Npc_HasItems (other,ItFo_Bacon) < 10)
	{
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_02"); //Nous nous sommes mis d'accord sur dix jambons. Revenez quand vous en aurez assez.
		
		BaltramEnoughBacon = FALSE;
	}
	else
	{
		BaltramEnoughBacon = TRUE;
	};  
	if (Npc_HasItems (other,ItFo_Wine) < 10)
	{
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_03"); //Et mes dix bouteilles de vin ? Vous les avez oubliées ?
	
		BaltramEnoughWine = FALSE;
	}
	else
	{
		BaltramEnoughWine = TRUE;
	};
	
	if (BaltramEnoughBacon == TRUE
	&&  BaltramEnoughWine  == TRUE)
	{
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_04"); //Hmm... la qualité laisse un peu à désirer, mais impossible de se montrer trop difficile par les temps qui courent.
		
		B_GiveInvItems (other,self,ItFo_Bacon,10);
		B_GiveInvItems (other,self,ItFo_Wine,10);
		
		MIS_BaltramTrade = LOG_SUCCESS;
	
		B_GivePlayerXP (XP_BaltramTrade);
		
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_05"); //Rien ne nous empêche de faire affaire ensemble désormais.
	};	
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Baltram_PICKPOCKET (C_INFO)
{
	npc			= VLK_410_Baltram;
	nr			= 900;
	condition	= DIA_Baltram_PICKPOCKET_Condition;
	information	= DIA_Baltram_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Baltram_PICKPOCKET_Condition()
{
	C_Beklauen (76, 175);
};
 
FUNC VOID DIA_Baltram_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Baltram_PICKPOCKET);
	Info_AddChoice		(DIA_Baltram_PICKPOCKET, DIALOG_BACK 		,DIA_Baltram_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Baltram_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Baltram_PICKPOCKET_DoIt);
};

func void DIA_Baltram_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Baltram_PICKPOCKET);
};
	
func void DIA_Baltram_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Baltram_PICKPOCKET);
};




















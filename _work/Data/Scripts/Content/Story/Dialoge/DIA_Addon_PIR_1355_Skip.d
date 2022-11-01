// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Skip_EXIT(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 999;
	condition	= DIA_Addon_Skip_EXIT_Condition;
	information	= DIA_Addon_Skip_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Skip_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Skip_PICKPOCKET (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 900;
	condition	= DIA_Addon_Skip_PICKPOCKET_Condition;
	information	= DIA_Addon_Skip_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Skip_PICKPOCKET_Condition()
{
	C_Beklauen (20, 43);
};
 
FUNC VOID DIA_Addon_Skip_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Skip_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Skip_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Skip_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Skip_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Skip_PICKPOCKET_DoIt);
};

func void DIA_Addon_Skip_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Skip_PICKPOCKET);
};
	
func void DIA_Addon_Skip_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Skip_PICKPOCKET);
};
// ************************************************************
// 			  				Hello 
// ************************************************************
INSTANCE DIA_Addon_Skip_Hello(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Hello_Condition;
	information	= DIA_Addon_Skip_Hello_Info;

	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& PlayerTalkedToSkipNW == TRUE
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_00"); //Alors, qui revoilà ? Je trouve que nos chemins se croisent plutôt souvent, en ce moment...
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_01"); //(exagéré) Je vous connais !
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_02"); //La baie proche de la ville, vous vous souvenez ?
	AI_Output (other,self ,"DIA_Addon_Skip_Hello_15_03"); //Skip ! C'est ça ?
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_04"); //(fier) Je vous que mon nom vous a marqué...
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_05"); //Mais j'ai vu votre trogne ailleurs, depuis...
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_06"); //Mais bien sûr !
	B_UseFakeScroll ();
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_07"); //Bah. La similitude n'est pas frappante, mais c'est bien vous.
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_08"); //Ne laissez pas ça vous monter à la tête. Mon affiche est tout aussi belle que la vôtre.
	Npc_ExchangeRoutine	(self,"Start");
};

// ************************************************************
// 			  			 Baltrams Paket
// ************************************************************
instance DIA_Addon_SkipADW_BaltramPaket		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 2;
	condition	= DIA_Addon_SkipADW_BaltramPaket_Condition;
	information	= DIA_Addon_SkipADW_BaltramPaket_Info;

	description	= "J'ai un paquet pour vous, de la part de Baltram.";
};
func int DIA_Addon_SkipADW_BaltramPaket_Condition ()
{
	if (Npc_HasItems (other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
};
func void DIA_Addon_SkipADW_BaltramPaket_Info ()
{
	AI_Output	(other, self, "DIA_Addon_SkipADW_BaltramPaket_15_00"); //J'ai un paquet pour vous, de la part de Baltram.
	AI_Output	(self, other, "DIA_Addon_SkipADW_BaltramPaket_08_01"); //(sourit) Ce type doit vraiment apprécier notre rhum pour se donner le mal d'envoyer ses marchandises jusqu'ici.
	B_GiveInvItems (other, self, ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output	(self, other, "DIA_Addon_SkipADW_BaltramPaket_08_02"); //Tenez, donnez-lui ces 2 bouteilles de rhum. J'ai avalé la troisième en l'attendant.
	B_GiveInvItems (self, other, ItFo_Addon_Rum, 2);		
	B_GivePlayerXP (XP_Addon_Skip_BaltramPaket);
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram); 
	Skip_Rum4Baltram = TRUE;
};

// ************************************************************
// 			  			Was machst du hier?
// ************************************************************
INSTANCE DIA_Addon_Skip_Job(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 3;
	condition	= DIA_Addon_Skip_Job_Condition;
	information	= DIA_Addon_Skip_Job_Info;

	description = "Que faites-vous ici ?";
};                       
FUNC INT DIA_Addon_Skip_Job_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_Job_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Job_15_00"); //Que faites-vous ici ?
	AI_Output (self ,other, "DIA_Addon_Skip_Job_08_01"); //Je rentre à l'instant de Khorinis, et j'attends maintenant le retour de Greg.
};

// ************************************************************
// 			  			Greg getroffen!
// ************************************************************
instance DIA_Addon_Skip_ADW_GregGetroffen		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 4;
	condition	= DIA_Addon_Skip_ADW_GregGetroffen_Condition;
	information	= DIA_Addon_Skip_ADW_GregGetroffen_Info;

	description	= "J'ai vu Greg à Khorinis.";
};
func int DIA_Addon_Skip_ADW_GregGetroffen_Condition ()
{
	if (PlayerTalkedToGregNW  == TRUE)
	&& (GregIsBack == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_Job))
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_ADW_GregGetroffen_Info ()
{
	AI_Output (other, self, "DIA_Addon_Skip_ADW_GregGetroffen_15_00"); //J'ai vu Greg à Khorinis.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_01"); //Vraiment ! Bon sang ! Il a vraiment dû arriver quelque chose de mauvais, dans ce cas.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_02"); //Cela fait déjà quelque temps qu'il devrait être rentré avec notre navire.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_03"); //(pensif) J'imagine que je devrais retourner à Khorinis et l'attendre là-bas...
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_04"); //(soupire) Mais ce ne sera certainement pas aujourd'hui. Je viens juste d'arriver.
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 			  			Überfahrt - PERM
// ************************************************************
var int Skip_Transport_Variation;
// ------------------------------------------------------------
instance DIA_Addon_Skip_Transport(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 99;
	condition	= DIA_Addon_Skip_Transport_Condition;
	information	= DIA_Addon_Skip_Transport_Info;
	permanent	= TRUE;
	description = "Pouvez-vous m'emmener à Khorinis ?";
};                       
FUNC INT DIA_Addon_Skip_Transport_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Job))
	&& (self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Skip_Transport_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Transport_15_00"); //Pouvez-vous m'emmener à Khorinis ?
	if (GregIsBack == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_01"); //Pas question. Je ne pars pas maintenant. Je vais d'abord me trouver une bonne rasade de tafia.
	}
	else if (Skip_Transport_Variation == 0)
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_02"); //Êtes-vous malade ? On a perdu notre bateau, mon vieux !
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_03"); //Je ne vais pas risquer notre dernier bateau uniquement parce que vous êtes trop fainéant pour vous bouger les fesses et aller à Khorinis par vous-même !
		Skip_Transport_Variation = 1;
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_04"); //Pour la dernière fois : non !
	};
};

// ************************************************************
// 			 			Banditen + Rüstung
// ************************************************************
// ------------------------------------------------------------
// 							About Bandits
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Bandits(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_Bandits_Condition;
	information	= DIA_Addon_Skip_Bandits_Info;

	description = "Que savez-vous sur les bandits ?";
};                       
FUNC INT DIA_Addon_Skip_Bandits_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Skip_Bandits_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Bandits_15_00"); //Que savez-vous sur les bandits ?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_01"); //Les bandits ?! Ils nous attaquent !
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_02"); //Pourquoi croyez-vous que nous construisons cette palissade ?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_03"); //C'est nous qui avons attiré ces ordures ici.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_04"); //On faisait du commerce avec eux. Oh, ils ont tellement d'or qu'ils ne savent pas quoi en faire !
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_05"); //Ils auraient payé n'importe quel prix pour une bouteille de rhum.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_06"); //Mais tout ça, c'est fini ! Nous sommes en guerre !
	AI_Output (other, self, "DIA_Addon_Erol_Bandits_15_06"); //Que s'est-il passé ?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_07"); //Ces salopards n'ont pas payé la dernière livraison.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_08"); //Alors je suis allé voir ce que devenait notre or.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_09"); //Quand je suis arrivé dans le marais, ces salauds m'ont attaqué !
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_10"); //Et c'est pas tout. Ils ont tué Angus et Hank, deux de nos meilleurs hommes !
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_11"); //Si vous voulez un conseil, évitez le marais.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_12"); //Ils s'en prennent à tous ceux qui n'ont pas l'air aussi louche qu'eux.
	
	
};

// ------------------------------------------------------------
// 						Banditenrüstung
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_ArmorPrice(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_ArmorPrice_Condition;
	information	= DIA_Addon_Skip_ArmorPrice_Info;

	description = "Il me faut une armure de bandit !";
};                       
FUNC INT DIA_Addon_Skip_ArmorPrice_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Bandits))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};			
};
func VOID DIA_Addon_Skip_ArmorPrice_Info()
{	
	AI_Output (other,self , "DIA_Addon_Skip_ArmorPrice_15_00"); //J'ai besoin d'une armure de bandit
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_01"); //Vous voulez aller là-bas ? Êtes-vous fou ? 
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_02"); //Quand ils découvriront que vous n'êtes pas des leurs, ils vont vous transformer en chair à pâté.
	AI_Output (other, self, "DIA_Addon_Skip_ArmorPrice_15_02"); //Savez-vous où je pourrais trouver une armure de ce genre ?
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_03"); //(soupire) Vous êtes têtu, hein ? Bon, d'accord. On en a eu une.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_04"); //Greg la gardait dans sa hutte. Elle doit y être encore.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_05"); //Il acceptera peut-être de vous la vendre quand il rentrera.
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Skip pense que l'armure se trouve dans la cabane de Greg."); 
};

// ------------------------------------------------------------
// 						In Gregs Hütte
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_GregsHut(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_GregsHut_Condition;
	information	= DIA_Addon_Skip_GregsHut_Info;
	permanent	= FALSE;
	description = "Pouvez-vous me dire comment entrer dans la cabane de Greg ?";
};                       
FUNC INT DIA_Addon_Skip_GregsHut_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_ArmorPrice))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};			
};

FUNC VOID DIA_Addon_Skip_GregsHut_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_GregsHut_15_00"); //Pouvez-vous me dire comment faire pour entrer dans sa hutte ?
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_01"); //Oh là ! Doucement !
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_02"); //Vous n'avez tout de même pas l'intention d'aller fouiller dans ses affaires, non ?
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_03"); //En partant, il a laissé ses clefs à Francis et lui a dit de ne laisser entrer personne dans sa hutte.
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Francis détient la clef de la cabane de Greg. Il a pour ordre de ne laisser personne y rentrer."); 
	
	Knows_GregsHut = TRUE;
};

// ------------------------------------------------------------
//					Über Francis --> Samuel
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Francis (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_Francis_Condition;
	information	= DIA_Addon_Skip_Francis_Info;
	permanent	= FALSE;
	description = "Que pouvez-vous me dire à propos de Francis ?";
};   
FUNC INT DIA_Addon_Skip_Francis_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
	{
		return TRUE;
	};			
};

FUNC VOID DIA_Addon_Skip_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Francis_15_00"); //Que pouvez-vous me dire à propos de Francis ?
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_01"); //C'est notre trésorier.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_02"); //Il a la confiance du Capitaine. C'est sans doute pour ça qu'il lui a laissé le commandement.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_03"); //Mais personne ne le prend vraiment au sérieux.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_04"); //Si vous voulez en savoir plus, allez demander à Samuel.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_05"); //Il a un alambic dans une petite grotte au nord.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_06"); //Samuel connaît plein de choses sur tout le monde ici
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Je devrais parler à Samuel. Peut-être pourra-t-il m'aider."); 
};
	
	
// ************************************************************
// 						Die Turmbanditen
// ************************************************************
// ------------------------------------------------------------
// 			 				Raven
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Raven(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_Raven_Condition;
	information	= DIA_Addon_Skip_Raven_Info;
	permanent	= FALSE;
	description = "Avez-vous déjà rencontré Raven ?";
};                       
FUNC INT DIA_Addon_Skip_Raven_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Bandits) == TRUE)
	{
		return TRUE;
	};			
};
FUNC VOID DIA_Addon_Skip_Raven_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Raven_15_00"); //Avez-vous déjà rencontré Raven ?
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_01"); //Absolument. Quand j'étais à la porte avec Henry, j'ai observé Raven qui postait ses hommes sur la tour sud.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_02"); //Ils sont à un jet de pierre de notre camp. (rit) Ils sont sans doute supposés nous espionner.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_03"); //J'ai vu aussi comment il traite ses hommes quand ils ne font pas ce qu'il veut.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_04"); //C'est le genre à réduire en pièces quiconque n'obéit pas à la lettre.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_05"); //Retenez ce que je vais vous dire : ne vous approchez pas de Raven.
};



// ************************************************************
// ***														***
// 						Die Angus und Hank Show
// ***														***
// ************************************************************

// ------------------------------------------------------------
// 			 			Angus und Hank.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHank(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHank_Condition;
	information	= DIA_Addon_Skip_AngusHank_Info;

	description = "Parlez-moi d'Angus et de Hank.";
};                       
FUNC INT DIA_Addon_Skip_AngusHank_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_Bandits))
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHank_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_AngusnHank_15_00"); //Parlez-moi d'Angus et de Hank.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_01"); //Angus et Hank devaient rencontrer des bandits devant le camp.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_02"); //Ils avaient plein de marchandises avec eux. Tout ce que ces salopards nous avaient commandé.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_03"); //De l'acier forgé, des crochets, ce genre de trucs 
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_04"); //Mais ils ne sont jamais revenus. Ces pourceaux de bandits les ont sûrement tués !
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_05"); //Morgan et Bill sont allés à leur recherche, mais sans succès.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_06"); //Bill était effondré. Ils étaient tous les deux ses amis.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_07"); //Il est encore jeune, ce genre de chose le touche beaucoup.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_08"); //Nous autres, on a mieux encaissé. Les marchandises, ça n'est pas une perte énorme. (en soupirant) mais le tafia qu'ils ont emmen
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_09"); //(en colère) Il y avait au moins 20 bouteilles !
	MIS_ADDON_SkipsGrog = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_SkipsGrog,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_SkipsGrog,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Les bandits ont apparemment dérobé 20 bouteilles de tafia à Skip. Il veut les récupérer.");
	Log_AddEntry	(TOPIC_Addon_SkipsGrog,"Angus et Hank devaient aller à la rencontre d'un groupe de bandits. Ils ne sont jamais revenus.");
	Log_AddEntry	(TOPIC_Addon_SkipsGrog,"Les recherches de Morgan et Bill n'ont eu aucun succès.");
};

// ------------------------------------------------------------
// 			 		Angus und Hank sind TOT
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHankDead(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHankDead_Condition;
	information	= DIA_Addon_Skip_AngusHankDead_Info;
	permanent	= FALSE;
	description = "A propos de Angus et Hank...";
};                       
FUNC INT DIA_Addon_Skip_AngusHankDead_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_Bandits))
	&& (!Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission))
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHankDead_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_00"); //À propos d'Angus et de Hank
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_01"); //Quoi ?
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_01"); //Je les ai retrouvés.
	//AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_02"); //Sie sind tot, richtig?
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_03"); //Ils sont morts.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_03"); //(à lui-même) Les pauvres diables ! Ils sont aussi morts qu'une bûche.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_04"); //Bah, on devait s'y attendre.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_05"); //Vous devriez le dire à Bill, si ce n'est pas déjà fait.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_06"); //Mais allez-y en douceur - il est encore jeune.
};

// ------------------------------------------------------------
// 			 			Kenne den Mörder
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHankMurder(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHankMurder_Condition;
	information	= DIA_Addon_Skip_AngusHankMurder_Info;
	permanent	= FALSE;
	description = "Je sais qui a tué Angus et Hank.";
};                       
FUNC INT DIA_Addon_Skip_AngusHankMurder_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_AngusHankDead))
	&& (SC_Knows_JuanMurderedAngus == TRUE)
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHankMurder_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_JuanMurder_15_00"); //Je sais qui a tué Angus et Hank.
	if (MIS_ADDON_SkipsGrog == LOG_SUCCESS)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_01"); //Grand bien vous fasse. Ils sont morts. Qui se soucie de savoir ?
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_02"); //Nul pirate n'est devenu riche en se vengeant.
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_03"); //Tant que je récupère mon tafia.
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_04"); //Je me fiche de savoir qui les a tués. Et mon tafia ?!
	};
};

// ------------------------------------------------------------
// 							Grog zurück
// ------------------------------------------------------------
instance DIA_Addon_Skip_Grog		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 9;
	condition	= DIA_Addon_Skip_Grog_Condition;
	information	= DIA_Addon_Skip_Grog_Info;
	permanent	= TRUE;
	description	= "A propos du tafia...";
};
func int DIA_Addon_Skip_Grog_Condition ()
{
	if (MIS_ADDON_SkipsGrog == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_Grog_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_Grog_15_00"); //Votre tafia
		
	if (Npc_HasItems (other,Itfo_Addon_Grog)>= 20)
	{
		Info_ClearChoices	(DIA_Addon_Skip_Grog);
		Info_AddChoice	(DIA_Addon_Skip_Grog, DIALOG_BACK, DIA_Addon_Skip_Grog_back );
		Info_AddChoice	(DIA_Addon_Skip_Grog, "Voici vos 20 bouteilles.", DIA_Addon_Skip_Grog_geben );
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Skip_Grog_15_01"); //Il vous manque 20 bouteilles, c'est bien ça ?
		AI_Output	(self, other, "DIA_Addon_Skip_Grog_08_02"); //Bon sang, oui. Tout mon stock.
	};
};
func void DIA_Addon_Skip_Grog_back ()
{
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};
func void DIA_Addon_Skip_Grog_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_00"); //Les voilà, vos 20 bouteilles.
	B_GiveInvItems (other, self, Itfo_Addon_Grog, 20);
	
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Skip a récupéré ses 20 bouteilles de tafia, à son grand plaisir.");
	
	MIS_ADDON_SkipsGrog = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_SkipsGrog);

	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_01"); //Quoi ? Vraiment ? Pour rien ?
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_02"); //En fait
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_03"); //D'accord. Je vous les rachète.
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_04"); //Vous n'avez rien de plus intéressant que de l'or ?
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_05"); //Hum, voyons un peu. J'ai cet anneau.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_06"); //Je l'ai gagné au jeu dans une taverne crasseuse du port il y a des années.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_07"); //À l'époque, le type m'avait dit qu'il était magique. Je ne sais pas si c'est vrai.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_08"); //Vous préfèrez ça à de l'argent ?
	
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
	Info_AddChoice	(DIA_Addon_Skip_Grog, "Donnez-moi de l'argent.", DIA_Addon_Skip_Grog_gold );
	Info_AddChoice	(DIA_Addon_Skip_Grog, "Donnez-moi l'anneau.", DIA_Addon_Skip_Grog_ring );
};
func void DIA_Addon_Skip_Grog_ring ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_ring_15_00"); //Donnez-moi l'anneau.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_ring_08_01"); //Le voilà.
	B_GiveInvItems (self, other, ItRi_Prot_Edge_02, 1);		
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};
func void DIA_Addon_Skip_Grog_gold ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_gold_15_00"); //Donnez-moi de l'argent.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_gold_08_01"); //D'accord.
	var int GrogKohle;
	GrogKohle = (Value_Grog * 20);
	B_GiveInvItems (self, other, ItMi_Gold, GrogKohle);		
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};



// ************************************************************
// 			  				TRADE 
// ************************************************************
INSTANCE DIA_Addon_Skip_News(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 888;
	condition	= DIA_Addon_Skip_News_Condition;
	information	= DIA_Addon_Skip_News_Info;
	permanent	= FALSE;
	description = "Avez-vous quelque chose à vendre ?";
};                       
FUNC INT DIA_Addon_Skip_News_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_News_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_News_15_00"); //Avez-vous quelque chose à vendre ?
	AI_Output (self ,other,"DIA_Addon_Skip_News_08_01"); //Si vous voulez acheter quelque chose, allez voir Garett. Il s'occupe de l'approvisionnement.

	Log_CreateTopic (Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
};



// ************************************************************
// *** 														***
// 						Mitkommen (Greg)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Anheuern(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 11;
	condition	= DIA_Addon_Skip_Anheuern_Condition;
	information	= DIA_Addon_Skip_Anheuern_Info;
	permanent	= FALSE;
	description = "Vous êtes supposé m'aider.";
};                       
FUNC INT DIA_Addon_Skip_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_Anheuern_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Anheuern_15_00"); //Vous êtes supposé m'aider.
	AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_01"); //Et comment ?
	AI_Output (other, self, "DIA_Addon_Skip_Anheuern_15_01"); //Le canyon nous attend.
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_02"); //Je vois que vous emmenez des gars avec vous. Sage précaution ! 
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_03"); //Vous devriez emmener des gars avec vous.
	};
	AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_04"); //Ce canyon est très dangereux.
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_Skip_ComeOn(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr		 	= 12;
	condition	= DIA_Addon_Skip_ComeOn_Condition;
	information	= DIA_Addon_Skip_ComeOn_Info;
	permanent	= TRUE;
	description	= "Venez avec moi.";
};
func int DIA_Addon_Skip_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_ComeOn_Info ()
{
	AI_Output (other, self, "DIA_Addon_Skip_ComeOn_15_00"); //Venez avec moi.
	if (C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_ComeOn_08_02"); //Attendez. Retournons d'abord au canyon
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_ComeOn_08_01"); //Allons-y !
		if (C_BodyStateContains (self, BS_SIT))
		{
			AI_StandUp (self);
			B_TurnToNpc (self,other);
		};
		AI_StopProcessInfos (self);
		
		B_Addon_PiratesFollowAgain();
		
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_GoHome(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 13;
	condition	= DIA_Addon_Skip_GoHome_Condition;
	information	= DIA_Addon_Skip_GoHome_Info;
	permanent	= TRUE;
	description = "Je n'ai plus besoin de vous.";
};                       
FUNC INT DIA_Addon_Skip_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Skip_GoHome_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_GoHome_15_00"); //Je n'ai plus besoin de vous.
	AI_Output (self, other, "DIA_Addon_Skip_GoHome_08_01"); //Bon, si c'est ça, vous me retrouverez au camp.
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START");
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_TooFar(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 14;
	condition	= DIA_Addon_Skip_TooFar_Condition;
	information	= DIA_Addon_Skip_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_TooFar_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_01"); //On est bien assez loin !
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_02"); //Si vous voulez aller plus loin, ne comptez pas sur nous !
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_03"); //Si vous voulez aller plus loin, ne comptez pas sur moi !
	};
	
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 			Oase = Treffpunkt
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Treffpunkt (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Treffpunkt_Condition;
	information	= DIA_Addon_Skip_Treffpunkt_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Treffpunkt_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP (self, "ADW_CANYON_TELEPORT_PATH_06") <= 800)
	&& (C_AllCanyonRazorDead() == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_Treffpunkt_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_00"); //Si on se perd, retrouvons-nous ici, au trou d'eau.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_02"); //Allez, en route !
		
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 				Orks!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Orks (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Orks_Condition;
	information	= DIA_Addon_Skip_Orks_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Orks_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP (self, "ADW_CANYON_PATH_TO_LIBRARY_14") <= 2000)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_Orks_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_01"); //Des orques ! Je déteste ces créatures !

	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 			Alle Razor tot
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AllRazorsDead (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_AllRazorsDead_Condition;
	information	= DIA_Addon_Skip_AllRazorsDead_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_AllRazorsDead_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_AllCanyonRazorDead() == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_AllRazorsDead_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_03"); //On dirait bien qu'on a eu toutes les Lames.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_04"); //On peut continuer à chercher un peu si vous voulez.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_05"); //Du moment que l'on reste dans le canyon. 
	
	AI_StopProcessInfos (self); 
};



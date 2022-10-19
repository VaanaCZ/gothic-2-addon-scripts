///////////////////////////////////////////////////////////////////////
//	Info FIRST EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_BDT_1013_BANDIT_FIRSTEXIT   (C_INFO)
{
	npc         = BDT_1013_Bandit_L;
	nr          = 999;
	condition   = DIA_BDT_1013_BANDIT_FIRSTEXIT_Condition;
	information = DIA_BDT_1013_BANDIT_FIRSTEXIT_Info;
	permanent   = FALSE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_BDT_1013_BANDIT_FIRSTEXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_BDT_1013_BANDIT_FIRSTEXIT_Info()
{
	if (Bdt13_Friend == TRUE)
	&& (!Npc_IsDead (Ambusher_1014)) 
	&& (!Npc_IsDead (Ambusher_1015))
	{
		AI_Output	(self, other, "DIA_BDT_1013_BANDIT_FIRSTEXIT_01_00"); //Je n'irais pas dans la grotte là-haut si j'étais vous. Mes potes qui y sont vous tanneront le cuir. Et ils savent se battre.
	};
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_BDT_1013_BANDIT_EXIT   (C_INFO)
{
	npc         = BDT_1013_Bandit_L;
	nr          = 999;
	condition   = DIA_BDT_1013_BANDIT_EXIT_Condition;
	information = DIA_BDT_1013_BANDIT_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_BDT_1013_BANDIT_EXIT_Condition()
{	
	if Npc_KnowsInfo (other,DIA_BDT_1013_BANDIT_FIRSTEXIT)
	{
		return TRUE;
	};
};
FUNC VOID DIA_BDT_1013_BANDIT_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WHERE
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1013_BANDIT_WHERE		(C_INFO)
{
	npc			 = 	BDT_1013_Bandit_L;
	nr			 = 	3;
	condition	 = 	DIA_BDT_1013_BANDIT_WHERE_Condition;
	information	 = 	DIA_BDT_1013_BANDIT_WHERE_Info;
	PERMANENT	 =  FALSE;
	important	 = 	TRUE;
};

func int DIA_BDT_1013_BANDIT_WHERE_Condition ()
{	
	return TRUE;
};

func void DIA_BDT_1013_BANDIT_WHERE_Info ()
{
	AI_Output			(self, other, "DIA_BDT_1013_BANDIT_WHERE_01_00"); //Eh, d'où venez-vous, hum ?
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Je viens des montagnes.",DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN);	
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Je viens de chez Xardas...",DIA_BDT_1013_BANDIT_WHERE_XARDAS);
};
//-------------------------------------------------------------------------------------------
FUNC VOID DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_15_00"); //Je viens des montagnes.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_01"); //Exactement. Vous venez des montagnes et c'est mauvais pour vous.
	B_UseFakeScroll();
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_02"); //Très mauvais.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_03"); //Ils vous cherchent... Tout un tas de types malfaisants.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_04"); //Il y a quelqu'un ici à qui vous devriez absolument parler. Suivez-moi !
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Peut-être plus tard...",DIA_BDT_1013_BANDIT_WHERE_LATER);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Qui me recherche ?",DIA_BDT_1013_BANDIT_WHERE_WHO);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Très bien ! Vous d'abord !",DIA_BDT_1013_BANDIT_WHERE_YES);
};

FUNC VOID DIA_BDT_1013_BANDIT_WHERE_XARDAS()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_XARDAS_15_00"); //Je viens de chez Xardas...
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_XARDAS_01_01"); //Le vieux sorcier ? Il s'appelle Xardas ? Cela va intéresser Brago...
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
}; 

FUNC VOID DIA_BDT_1013_BANDIT_WHERE_YES()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_YES_15_00"); //Très bien ! Passez devant !
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_YES_01_01"); //Alors suivez-moi, la grotte est juste là.
	
	Npc_ExchangeRoutine	(self,"AMBUSH"); 
	
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_BDT_1013_BANDIT_WHERE_WHO()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_WHO_15_00"); //Qui me recherche ?
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_WHO_01_01"); //La moitié de Khorinis vous court après et vous ME dites que vous n'êtes au courant de rien ?
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_WHO_01_02"); //Ah ! Je vois ! Vous ne voulez pas m'en parler, hum ? Très bien, ce sont vos affaires.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_WHO_01_03"); //Alors, vous venez ou pas ?
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Peut-être plus tard...",DIA_BDT_1013_BANDIT_WHERE_LATER);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Avec qui devrais-je m'entretenir ?",DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Très bien ! Vous d'abord !",DIA_BDT_1013_BANDIT_WHERE_YES);
};

func void DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_15_00"); //A qui devrai-je parler ?
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_01"); //A mon chef. Il s'appelle Brago. Il pourra tout vous expliquer beaucoup mieux que moi.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_02"); //Alors, que décidez-vous ? On y va ?
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Peut-être plus tard...",DIA_BDT_1013_BANDIT_WHERE_LATER);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Comment puis-je savoir que ce n'est pas un piège ?",DIA_BDT_1013_BANDIT_WHERE_NOTRAP);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Très bien ! Vous d'abord !",DIA_BDT_1013_BANDIT_WHERE_YES);
};
	
func void DIA_BDT_1013_BANDIT_WHERE_NOTRAP()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_NOTRAP_15_00"); //Comment savoir si ce n'est pas un piège ?
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_01"); //Vous savez, vous commencez à me fatiguer. Si vous ne voulez pas de mon aide, allez en ville et laissez-les vous mettre derrière les barreaux !
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_02"); //Vous venez avec moi MAINTENANT, ou on laisse tomber, d'accord ?
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Peut-être plus tard...",DIA_BDT_1013_BANDIT_WHERE_LATER);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Quelqu'un a déjà essayé de me piéger...",DIA_BDT_1013_BANDIT_WHERE_DAMALS);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Très bien ! Vous d'abord !",DIA_BDT_1013_BANDIT_WHERE_YES);
};

func void DIA_BDT_1013_BANDIT_WHERE_DAMALS()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_00"); //Du calme, mon ami ! Quelqu'un a déjà essayé de me piéger...
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_01"); //Oh ?
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_02"); //Ce type m'avait proposé d'aller chercher ensemble une amulette et de partager les bénéfices.
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_03"); //Une fois notre objectif atteint, ses amis et lui m'ont attaqué.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_04"); //Il semble que vous ayez croisé les mauvaises personnes, où était-ce ?
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Ce n'est pas important.",DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"J'étais un prisonnier dans la colonie minière.",DIA_BDT_1013_BANDIT_WHERE_PRISONER);
};

func void DIA_BDT_1013_BANDIT_WHERE_PRISONER()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_00"); //J'étais prisonnier à la colonie minière.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_01"); //(médusé) Vous venez d'au-delà de la Barrière ? Alors nous étions ensemble.
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_02"); //Je ne vous connais pas...
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_03"); //J'étais mineur dans l'ancien camp. Je n'avais pas grand-chose à voir avec tout ça.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_04"); //(sur un ton de conspirateur) Mais le plus important maintenant, c'est que vous avez de gros ennuis.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_05"); //Quelqu'un a mis votre tête à prix et un bon prix. Et il a fait diffuser des avis de recherche avec votre bouille dessus !
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_06"); //Si j'étais vous, je serais très, très prudent. Il y a des gens parmi nous qui tueraient leur propre mère pour de l'or.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_07"); //Mais je pense que nous autres de la colonie pénitentiaire, nous devons nous serrer les coudes.
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_08"); //Eh bien, je pense que je ferais bien de vous remercier maintenant...
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_09"); //Ce n'est rien. Faites en sorte de rester en vie.
	
	Bdt13_Friend = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY);
	self.npctype = NPCTYPE_FRIEND;
	self.aivar[AIV_EnemyOverride] = FALSE;
		
	Info_ClearChoices (DIA_BDT_1013_BANDIT_WHERE);
};

func void DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_15_00"); //Ce n'est pas important.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_01_01"); //Comme vous voulez. Alors, on y va maintenant, oui ou non ?
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Peut-être plus tard...",DIA_BDT_1013_BANDIT_WHERE_LATER);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Très bien ! Vous d'abord !",DIA_BDT_1013_BANDIT_WHERE_YES);
};

func VOID DIA_BDT_1013_BANDIT_WHERE_LATER()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_LATER_15_00"); //Peut-être plus tard...
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_LATER_01_01"); //Pour vous il n'y aura pas de plus tard, mon gars !
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
};


///////////////////////////////////////////////////////////////////////
//	Info AMBUSH
///////////////////////////////////////////////////////////////////////
instance DIA_1013_BANDIT_AMBUSH		(C_INFO)
{
	npc			 = 	BDT_1013_Bandit_L;
	nr			 = 	1;
	condition	 = 	DIA_1013_BANDIT_AMBUSH_Condition;
	information	 = 	DIA_1013_BANDIT_AMBUSH_Info;
	PERMANENT	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_1013_BANDIT_AMBUSH_Condition ()
{	
	if (Npc_GetDistToWP (self, "NW_XARDAS_BANDITS_RIGHT") <= 300)
	&& (Bdt13_Friend == FALSE)
	{
		return TRUE;
	};
};
func void DIA_1013_BANDIT_AMBUSH_Info ()
{
	if (Npc_IsDead(Ambusher_1014))
	&& (Npc_IsDead(Ambusher_1015))
	{
		AI_Output			(self, other, "DIA_1013_BANDIT_AMBUSH_01_00"); //C'était vraiment stupide de me suivre...
		B_Attack 			(self, other, AR_SuddenEnemyInferno, 1);
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output			(self, other, "DIA_1013_BANDIT_AMBUSH_01_01"); //Eh ! Les gars ! Regardez ce qu'on a là...
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DEXTER
///////////////////////////////////////////////////////////////////////
instance DIA_1013_BANDIT_NAME (C_INFO)
{
	npc			 = 	BDT_1013_Bandit_L;
	nr			 = 	1;
	condition	 = 	DIA_1013_BANDIT_NAME_Condition;
	information	 = 	DIA_1013_BANDIT_NAME_Info;
	PERMANENT	 =  FALSE;	
	description	 = 	"Qui paie la récompense ?";
};
func int DIA_1013_BANDIT_NAME_Condition ()
{	
	if (Bdt13_Friend == TRUE) 
	{
		return TRUE;
	};
};
func void DIA_1013_BANDIT_NAME_Info ()
{
	AI_Output (other, self, "DIA_1013_BANDIT_NAME_15_00"); //Qui est le type qui offre la récompense ?
	AI_Output (self, other, "DIA_1013_BANDIT_NAME_01_01"); //Ça j'en sais rien, seul l'un d'entre nous le connaît.
	AI_Output (other, self, "DIA_1013_BANDIT_NAME_15_02"); //Et qui est-ce ?
	AI_Output (self, other, "DIA_1013_BANDIT_NAME_01_03"); //Eh, mec ! Je peux vraiment pas vous dire ça. Vous savez comment ça marche...
	
	Log_CreateTopic (Topic_Bandits,LOG_MISSION);
	Log_SetTopicStatus (Topic_Bandits,LOG_RUNNING);
	B_LogEntry (Topic_Bandits,"Des bandits sont après moi. Ils ont un avis de recherche. Je me demande ce que cela cache.");
	MIS_Steckbriefe = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info DEXTER verpetzen
///////////////////////////////////////////////////////////////////////
instance DIA_1013_BANDIT_DEXTER		(C_INFO)
{
	npc			 = 	BDT_1013_Bandit_L;
	nr			 = 	1;
	condition	 = 	DIA_1013_BANDIT_DEXTER_Condition;
	information	 = 	DIA_1013_BANDIT_DEXTER_Info;
	PERMANENT	 =  TRUE;	
	description	 = 	"10 pièces d'or pour le nom de celui qui a lancé l'avis de recherche.";
};
func int DIA_1013_BANDIT_DEXTER_Condition ()
{	
	if (Bdt13_Friend == TRUE) 
	&& (Bdt13_Dexter_verraten == FALSE) 
	&& (Npc_KnowsInfo (other, DIA_1013_BANDIT_NAME))
	{
		return TRUE;
	};
};
func void DIA_1013_BANDIT_DEXTER_Info ()
{
	AI_Output (other, self, "DIA_1013_BANDIT_DEXTER_15_00"); //10 pièces d'or pour le nom du type qui offre la récompense.
	AI_Output (self, other, "DIA_1013_BANDIT_DEXTER_01_01"); //Je ne peux vraiment pas faire ça...
	AI_Output (other, self, "DIA_1013_BANDIT_DEXTER_15_02"); //Crachez le morceau !
	AI_Output (self, other, "DIA_1013_BANDIT_DEXTER_01_03"); //(profonde inspiration) Très bien. Il s'appelle Dexter. Près de la grande ferme, il y a un rocher escarpé.
	AI_Output (self, other, "DIA_1013_BANDIT_DEXTER_01_04"); //En haut, il y a une tour de guet et quelques mines. Son repaire est quelque part dans le coin.
	
	B_LogEntry (Topic_Bandits,"Le chef des bandits se nomme Dexter. Il se cache dans une mine près du domaine du propriétaires terrien.");
	
	if (B_GiveInvItems(other, self, itmi_gold, 10))
	{
		AI_Output (other, self, "DIA_1013_BANDIT_DEXTER_15_05"); //Vous voyez, ce n'était pas si difficile. Voici votre or.
	}
	else
	{
		AI_Output (other, self, "DIA_1013_BANDIT_DEXTER_15_06"); //Ah ! Je viens de m'apercevoir que je n'avais pas 10 pièces d'or.
		AI_Output (self, other, "DIA_1013_BANDIT_DEXTER_01_07"); //Quoi ?!... Oh ! Laissez tomber. C'est de ma faute. Je n'aurais pas dû vous dire son nom avant d'avoir vu l'or...
	};
	
	AI_Output (self, other, "DIA_1013_BANDIT_DEXTER_01_08"); //Ne leur dites pas qui vous l'a dit.
			
	Bdt13_Dexter_verraten = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info PIC
///////////////////////////////////////////////////////////////////////
instance DIA_1013_BANDIT_PIC		(C_INFO)
{
	npc			 = 	BDT_1013_Bandit_L;
	nr			 = 	2;
	condition	 = 	DIA_1013_BANDIT_PIC_Condition;
	information	 = 	DIA_1013_BANDIT_PIC_Info;
	PERMANENT	 =  FALSE;	
	description	 = 	"Puis-je avoir l'avis ?";
};
func int DIA_1013_BANDIT_PIC_Condition ()
{	
	if (Bdt13_Friend == TRUE) 
	{
		return TRUE;
	};
};
func void DIA_1013_BANDIT_PIC_Info ()
{
	AI_Output (other, self, "DIA_1013_BANDIT_PIC_15_00"); //Puis-je avoir l'avis de recherche ?
	AI_Output (self, other, "DIA_1013_BANDIT_PIC_01_01"); //Bien sûr (souriant) - après tout c'est votre bouille là-dessus.
	B_GiveInvItems (self, other, ItWr_Poster_MIS,1);
};

///////////////////////////////////////////////////////////////////////
//						MALETHs Auftrag
///////////////////////////////////////////////////////////////////////
instance DIA_1013_BANDIT_FromMaleth		(C_INFO)
{
	npc			 = 	BDT_1013_Bandit_L;
	nr			 = 	3;
	condition	 = 	DIA_1013_BANDIT_FromMaleth_Condition;
	information	 = 	DIA_1013_BANDIT_FromMaleth_Info;
	permanent	 = 	FALSE;
	description	 = 	"Je suis envoyé par un des fermiers qui vit hors de la ville...";
};
func int DIA_1013_BANDIT_FromMaleth_Condition ()
{	
	if (Bdt13_Friend == TRUE) 
	&& ( (MIS_Maleth_Bandits == LOG_RUNNING) || (MIS_Maleth_Bandits == LOG_SUCCESS) )
	{
		return TRUE;
	};
};
func void DIA_1013_BANDIT_FromMaleth_Info ()
{
	AI_Output (other, self, "DIA_1013_BANDIT_FromMaleth_15_00"); //Je suis envoyé par un des fermiers hors de la ville...
	AI_Output (self, other, "DIA_1013_BANDIT_FromMaleth_01_01"); //Quoi ? Les fermiers connaissent mon repaire ?
	AI_Output (other, self, "DIA_1013_BANDIT_FromMaleth_15_02"); //Ils ont remarqué la disparition des moutons.
	
	var C_NPC b14; b14 = Hlp_GetNpc(Bdt_1014_Bandit_L);
	var C_NPC b15; b15 = Hlp_GetNpc(Bdt_1015_Bandit_L);

	if (Npc_IsDead (b14))
	&& (Npc_IsDead (b15))
	{
		AI_Output (self, other, "DIA_1013_BANDIT_FromMaleth_01_03"); //Malédiction ! Il va falloir que j'aille ailleurs. S'ils trouvent le repaire vide peut-être qu'ils arrêteront de me chercher.
	}
	else //mindestens einer lebt noch
	{
		AI_Output (other, self, "DIA_1013_BANDIT_FromMaleth_15_04"); //Il veut tous vous voir morts...
		AI_Output (self, other, "DIA_1013_BANDIT_FromMaleth_01_05"); //Attendez... vous n'allez pas me faire la peau alors que je vous ai aidé ?
		AI_Output (self, other, "DIA_1013_BANDIT_FromMaleth_01_06"); //Allez-y et tuez tous les autres si vous voulez vraiment voir le sang couler, moi je ne veux pas m'en mêler.
	};
	
	Bdt_1013_Away = TRUE;
	B_GivePlayerXP (XP_BanditWeg);
	
	Npc_ExchangeRoutine	(self,"AWAY");
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//						CAVALORNs Auftrag
///////////////////////////////////////////////////////////////////////
instance DIA_1013_BANDIT_FromCavalorn (C_INFO)
{
	npc			 = 	BDT_1013_Bandit_L;
	nr			 = 	3;
	condition	 = 	DIA_1013_BANDIT_FromCavalorn_Condition;
	information	 = 	DIA_1013_BANDIT_FromCavalorn_Info;
	permanent	 = 	FALSE;
	description	 = 	"Il va bientôt y avoir du grabuge ici !";
};
func int DIA_1013_BANDIT_FromCavalorn_Condition ()
{	
	if (Bdt13_Friend == TRUE) 
	&& (MIS_Addon_Cavalorn_KillBrago == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_1013_BANDIT_FromCavalorn_Info ()
{
	AI_Output (other, self, "DIA_ADDON_1013_BANDIT_FromCavalorn_15_00"); //Il va bientôt y avoir du grabuge ici !
	AI_Output (self, other, "DIA_ADDON_1013_BANDIT_FromCavalorn_01_01"); //Que se passe-t-il ?
	AI_Output (other, self, "DIA_ADDON_1013_BANDIT_FromCavalorn_15_02"); //Un type qui s'appelle Cavalorn vous recherche !
	AI_Output (self, other, "DIA_ADDON_1013_BANDIT_FromCavalorn_01_03"); //Enfer ! Il n'est pas mort ? Je file d'ici.

	Bdt_1013_Away = TRUE;
	B_GivePlayerXP (XP_BanditWeg);
	
	Npc_ExchangeRoutine	(self,"AWAY2");
	
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//							PERM
///////////////////////////////////////////////////////////////////////

// ------------------------------
	var int bdt13_Gossip_Wildnis;
// ------------------------------

instance DIA_1013_BANDIT_PERM		(C_INFO)
{
	npc			 = 	BDT_1013_Bandit_L;
	nr			 = 	4;
	condition	 = 	DIA_1013_BANDIT_PERM_Condition;
	information	 = 	DIA_1013_BANDIT_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"Y a-t-il autre chose qui pourrait m'intéresser ?";
};
func int DIA_1013_BANDIT_PERM_Condition ()
{	
	if (Bdt13_Friend == TRUE)
	
	{
		return TRUE;
	};
};
func void DIA_1013_BANDIT_PERM_Info ()
{
	AI_Output (other, self, "DIA_1013_BANDIT_PERM_15_00"); //Y a-t-il autre chose qui pourrait m'intéresser ?

	if (bdt13_Gossip_Wildnis == FALSE)
	{
		AI_Output (self, other, "DIA_1013_BANDIT_PERM_01_01"); //Au sujet de la région ? Si vous voulez rester en vie, restez sur les pistes.
		AI_Output (self, other, "DIA_1013_BANDIT_PERM_01_02"); //Plus vous vous enfoncez dans la nature, plus c'est dangereux.
		bdt13_Gossip_Wildnis = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_1013_BANDIT_PERM_01_03"); //Je vous ai dit tout ce que je savais.
	};
};












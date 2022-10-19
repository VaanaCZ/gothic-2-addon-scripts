//////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_EXIT   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 999;
	condition   = DIA_Jesper_EXIT_Condition;
	information = DIA_Jesper_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Jesper_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Jesper_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jesper_PICKPOCKET (C_INFO)
{
	npc			= VLK_446_Jesper;
	nr			= 900;
	condition	= DIA_Jesper_PICKPOCKET_Condition;
	information	= DIA_Jesper_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Jesper_PICKPOCKET_Condition()
{
	C_Beklauen (80, 180);
};
 
FUNC VOID DIA_Jesper_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jesper_PICKPOCKET);
	Info_AddChoice		(DIA_Jesper_PICKPOCKET, DIALOG_BACK 		,DIA_Jesper_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jesper_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jesper_PICKPOCKET_DoIt);
};

func void DIA_Jesper_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jesper_PICKPOCKET);
};
	
func void DIA_Jesper_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jesper_PICKPOCKET);
};
//////////////////////////////////////////////////////////////////////
//	Info Hallo 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Hallo   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 1;
	condition   = DIA_Jesper_Hallo_Condition;
	information = DIA_Jesper_Hallo_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Jesper_Hallo_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Jesper_Hallo_Info()
{
	AI_Output (self, other,"DIA_Jesper_Hallo_09_00");//Hé ! Qu'est-ce que vous faites là ? Il n'y a rien pour vous ici !
	AI_Output (self, other,"DIA_Jesper_Hallo_09_01");//Allez, je vous écoute : qu'est-ce que vous fichez là ?
		
	Info_ClearChoices (DIA_Jesper_Hallo);
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Je viens pour vous tuer.",DIA_Jesper_Hallo_Kill);	
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Je voulais juste jeter un œil.",DIA_Jesper_Hallo_NurSo);
		
	if  (Attila_Key == TRUE)
	{
		Info_AddChoice 	  (DIA_Jesper_Hallo,"Attila m'a donné une clef...",DIA_Jesper_Hallo_Willkommen);
	}	
	else 
	{
		Info_AddChoice 	  (DIA_Jesper_Hallo,"J'ai supprimé Attila...",DIA_Jesper_Hallo_Umgelegt);
	};
	
	DG_gefunden = TRUE;
	
};
FUNC VOID DIA_Jesper_Hallo_Kill()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Kill_15_00");//Je suis venu vous tuer.
	AI_Output (self, other,"DIA_Jesper_Hallo_Kill_09_01");//Quelle idée délicieuse ! Vous y avez pensé tout seul ? Bon, dans ce cas, inutile de perdre du temps...
	
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Jesper_Hallo_NurSo()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_NurSo_15_00");//Je fais juste un petit tour...
	AI_Output (self, other,"DIA_Jesper_Hallo_NurSo_09_01");//Il n'y a rien à voir ici. Et l'endroit est dangereux, vous saisissez ?
	AI_Output (self, other,"DIA_Jesper_Hallo_NurSo_09_02");//Alors, laissez votre arme où elle est et dites-moi ce que venez faire ici.
};
FUNC VOID DIA_Jesper_Hallo_Willkommen()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Willkommen_15_00");//Attila m'a donné une clé. C'est pour ça que je suis ici. Que faut-il que je fasse ?
	AI_Output (self, other,"DIA_Jesper_Hallo_Willkommen_09_01");//Vous aimeriez bien le savoir, hein ? Gardez votre calme.
	AI_Output (self, other,"DIA_Jesper_Hallo_Willkommen_09_02");//Allez voir Cassia. Elle vous attend.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID DIA_Jesper_Hallo_Umgelegt()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Umgelegt_15_00");//J'ai tué Attila. Il avait la clé des égouts sur lui.
	AI_Output (self, other,"DIA_Jesper_Hallo_Umgelegt_09_01");//(incrédule) Vous avez tué Attila ? (dédaigneux) Bah, c'était un minable, de toute façon...
	AI_Output (self, other,"DIA_Jesper_Hallo_Umgelegt_09_02");//Mais je vais vous dire quelque chose... si vous m'attaquez, je vous tue.
	
	Info_ClearChoices (DIA_Jesper_Hallo);
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Que faites-vous ici...",DIA_Jesper_Hallo_Was);	
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Conduisez-moi auprès de votre chef.",DIA_Jesper_Hallo_Anfuehrer);
};
FUNC VOID DIA_Jesper_Hallo_Was()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Was_15_00");//Que faites-vous dans cet endroit sombre et humide ?
	AI_Output (self, other,"DIA_Jesper_Hallo_Was_09_01");//(grogne) C'est ici que je vis. Encore une question stupide et je m'amuse à découper des dessins dans votre peau.
};
FUNC VOID DIA_Jesper_Hallo_Anfuehrer()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Anfuehrer_15_00");//Amenez-moi à votre chef.
	AI_Output (self, other,"DIA_Jesper_Hallo_Anfuehrer_09_01");//(part d'un rire sadique) Mon chef ? Ha, ha, ha ! Je suis sûr que Cassia aura envie de vous parler.
	AI_Output (self, other,"DIA_Jesper_Hallo_Anfuehrer_09_02");//Allez-y, mais surtout pas d'entourloupe !
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
};
//////////////////////////////////////////////////////////////////////
//	Info Lernen freischalten
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Bezahlen   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 1;
	condition   = DIA_Jesper_Bezahlen_Condition;
	information = DIA_Jesper_Bezahlen_Info;
	permanent   = TRUE;
	description	= "Pouvez-vous m'enseigner quelque chose ?";
};
FUNC INT DIA_Jesper_Bezahlen_Condition()
{	
	if (Join_Thiefs == TRUE)
	&& (Jesper_TeachSneak == FALSE)
	&& (Npc_KnowsInfo (other,DIA_Cassia_Lernen))
	&& (Npc_GetTalentSkill (other, NPC_TALENT_SNEAK) == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Bezahlen_Info()
{	
	AI_Output (other, self, "DIA_Jesper_Bezahlen_15_00");//Pouvez-vous m'apprendre quelque chose ?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Jesper_Bezahlen_09_01");//Oui. Je peux vous apprendre à vous déplacer discrètement, et c'est gratuit.
		Jesper_TeachSneak = TRUE;
		Info_ClearChoices (DIA_Jesper_Bezahlen);
	}
	else
	{
		AI_Output (self, other, "DIA_Jesper_Bezahlen_09_02");//Vous voulez apprendre à vous déplacer sans faire de bruit ? Ça vous coûtera 100 pièces d'or.
		B_Say_Gold (self, other, Jesper_Cost);
		
		Info_ClearChoices (DIA_Jesper_Bezahlen);
		Info_AddChoice (DIA_Jesper_Bezahlen,"Peut-être plus tard... (RETOUR)",DIA_Jesper_Bezahlen_Spaeter);
		Info_AddChoice (DIA_Jesper_Bezahlen,"Très bien, je veux apprendre à être discret (payer 100 pièces d'or).",DIA_Jesper_Bezahlen_Okay);
	};
};
FUNC VOID DIA_Jesper_Bezahlen_Spaeter()
{
	Info_ClearChoices (DIA_Jesper_Bezahlen);
};
FUNC VOID DIA_Jesper_Bezahlen_Okay()
{
	AI_Output (other, self, "DIA_Jesper_Bezahlen_Okay_15_00");//D'accord. Je veux apprendre à me déplacer discrètement.
	
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (other, self, "DIA_Jesper_Bezahlen_Okay_15_01");//Voici votre or.
		AI_Output (self, other, "DIA_Jesper_Bezahlen_Okay_09_02");//Prévenez-moi quand vous serez prêt.
		Jesper_TeachSneak = TRUE;
		Info_ClearChoices (DIA_Jesper_Bezahlen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Jesper_Bezahlen_Okay_09_03");//Vous n'apprendrez rien gratuitement.
		Info_ClearChoices (DIA_Jesper_Bezahlen);
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Schleichen 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Schleichen   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 10;
	condition   = DIA_Jesper_Schleichen_Condition;
	information = DIA_Jesper_Schleichen_Info;
	permanent   = TRUE;
	description = "Apprenez-moi l'art de la discrétion.";
};
//--------------------------------------
var int DIA_Jesper_Schleichen_permanent;
//-------------------------------------- 
FUNC INT DIA_Jesper_Schleichen_Condition()
{	
	if (Jesper_TeachSneak == TRUE) 
	&& (DIA_Jesper_Schleichen_permanent == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Schleichen_Info()
{
	AI_Output (other, self, "DIA_Jesper_Schleichen_15_00");//Apprenez-moi à me déplacer sans faire de bruit.
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_SNEAK)
	{
		AI_Output (self, other, "DIA_Jesper_Schleichen_09_01");//La discrétion est essentielle pour tout voleur qui se respecte. Surtout quand on se trouve chez quelqu'un d'autre.
		AI_Output (self, other, "DIA_Jesper_Schleichen_09_02");//Vous avez le pas trop lourd. N'oubliez pas que la plupart des gens ont le sommeil léger.
		AI_Output (self, other, "DIA_Jesper_Schleichen_09_03");//Ce n'est qu'en avançant discrètement que vous pourrez travailler sans risque d'être dérangé.
		DIA_Jesper_Schleichen_permanent = TRUE;
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Freunde getötet
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Killer   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 2;
	condition   = DIA_Jesper_Killer_Condition;
	information = DIA_Jesper_Killer_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Jesper_Killer_Condition()
{	
	if Npc_IsDead (Cassia)
	|| Npc_IsDead (Ramirez)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Killer_Info()
{
	if  Npc_IsDead (Cassia)
	&&  Npc_IsDead (Ramirez)
	{
		AI_Output (self, other, "DIA_Jesper_Killer_09_00");//Vous avez tué mes amis ! Pourquoi avez-vous fait ça, sale assassin ?
		AI_Output (self, other, "DIA_Jesper_Killer_09_01");//Je vais vous envoyer chez Béliar !
	}
	else if Npc_IsDead (Cassia)
	{
		AI_Output (self, other, "DIA_Jesper_Killer_09_02");//Vous avez tué Cassia, espèce de sale meurtrier ! Mais vous n'irez pas plus loin !
		
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE,1); 
	}
	else if  Npc_IsDead (Ramirez)
	{
		AI_Output (self, other, "DIA_Jesper_Killer_09_03");//J'ai fait plus de choses pour Ramirez et amassé plus d'argent que vous n'en verrez jamais.
		AI_Output (self, other, "DIA_Jesper_Killer_09_04");//Et vous les avez tués, sale chien ! La note va être salée !
		
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE,1); 
	};
	
};
//////////////////////////////////////////////////////////////////////
//	Info Bogen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Bogen   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 10;
	condition   = DIA_Jesper_Bogen_Condition;
	information = DIA_Jesper_Bogen_Info;
	permanent   = FALSE;
	description = "Est-ce que par hasard vous sauriez quelque chose sur l'arc de Bosper ?";
};

FUNC INT DIA_Jesper_Bogen_Condition()
{	
	if (Npc_HasItems (other, ItRw_Bow_L_03_MIS) < 1)
	&& (MIS_Bosper_Bogen == LOG_RUNNING)
	&& (Join_Thiefs == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Bogen_Info()
{
	AI_Output (other, self, "DIA_Jesper_Bogen_15_00");//Dites, vous ne sauriez rien au sujet de l'arc de Bosper ?
	AI_Output (self, other, "DIA_Jesper_Bogen_09_01");//Le fabricant d'arcs, vous voulez dire ? Oui, son arc est quelque part par là, dans un coffre.
	AI_Output (self, other, "DIA_Jesper_Bogen_09_02");//Mais sachez qu'il y a des rats dans le coin. Vous n'avez qu'à aller le chercher si les rongeurs ne vous gênent pas.
	AI_Output (self, other, "DIA_Jesper_Bogen_09_03");//Oh, et le coffre est fermé bien sûr. Il va vous falloir crocheter la serrure. (sourit) J'espère que vous avez encore vos crochets...
	
	Wld_InsertNpc (Giant_Rat, "NW_CITY_KANAL_ROOM_01_01");	
	Wld_InsertNpc (Giant_Rat, "NW_CITY_KANAL_ROOM_01_02");	
	Wld_InsertNpc (Giant_Rat, "NW_CITY_KANAL_ROOM_01_03");
};
//////////////////////////////////////////////////////////////////////
//	Info Tür
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Tuer   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 10;
	condition   = DIA_Jesper_Tuer_Condition;
	information = DIA_Jesper_Tuer_Info;
	permanent   = FALSE;
	description = "Qu'est-ce qui se trouve derrière cette porte verrouillée ?";
};

FUNC INT DIA_Jesper_Tuer_Condition()
{	
	if (MIS_CassiaRing == LOG_SUCCESS)
	&& (Kapitel >= 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Tuer_Info()
{
	AI_Output (other, self, "DIA_Jesper_Tuer_15_00");//Qu'y a-t-il derrière cette porte fermée à clé ?
	AI_Output (self, other, "DIA_Jesper_Tuer_09_01");//(sourit) Le coffre du maître des crocheteurs, Doigts-de-Fée.
	AI_Output (self, other, "DIA_Jesper_Tuer_09_02");//Il a placé dessus une serrure d'une complexité incroyable que personne n'a jamais réussi à crocheter.
	AI_Output (self, other, "DIA_Jesper_Tuer_09_03");//Malheureusement, Doigts-de-Fée s'est fait piquer et balancer de l'autre côté de la Barrière. J'imagine qu'il doit être mort à l'heure qu'il est...
	AI_Output (self, other, "DIA_Jesper_Tuer_09_04");//Mais si vous voulez tenter votre chance avec ce coffre, voici la clé de la porte.
	
	B_GiveInvItems (self, other, ItKe_Fingers,1);
};
//////////////////////////////////////////////////////////////////////
//	Info Truhe
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Truhe   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 10;
	condition   = DIA_Jesper_Truhe_Condition;
	information = DIA_Jesper_Truhe_Info;
	permanent   = FALSE;
	description = "J'ai réussi à ouvrir le coffre.";
};

FUNC INT DIA_Jesper_Truhe_Condition()
{	
	if (Mob_HasItems ("MOB_FINGERS", Itmi_Gold) < 300)
	|| (Mob_HasItems ("MOB_FINGERS", Itmi_Silvercup) < 5)
	|| (Mob_HasItems ("MOB_FINGERS", Itmi_Goldcup) < 1)
	|| (Mob_HasItems ("MOB_FINGERS", ItAM_Strg_01) < 1)
	|| (Mob_HasItems ("MOB_FINGERS", ItPO_perm_Dex) < 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Truhe_Info()
{
	AI_Output (other, self, "DIA_Jesper_Truhe_15_00");//J'ai réussi à ouvrir le coffre.
	AI_Output (self, other, "DIA_Jesper_Truhe_09_01");//C'est impossible ! Ça alors ! On dira que nous venons de trouver notre nouveau maître crocheteur.
	AI_Output (self, other, "DIA_Jesper_Truhe_09_02");//Félicitations pour cet exploit !
	
	B_GivePlayerXP (XP_JesperTruhe);
};  



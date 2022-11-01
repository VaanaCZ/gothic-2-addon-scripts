///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_EXIT   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 999;
	condition   = DIA_Nagur_EXIT_Condition;
	information = DIA_Nagur_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Nagur_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Nagur_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Nagur_PICKPOCKET (C_INFO)
{
	npc			= VLK_493_Nagur;
	nr			= 900;
	condition	= DIA_Nagur_PICKPOCKET_Condition;
	information	= DIA_Nagur_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Nagur_PICKPOCKET_Condition()
{
	C_Beklauen (75, 150);
};
 
FUNC VOID DIA_Nagur_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Nagur_PICKPOCKET);
	Info_AddChoice		(DIA_Nagur_PICKPOCKET, DIALOG_BACK 		,DIA_Nagur_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Nagur_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Nagur_PICKPOCKET_DoIt);
};

func void DIA_Nagur_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Nagur_PICKPOCKET);
};
	
func void DIA_Nagur_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Nagur_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info vor dem Auftrag (Spieler hat noch nicht mit Kardif geredet)
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Hallo   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 2;
	condition   = DIA_Nagur_Hallo_Condition;
	information = DIA_Nagur_Hallo_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Hallo_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk)
	&& (DIA_Kardif_Diebeswerk_permanent == FALSE))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Hallo_Info()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Nagur_Hallo_08_00");//Je n'ai pas le temps de discuter avec vous. Si vous cherchez des renseignements, allez voir Kardif.
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output (self, other, "DIA_Nagur_Hallo_08_01");//Laissez-moi tranquille, d'accord ?
		AI_StopProcessInfos (self);
	};
};
///////////////////////////////////////////////////////////////////////
//	Job Angebot
///////////////////////////////////////////////////////////////////////
	var int NagurHack;
	
	func void B_Nagur_Abfertigen()
	{
		var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
		if (Hlp_IsItem (heroArmor, ItAr_MIL_L) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_MIL_M) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_PAL_M) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_PAL_H) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_NOV_L) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_KDF_L) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_KDF_H) == FALSE)
		{
			AI_Output (self ,other,"DIA_Nagur_Add_08_02"); //N'allez pas croire que je ne vous ai pas reconnu juste parce que vous avez changé de fringues !
		};
		
		AI_Output (self ,other,"DIA_Nagur_Add_08_03"); //(conspirateur) Vous vous apprêtez à mettre votre nez là où il ne faut pas...
		AI_Output (self ,other,"DIA_Nagur_Add_08_04"); //Fichez-moi le camp !
		
		MIS_Nagur_Bote = LOG_SUCCESS; //HACK: Attila kommt bei 3* Success oder 1* suckt --> nur noch die anderen beiden Missionen sind Trigger
		NagurHack = TRUE;
		AI_StopProcessInfos (self);
	};

INSTANCE DIA_Nagur_Job   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 3;
	condition   = DIA_Nagur_Job_Condition;
	information = DIA_Nagur_Job_Info;
	permanent   = FALSE;
	description = "Kardif dit que vous pourriez avoir un travail pour moi.";
};
FUNC INT DIA_Nagur_Job_Condition()
{	
	if (DIA_Kardif_Diebeswerk_permanent == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Job_Info()
{
	AI_Output (other, self, "DIA_Nagur_Job_15_00");//Kardif m'a dit que vous auriez peut-être du travail à me proposer.
	if (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Nagur_Add_08_00"); //Il n'y a pas de travail pour les gens du monastère sur le port. (éclate de rire)
		B_Nagur_Abfertigen();
	}
	else if (other.guild == GIL_MIL)
	|| 		(other.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Nagur_Add_08_01"); //Il n'y a pas de travail pour les soldats du roi sur le port.
		B_Nagur_Abfertigen();
	}
	else
	{
		AI_Output (self, other, "DIA_Nagur_Job_08_01");//(évalue du regard) Alors, comme ça, on cherche un travail spécial, hein ? Très bien, mais c'est moi qui dicte les conditions, compris ?
		AI_Output (other, self, "DIA_Nagur_Job_15_02");//Qu'est-ce que cela signifie ?
		AI_Output (self, other, "DIA_Nagur_Job_08_03");//Ça signifie que vous faites ce que je vous dis et que vous avez droit à un tiers du butin.
		AI_Output (self, other, "DIA_Nagur_Job_08_04");//Si ça ne vous plaît pas, je n'ai rien pour vous.
	
		Info_ClearChoices (DIA_Nagur_Job);
		Info_AddChoice  (DIA_Nagur_Job,"On est associés, alors c'est cinquante-cinquante.",DIA_Nagur_Job_Halbe);
		Info_AddChoice  (DIA_Nagur_Job,"Très bien, c'est vous le chef.",DIA_Nagur_Job_Klar);
	};
};
FUNC VOID DIA_Nagur_Job_Klar()
{
	AI_Output (other, self, "DIA_Nagur_Job_Klar_15_00");//Très bien, c'est vous le patron.
	AI_Output (self, other, "DIA_Nagur_Job_Klar_08_01");//Bien. Quand vous serez prêt à vous enrichir, faites-le moi savoir.
	Nagur_Deal = 80;
	Info_ClearChoices (DIA_Nagur_Job);
};
FUNC VOID DIA_Nagur_Job_Halbe()
{
	AI_Output (other, self, "DIA_Nagur_Job_Halbe_15_00");//Si on doit être partenaires, c'est cinquante-cinquante.
	AI_Output (self, other, "DIA_Nagur_Job_Halbe_08_01");//Bon, j'essayais. D'accord, on fait moitié-moitié.
	Nagur_Deal = 120;
	Info_ClearChoices (DIA_Nagur_Job);
};
///////////////////////////////////////////////////////////////////////
//	Info Auftrag
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Auftrag   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 4;
	condition   = DIA_Nagur_Auftrag_Condition;
	information = DIA_Nagur_Auftrag_Info;
	permanent   = FALSE;
	description = "Très bien, quel est le plan ?";
};

FUNC INT DIA_Nagur_Auftrag_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Nagur_Job))
	&& (MIS_Nagur_Bote != LOG_SUCCESS) //also hier NICHT B_Nagur_Abfertigen durchlaufen
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Auftrag_Info()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_15_00");//Bien, quel est votre plan ?
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_01");//Vous connaissez Baltram le marchand, pas vrai ? Dans le cas contraire, il est grand temps que vous alliez lui parler.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_02");//Ce Baltram travaille avec un messager qui lui livre des marchandises en provenance de la ferme d'Akil.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_03");//Ou, du moins, il TRAVAILLAIT avec un messager... jusqu'à ce que je tranche la gorge à ce dernier. Donc, Baltram doit en trouver un autre. Et ce sera vous.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_04");//Votre boulot consiste à vous faire engager par Baltram et à aller chercher ce qu'Akil doit lui livrer.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_05");//Vous m'amenez le paquet, je le vends à un client, et il ne nous reste plus qu'à partager.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_06");//Mais n'essayez surtout pas de me doubler en le vendant vous-même, pigé ?
	
	Info_ClearChoices (DIA_Nagur_Auftrag);
	Info_AddChoice    (DIA_Nagur_Auftrag,"Très bien, je suis fin prêt (FIN)",DIA_Nagur_Auftrag_Okay);
	Info_AddChoice    (DIA_Nagur_Auftrag,"Où puis-je trouver Baltram ?",DIA_Nagur_Auftrag_Baltram);
	Info_AddChoice    (DIA_Nagur_Auftrag,"Quand devrais-je parler à Baltram ?",DIA_Nagur_Auftrag_Wann);
	Info_AddChoice    (DIA_Nagur_Auftrag,"Où est la ferme d'Akil ?",DIA_Nagur_Auftrag_Akil);
	Info_AddChoice    (DIA_Nagur_Auftrag,"Qu'est-ce que cela me rapportera ?",DIA_Nagur_Auftrag_Gewinn);

};
FUNC VOID DIA_Nagur_Auftrag_Akil()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Akil_15_00");//Où se trouve la ferme d'Akil ?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Akil_08_01");//Sortez de la ville par la porte est, celle qui donne directement sur la place du marché.
	AI_Output (self, other, "DIA_Nagur_Auftrag_Akil_08_02");//Là, prenez la route de droite jusqu'à arriver à un petit escalier taillé dans la roche.
	AI_Output (self, other, "DIA_Nagur_Auftrag_Akil_08_03");//Il ne vous restera plus qu'à l'emprunter pour arriver à la ferme d'Akil.
};
FUNC VOID DIA_Nagur_Auftrag_Gewinn()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Gewinn_15_00");//Combien devrait-on gagner ?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Gewinn_08_01");//Je ne sais pas au juste, mais je dirais dans les 400 pièces d'or.
};
FUNC VOID DIA_Nagur_Auftrag_Baltram()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Baltram_15_00");//Où puis-je trouver Baltram ?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Baltram_08_01");//Il a un étal sur la place du marché.
};
FUNC VOID DIA_Nagur_Auftrag_Wann()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Wann_15_00");//Quand faut-il que j'aille parler à Baltram ?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Wann_08_01");//Vous pouvez y aller tout de suite. Il a dû comprendre que son messager n'allait plus revenir je pense... (part d'un rire sadique)
};
FUNC VOID DIA_Nagur_Auftrag_Okay()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Okay_15_00");//Bon, je suis prêt.
	AI_Output (self, other, "DIA_Nagur_Auftrag_Okay_08_01");//Parfait, alors, allez-y. Mais si vous essayez de me doubler, vous serez vite aussi refroidi que le messager. Ne l'oubliez surtout pas !
	MIS_Nagur_Bote = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Nagur,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Nagur,LOG_RUNNING);
	B_LogEntry (TOPIC_Nagur,"Je dois convaincre Baltram de m'engager comme nouveau coursier. Puis je devrai récupérer une livraison du fermier Akil et l'apporter à Nagur.");
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Success   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 5;
	condition   = DIA_Nagur_Success_Condition;
	information = DIA_Nagur_Success_Info;
	permanent   = FALSE;
	description = "J'ai acheté le paquet.";
};

FUNC INT DIA_Nagur_Success_Condition()
{	
	if (MIS_Nagur_Bote == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_BaltramPaket) >=1)
	&& (Nagur_Ausgeliefert == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Success_Info()
{
	AI_Output (other, self, "DIA_Nagur_Success_15_00");//Je vous ai amené le paquet.
	AI_Output (self, other, "DIA_Nagur_Success_08_01");//Bien joué. Je m'occupe de le vendre. Revenez demain.
	
	B_LogEntry (TOPIC_Nagur,   "J'ai livré la marchandise à Nagur. Il me paiera demain.");
	
	AI_StopProcessInfos (self);
	
	if B_GiveInvItems (other, self,ItMi_BaltramPaket ,1)
	{
		Npc_RemoveInvItems (self, ItMi_BaltramPaket,1);
	};
	NagurDay = B_GetDayPlus();  
};
///////////////////////////////////////////////////////////////////////
//	Info Deal
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Deal   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 6;
	condition   = DIA_Nagur_Deal_Condition;
	information = DIA_Nagur_Deal_Info;
	permanent   = TRUE;
	description = "Alors avez-vous vendu les marchandises ?";
};
//---------------------------------
var int DIA_Nagur_Deal_permanent; 
//---------------------------------
FUNC INT DIA_Nagur_Deal_Condition()
{	
	if (DIA_Nagur_Deal_permanent == FALSE)
	&& (MIS_Nagur_Bote == LOG_RUNNING)
	&& (Nagur_Ausgeliefert == FALSE)
	&& Npc_KnowsInfo (other,DIA_Nagur_Success)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Deal_Info()
{
	AI_Output (other, self, "DIA_Nagur_Deal_15_00");//Alors, vous avez vendu la marchandise ?
	
	if (B_GetDayPlus() > NagurDay) 
	{
		AI_Output (self, other, "DIA_Nagur_Deal_08_01");//Oui, mais pour moins que je pensais. Je n'en ai tiré que 300 pièces d'or.
		AI_Output (self, other, "DIA_Nagur_Deal_08_02");//Une partie va à mes employeurs...
		AI_Output (self, other, "DIA_Nagur_Deal_08_03");//Et Kardif a droit à son pourcentage habituel.
		AI_Output (self, other, "DIA_Nagur_Deal_08_04");//Ce qui nous laisse 240 pièces d'or à nous partager. Tiens, voilà ta part.
		AI_Output (self, other, "DIA_Nagur_Deal_08_05");//Tu as fait du bon travail. Je l'ai déjà dit à mes employeurs.
		AI_Output (self, other, "DIA_Nagur_Deal_08_06");//Maintenant, je ne suis plus dans le coup.
		
		B_GiveInvItems (self,other,ItMi_Gold,Nagur_Deal);
		MIS_Nagur_Bote = LOG_SUCCESS;
		MIS_Baltram_ScoutAkil = LOG_FAILED;
		B_GivePlayerXP (XP_Nagur_Bote);
		DIA_Nagur_Deal_permanent = TRUE;
		Diebesgilde_Okay = (Diebesgilde_Okay + 1);
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output (self, other, "DIA_Nagur_Deal_08_07");//Non, pas encore. Ce genre de chose prend du temps. C'est que je veux en tirer un bon prix...
	};
};
///////////////////////////////////////////////////////////////////////
//	Info erneutes ansprechen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Auftraggeber   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Auftraggeber_Condition;
	information = DIA_Nagur_Auftraggeber_Info;
	permanent   = FALSE;
	description = "Qui sont vos employeurs ?";
};

FUNC INT DIA_Nagur_Auftraggeber_Condition()
{	
	if (MIS_Nagur_Bote == LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Auftraggeber_Info()
{
	AI_Output (other, self, "DIA_Nagur_Auftraggeber_15_00");//Qui sont vos employeurs ?
	AI_Output (self, other, "DIA_Nagur_Auftraggeber_08_01");//Vous ne croyez tout de même pas que je vais répondre à cette question, si ?
};
///////////////////////////////////////////////////////////////////////
//	Info erneutes ansprechen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Fazit   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Fazit_Condition;
	information = DIA_Nagur_Fazit_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Fazit_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Nagur_Auftraggeber)
	&& Npc_IsInState (self,ZS_Talk))
	&& (Knows_SecretSign == FALSE) 
	&& (NagurHack == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Fazit_Info()
{	
	AI_Output (self, other, "DIA_Nagur_Fazit_08_00");//Le boulot s'est bien déroulé, mais je n'ai pas pour habitude de parler de mes employeurs, alors, ne vous emballez pas.
	AI_StopProcessInfos  (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Nagur im Knast
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Knast   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Knast_Condition;
	information = DIA_Nagur_Knast_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Knast_Condition()
{	
	if Npc_IsInState (self,ZS_Talk)
	&& (Npc_GetDistToWP (self,"NW_CITY_HABOUR_KASERN_NAGUR") <= 1000)
	&& (Nagur_ausgeliefert == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Knast_Info()
{	
	AI_Output (self, other, "DIA_Nagur_Knast_08_00");//Vous m'avez trahi ! Grave erreur ! Et maintenant, tirez-vous !
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
/////////////////////////////////////////
INSTANCE DIA_Nagur_Sign   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Sign_Condition;
	information = DIA_Nagur_Sign_Info;
	permanent   = FALSE;
	description	= "(Faire le signe de reconnaissance des voleurs)";
};

FUNC INT DIA_Nagur_Sign_Condition()
{	
	if (MIS_Nagur_Bote == LOG_SUCCESS)
	&& (Knows_SecretSign == TRUE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Sign_Info()
{	
	AI_PlayAni (other,"T_YES");
	AI_Output (self, other, "DIA_Nagur_Sign_08_00");//Alors, vous l'avez fait. Vous savez qui sont mes employeurs désormais.
	AI_Output (self, other, "DIA_Nagur_Sign_08_01");//Faites bien ce que dit Cassia. On se moque de qui vous êtes. La seule chose qui compte à nos yeux, c'est que vous soyez des nôtres.
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Perm   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Perm_Condition;
	information = DIA_Nagur_Perm_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Perm_Condition()
{	
	if (MIS_Nagur_Bote == LOG_SUCCESS)
	&&  Npc_KnowsInfo (other,DIA_Nagur_Sign) 
	&& Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Perm_Info()
{	
	AI_Output (self, other, "DIA_Nagur_Perm_08_00");//Cherchez quelqu'un d'autre. Il y a bien assez de monde dans les rues et je n'ai rien de plus pour vous.
	AI_StopProcessInfos (self);
};

























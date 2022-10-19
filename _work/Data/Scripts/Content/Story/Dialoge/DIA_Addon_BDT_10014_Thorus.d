//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_EXIT   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 999;
	condition   = DIA_Addon_Thorus_EXIT_Condition;
	information = DIA_Addon_Thorus_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Thorus_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Thorus_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Hi   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 2;
	condition   = DIA_Addon_Thorus_Hi_Condition;
	information = DIA_Addon_Thorus_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Thorus_Hi_Condition()
{	
	if (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Hi_Info()
{	
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_00");//Vous connaissez le r�glement. Personne n'est autoris� � rentrer dans la mine sans une tablette de pierre rouge.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Hi_15_01");//Oubliez la mine - je cherche � voir Raven.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_02");//Aucune importance. Nous avons un r�glement, et il est le m�me pour tout le monde. M�me vous !
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_03");//Faites demi-tour. Si vous tentez d'acc�der � la place haute sans autorisation, les autres gardes vous tueront. C'est le r�glement, c'est tout !
	
	if !Npc_IsDead (Esteban)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_04");//Si �a vous pose un probl�me, allez en parler � Esteban? C'est le responsable de ce camp.
	};
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "START");
};
//----------------------------------------------------------------------
//	Info Raven
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Raven   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 3;
	condition   = DIA_Addon_Thorus_Raven_Condition;
	information = DIA_Addon_Thorus_Raven_Info;
	permanent   = FALSE;
	description = "Je dois rencontrer Raven, c'est important...";
};
FUNC INT DIA_Addon_Thorus_Raven_Condition()
{	
	if (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Raven_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raven_15_00");//Je dois rencontrer Raven - c'est important !
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_01");//Ah ouais ? Vous croyez vraiment que vous avez une chance d'arriver jusqu'� lui ?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_02");//Ses gardes ont ordre de ne laisser passer personne. Vous seriez mort avant m�me d'avoir le temps de l'apercevoir.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_03");//Alors un conseil : oubliez cette id�e stupide !

	Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RavenKDW,"Raven est le chef des bandits. Il va falloir que j'en �limine certains pour pouvoir remonter jusqu'� lui."); 
};
//----------------------------------------------------------------------
//	Info Zeit
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Zeit   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 4;
	condition   = DIA_Addon_Thorus_Zeit_Condition;
	information = DIA_Addon_Thorus_Zeit_Info;
	permanent   = FALSE;
	description = "Vous ne me reconnaissez pas ? Vous m'avez vu � l'ancien camp...";
};
FUNC INT DIA_Addon_Thorus_Zeit_Condition()
{	
	if (RavenIsDead == FALSE) 
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Zeit_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Zeit_15_00");//Vous ne vous souvenez pas de moi ? De l'ancien camp...
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_01");//Vous �tiez l'un des prisonniers ?! Peut-�tre que vous �tiez l'un de mes gardes... Et ? En quoi est-ce que �a fait de nous des alli�s ?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_02");//En rien...
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_03");//Peut-�tre que c'est vous qui avait d�truit la Barri�re - mais peut-�tre que c'est vous qui avez tu� mes potes.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_04");//Et alors ?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_05");//Cette �poque est r�volue.
	
	if !Npc_IsDead (Esteban)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_06");//Vous voulez rentrer ici ? Alors procurez-vous une pierre rouge et arr�tez de me faire perdre mon temps.
	};
};

//----------------------------------------------------------------------
//	Die guten alten Zeiten
//----------------------------------------------------------------------
var int Thorus_GoodOldPerm;
//----------------------------------------------------------------------
instance DIA_Addon_BDT_10014_Thorus_GoodOldPerm  (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 4;
	condition   = DIA_Addon_Thorus_GoodOldPerm_Condition;
	information = DIA_Addon_Thorus_GoodOldPerm_Info;
	permanent   = TRUE;
	description = "Allez, laissez-moi rentrer. En souvenir du bon vieux temps.";
};
FUNC INT DIA_Addon_Thorus_GoodOldPerm_Condition()
{	
	if (MIS_Send_Buddler != LOG_SUCCESS)
	&& (Npc_KnowsInfo (other, DIA_Addon_BDT_10014_Thorus_Zeit))
	&& (RavenIsDead == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_GoodOldPerm_Info()
{	
	AI_Output (other, self, "DIA_Addon_Thorus_Add_15_00"); //Allez, laissez-moi rentrer. En souvenir du bon vieux temps.
	if (Thorus_GoodOldPerm == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_01"); //Laissez-moi vous expliquer quelque chose. Vous savez pourquoi je suis toujours en vie ?
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_02"); //Parce que j'ai toujours �t� loyal envers les miens.
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_03"); //Je ne suis pas toujours d'accord avec tout ce que fait Raven. Par contre, jamais je ne d�rogerai au r�glement. 
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_04"); //Et vous non plus !
		Thorus_GoodOldPerm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_05"); //(fermement) Non !
	};
};

//----------------------------------------------------------------------
//Abfrage auf alle Tokens bis auf den ROTEN 
//----------------------------------------------------------------------
FUNC INT C_PlayerHasWrongToken ()
{
	if (C_ScHasMagicStonePlate () == TRUE)
	|| (Npc_HasItems (hero, ItWr_StonePlateCommon_Addon) >= 1)//Klar.
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_02) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_03) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_04) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_05) >= 1)
	{
		return TRUE;
	};
	return FALSE;
};
//----------------------------------------------------------------------
//	Info Stein
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Stein   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Stein_Condition;
	information = DIA_Addon_Thorus_Stein_Info;
	permanent   = TRUE;
	description = "J'ai ici une tablette de pierre...";
};
FUNC INT DIA_Addon_Thorus_Stein_Condition()
{	
	if (C_PlayerHasWrongToken () == TRUE)
	&& (RavenIsDead == FALSE)
	&& (MIS_Send_Buddler != LOG_RUNNING)
	&& (MIS_Send_Buddler != LOG_SUCCESS)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Stein_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Stein_15_00");//J'ai ici une tablette de pierre...
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Stein_12_01");//Ce n'est pas la bonne tablette de pierre. Seules les pierres rouges sont importantes.
};
//----------------------------------------------------------------------
//	Info Rein
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Rein   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Rein_Condition;
	information = DIA_Addon_Thorus_Rein_Info;
	permanent   = FALSE;
	description = "J'ai ici une tablette de pierre rouge...";
};
FUNC INT DIA_Addon_Thorus_Rein_Condition()
{	
	if (Npc_HasItems (other, ItMi_Addon_Stone_01) >= 1)
	&& (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Rein_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_00");//J'ai ici une tablette de pierre rouge...
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_01");//Bien.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_02");//Vous avez tu� Esteban - c'est donc vous qui reprendrez son poste.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_03");//Ces temps-ci, on a quelques probl�mes avec des foreurs au fond de la mine.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_04");//Trois mineurs sont d�j� morts � cause d'eux. Votre travail consiste � leur trouver des rempla�ants.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_05");//Et quand est-ce que je pourrai enfin acc�der � cette foutue mine ?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_06");//Faites votre travail - apr�s cela, vous serez libre de faire ce que vous voulez.
	
	MIS_Send_Buddler = LOG_RUNNING;
	Log_CreateTopic (Topic_Addon_Buddler,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Buddler, LOG_RUNNING);
	B_LogEntry (Topic_Addon_Buddler,"J'ai repris le travail d'Esteban, il faut donc que j'envoie trois mineurs dans les galeries.");
};
//----------------------------------------------------------------------
//	Info drei typen losgeschickt
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Sent   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Sent_Condition;
	information = DIA_Addon_Thorus_Sent_Info;
	permanent   = FALSE;
	description = "J'ai envoy� trois types � la mine.";
};
FUNC INT DIA_Addon_Thorus_Sent_Condition()
{	
	if (Player_SentBuddler >= 3)
	&& (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Sent_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Sent_15_00");//J'ai envoy� trois types � la mine.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Sent_12_01");//Bien. Dans ce cas, en ce qui me concerne, vous �tes libre d'entrer.

	MIS_Send_Buddler = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
};
//----------------------------------------------------------------------
//	Info Armor
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Armor   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Armor_Condition;
	information = DIA_Addon_Thorus_Armor_Info;
	permanent   = FALSE;
	description = "H�, qu'est-ce que c'est que cette armure ? O� puis-je trouver une armure comme celle-la ?";
};
FUNC INT DIA_Addon_Thorus_Armor_Condition()
{	
	if (RavenIsDead == FALSE)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Armor_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Armor_15_00");//H�, qu'est-ce que c'est que cette armure ? O� puis-je trouver une armure comme celle-la ?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_01");//Vous ne pouvez pas en trouver une. Cette armure est r�serv�e � la garde personnelle de Raven.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_02");//Je ne pense pas qu'il y ait un examen d'entr�e pour les nouveaux candidats. Mais la d�cision finale ne m'appartient pas - seul Raven a ce pouvoir.
};
//----------------------------------------------------------------------
//	Info Gefangene
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Gefangene   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 88;
	condition   = DIA_Addon_Thorus_Gefangene_Condition;
	information = DIA_Addon_Thorus_Gefangene_Info;
	permanent   = FALSE;
	description = "Comment vont les prisonniers ?";
};
FUNC INT DIA_Addon_Thorus_Gefangene_Condition()
{	
	if !Npc_IsDead (Bloodwyn)
	&&  Npc_KnowsInfo (other,DIA_Addon_Patrick_Hi)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Gefangene_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_00");//Comment vont les prisonniers ?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_01");//Hmm, ils font leur travail. A ce que je sache, ils extraient de l'or, en ce moment.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_02");//Et s'ils s'�vadent...?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_03");//...Bloodwyn ordonnera � ses gardes de les poursuivre. Mais je ne pense pas qu'ils soient assez inconscients pour tenter de s'�chapper.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_04");//� moins...
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_05");//� moins que quoi ?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_06");//...que quelqu'un ne les y incite. Mais je ne connais personne ici qui soit assez stupide pour cela... du moins, aussi longtemps que Bloodwyn se trouvera dans le camp.
	B_Say (other, self,"$VERSTEHE");
};
//----------------------------------------------------------------------
//	Info Speech
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Speech   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Speech_Condition;
	information = DIA_Addon_Thorus_Speech_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Thorus_Speech_Condition()
{	
	if Npc_IsDead (Bloodwyn)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Speech_Info()
{	
	
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_00");//Qu'est-ce que vous pr�parez, au juste ?
	AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_01");//Quoi ???
	
	if (RavenIsDead == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_02");//Maintenant, vous avez aussi �limin� Bloodwyn... je me demande simplement qui sera le suivant. Raven ? Ou peut-�tre moi ?
		AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_03");//Vous avez peur ?
		AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_04");//Je n'ai pas peur de me battre. Mais j'ai peur des cons�quences de vos actes.
	};
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_05");//Ce camp est tout ce qu'il nous reste.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_06");//Il ne fonctionne pas toujours � la perfection, mais il fonctionne.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_07");//Et avec chaque personne que vous �liminez, c'est une partie de notre communaut� qui se brise.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_08");//Nous sommes des bandits. Des parias, des hors-la-loi, des boucs �missaires.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_09");//Partout o� nous allons, nous sommes chass�s, enferm�s et abattus.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_10");//Pour nous, il n'existe aucun endroit meilleur que celui-ci, et jamais notre vie ne sera plus simple qu'elle ne l'est en ce moment.
	AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_11");//O� voulez-vous en venir ?
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_12");//Ces hommes ont besoin d'un commandant. Qui devrait-ce �tre ? Vous ? Vous, qui errez sans cesse d'un endroit � l'autre ?
};
//----------------------------------------------------------------------
//	Info Answer
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Answer   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Answer_Condition;
	information = DIA_Addon_Thorus_Answer_Info;
	permanent   = FALSE;
	description = "Alors prenez le commandement du camp.";
};
FUNC INT DIA_Addon_Thorus_Answer_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Speech)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Answer_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_00");//Dans ce cas, prenez le commandement de ce camp.
	
	if (RavenIsDead == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Answer_12_01");//Soit, mais � propos de Raven...?
		AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_02");//Raven aura bient�t d'autres soucis. Je compte m'occuper de lui prochainement.
	};
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_03");//Oh, et faites en sorte que les prisonniers puissent quitter le camp en paix.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Answer_12_04");//Bien. Je m'occuperai de tous les gardes ici.
	
	B_LogEntry (Topic_Addon_Sklaven,"Bloodwyn est mort, et Thorus veillera � ce que les esclaves puissent s'�chapper du campement."); 
	
	if !Npc_IsDead (PrisonGuard)
	{
		B_LogEntry (Topic_Addon_Sklaven,"Je vais retourner voir le 'gardien des esclaves'. Ensuite, Patrick et ses gars pourront s'enfuir."); 
	}
	else
	{
		B_LogEntry (Topic_Addon_Sklaven,"Le cas du 'gardien des esclaves' est r�gl�. Patrick peut maintenant s'enfuir avec ses gars."); 
	};
};
//----------------------------------------------------------------------
//	Info Raventot
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Raventot   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Raventot_Condition;
	information = DIA_Addon_Thorus_Raventot_Info;
	permanent   = FALSE;
	description = "C'est fait. Raven n'est plus.";
};
FUNC INT DIA_Addon_Thorus_Raventot_Condition()
{	
	if (RavenIsDead == TRUE)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Raventot_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_00");//C'est fait. Raven n'est plus.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_01");//�a veut dire que vous avez port� un sacr� coup � Beliar lui-m�me...
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_02");//Alors, vous allez poursuivre votre route ?
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_03");//Ma mission dans cette vall�e est termin�e. Je prendrais volontiers quelques jours de repos.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_04");//(rires) Ouais, vous ne tenez pas en place, pas vrai ? (s�rieusement) Faites attention � vous.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_05");//Qui sait, peut-�tre nous reverrons-nous un jour.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_06");//Qui sait. Vous devrez franchir bien des portes et des acc�s. Et fatalement, vous me verrez post� devant l'un d'eux...
	
	AI_StopProcessInfos (self);
	
};




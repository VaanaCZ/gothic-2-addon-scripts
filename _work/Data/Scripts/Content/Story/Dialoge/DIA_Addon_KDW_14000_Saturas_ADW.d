
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Saturas_ADW_EXIT   (C_INFO)
{
	npc         = KDW_14000_Addon_Saturas_ADW;
	nr          = 999;
	condition   = DIA_Addon_Saturas_ADW_EXIT_Condition;
	information = DIA_Addon_Saturas_ADW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Saturas_ADW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Saturas_ADW_EXIT_Info()
{
	AI_StopProcessInfos (self);
	AI_Output			(self, other, "DIA_Addon_Saturas_ADW_EXIT_14_00"); //Qu'Adanos vous prot�ge.
};
 // ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Saturas_ADW_PICKPOCKET (C_INFO)
{
	npc			= KDW_14000_Addon_Saturas_ADW;
	nr			= 900;
	condition	= DIA_Addon_Saturas_ADW_PICKPOCKET_Condition;
	information	= DIA_Addon_Saturas_ADW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es w�re einfach seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Saturas_ADW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Saturas_NW.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) 
	&& (other.attribute[ATR_DEXTERITY] >= (31 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Saturas_ADW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Saturas_ADW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Saturas_ADW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Saturas_ADW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Saturas_ADW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Saturas_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Saturas_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 31)
	{
		
		B_GiveInvItems (self, other, ItSc_Water01, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Saturas_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Saturas_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Saturas_ADW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info ADWStart
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADWStart		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Saturas_ADWStart_Condition;
	information	 = 	DIA_Addon_Saturas_ADWStart_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Saturas_ADWStart_Condition ()
{
	return TRUE;
};
func void DIA_Addon_Saturas_ADWStart_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_00"); //Adanos soit lou�. Vous voici enfin arriv�. Nous commencions � croire que vous ne reviendriez pas.
	AI_Output	(other, self, "DIA_Addon_Saturas_ADWStart_15_01"); //(irrit�) Quoi ? Comment �tes-vous d�j� arriv� ici ?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_02"); //Vous avez travers� le portail et nous vous avons suivi. Il ne nous a gu�re fallu longtemps pour arriver ici.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_03"); //Toutefois, vous n'�tiez pas l�. Nous sommes ici depuis plusieurs jours d�j�.
	AI_Output	(other, self, "DIA_Addon_Saturas_ADWStart_15_04"); //(surpris) PLUSIEURS JOURS ? Comment est-ce possible ?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_05"); //Lorsque nous ne sommes pas parvenus � vous retrouver, Nefarius a cherch� � d�terminer ce qui avait pu se passer. Il semblait totalement perplexe, jusque maintenant.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_06"); //Bien. Maintenant, vous �tes arriv� et pouvez commencer votre travail.

	Wld_InsertNpc (Giant_Rat ,"ADW_PORTALTEMPEL_11");
	Wld_InsertNpc (Giant_Rat ,"ADW_PORTALTEMPEL_11");

	Info_ClearChoices	(DIA_Addon_Saturas_ADWStart);
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Que s'est-il pass� entre-temps ?", DIA_Addon_Saturas_ADWStart_was );
};
func void DIA_Addon_Saturas_ADWStart_was ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_was_15_00"); //Qu'est-il arriv� entre-temps ?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_01"); //Nous avons effectu� de nombreuses d�couvertes nouvelles.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_02"); //Les s�ismes semblent effectivement plus forts ici. Nous ne sommes plus tr�s loin de leur centre.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_03"); //Les b�tisseurs de ces structures anciennes ont �rig� autrefois une ville en ces lieux - cela, nous pouvons l'affirmer.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_04"); //Toutefois, pour quelque raison, leur culture a disparu.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_05"); //Mais � ce jour, nous ne pouvons que sp�culer sur la raison de leur d�clin.

	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Avez-vous retrouv� la trace des disparus ?", DIA_Addon_Saturas_ADWStart_missingPeople );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Et Raven ?", DIA_Addon_Saturas_ADWStart_Raven );
};
func void DIA_Addon_Saturas_ADWStart_Raven ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_Raven_15_00"); //Et Raven ?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_01"); //Dans sa lettre, Raven parlait d'un temple, et disait qu'il tentait d'y entrer.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_02"); //Nous sommes unanimes sur un point : Raven aspire � profaner un temple d'Adanos.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_03"); //Les s�ismes sont manifestement le r�sultat d'un conflit entre des incantations mal�fiques et un puissant sort.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_04"); //Les portes du temple sont scell�es par magie, et cette magie est celle m�me qui invoque les sentinelles de pierre.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_05"); //Le temple se d�fend. Nous devons arr�ter Raven avant qu'il ne puisse p�n�trer dans le sanctuaire.
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Alors, que faire maintenant�?", DIA_Addon_Saturas_ADWStart_wastun );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Raven n'est qu'un baron du minerai d�chu, pas un magicien.", DIA_Addon_Saturas_ADWStart_RavenOnlyBaron );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Que cherche Raven � l'int�rieur du temple ?", DIA_Addon_Saturas_ADWStart_RavenAim );
};
func void DIA_Addon_Saturas_ADWStart_RavenAim ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_RavenAim_15_00"); //Que recherche Raven dans le temple ?
	//AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_01"); //Wir wissen es nicht. Es muss etwas sehr Wertvolles oder M�chtiges in dem Tempel sein.
	//AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_02"); //Aber wir k�nnen davon ausgehen, dass er nichts Gutes im Schilde f�hrt.
	AI_Output (self, other, "DIA_Addon_Bodo_14_01"); //Nous savons seulement que cela concerne un puissant artefact li� � Adanos et Beliar.
	AI_Output (self, other, "DIA_Addon_Bodo_14_02"); //(s�v�rement) Nous ne devons pas nous attendre � quoi que ce soit de bon...
};
func void DIA_Addon_Saturas_ADWStart_RavenOnlyBaron ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_15_00"); //Raven n'est qu'un baron du minerai d�chu, pas un magicien. Comment pourrait-il accomplir une invocation comme celle-l� ?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_01"); //Peut-�tre ne l'accomplit-il pas lui-m�me... peut-�tre s'agit-il d'un magicien ren�gat � sa solde ?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_02"); //Quoi qu'il en soit, nous DEVONS an�antir ce fl�au.
};
func void DIA_Addon_Saturas_ADWStart_missingPeople ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_missingPeople_15_00"); //Avez-vous retrouv� la trace des disparus ?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_01"); //Hier seulement, nous avons retrouv� le corps d'un p�cheur. Il �tait �tendu sous l'une des ruines, � l'est d'ici.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_02"); //Il semblerait que ce p�cheur �tait originaire de Khorinis. Peut-�tre devriez-vous tenter d'en apprendre davantage � ce sujet.
	Saturas_AboutWilliam = TRUE;

	B_LogEntry (TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche); 
};
func void DIA_Addon_Saturas_ADWStart_wastun ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun_15_00"); //Et ensuite ?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_01"); //Nous resterons ici et continuerons � �tudier cette culture ancienne.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_02"); //Les �crits anciens des b�tisseurs dissimulent de nombreux secrets que nous devons d�voiler - si nous voulons comprendre ce qu'il est arriv� ici, autrefois.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_03"); //Entre temps, nous avons pour vous quelques missions...
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Que dois-je faire ?", DIA_Addon_Saturas_ADWStart_wastun2 );
};
func void DIA_Addon_Saturas_ADWStart_wastun2 ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_00"); //Que dois-je faire ?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_01"); //Vous devez retrouver Raven et l'emp�cher de profaner le temple d'Adanos.
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_02"); //Par cela, je vous ordonne de l'�liminer.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_03"); //Si c'est la seule mani�re de l'arr�ter, alors... au nom d'Adanos, ce sera fait !
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_04"); //Lorsque vous serez en route, veillez � rassembler tous les �crits et reliques des b�tisseurs que vous trouverez, et ramenez-les nous.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_05"); //Nous devons en apprendre davantage sur ce peuple et son d�clin.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_06"); //Ce n'est que lorsque nous comprendrons les plans de Raven que nous pourrons les an�antir.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_07"); //De plus, vous devez trouver une mani�re de lib�rer les esclaves.
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_08"); //(cynique) Est-ce tout ? J'en ai pour une journ�e de travail, � peine !
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_09"); //(irrit�) Je sais que je vous demande beaucoup. Consid�rez cela comme une occasion de vous montrer digne de ma confiance.
	
	MIS_ADDON_Saturas_GoToRaven = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RavenKDW,"Raven profane le temple sacr� d'Adanos. Je dois l'en emp�cher... m�me s'il faut pour �a que je le tue."); 

	Log_CreateTopic (TOPIC_Addon_Sklaven, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Sklaven,"Saturas me demande de lib�rer les esclaves."); 

	Log_CreateTopic (TOPIC_Addon_Relicts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Relicts,"Saturas veut que je lui rapporte toutes les informations que je trouverai concernant l'ancien peuple des b�tisseurs."); 
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Je me mets en route, dans ce cas.", DIA_Addon_Saturas_ADWStart_back );
};
func void DIA_Addon_Saturas_ADWStart_back ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_ADWStart_back_15_00"); //Je me mets en route, dans ce cas.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_01"); //Une chose encore... Raven a r�uni un grand nombre de bandits autour de lui.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_02"); //En votre absence, nous avons d�p�ch� un autre membre de l'Anneau de l'eau ici.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_03"); //Nous lui avons ordonn� de se rendre dans le marais. Il n'est jamais revenu.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_04"); //Nous soup�onnons les bandits d'attaquer toutes les personnes qui ne leur ressemblent pas.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_05"); //Par cons�quent, vous devrez trouver une armure semblable � celle des bandits.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_06"); //C'est seulement ainsi que vous pourrez vous approcher d'eux sans vous faire attaquer imm�diatement.

	Log_CreateTopic (TOPIC_Addon_BDTRuestung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BDTRuestung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Les bandits tirent � vue sur tout ce qui ne leur ressemble pas. Il va me falloir trouver une armure de bandit pour esp�rer m'approcher d'eux."); 

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
};

///////////////////////////////////////////////////////////////////////
//	Info PoorRanger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_PoorRanger		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_PoorRanger_Condition;
	information	 = 	DIA_Addon_Saturas_PoorRanger_Info;

	description	 = 	"Quel est le pauvre imb�cile que vous avez envoy� dans le marais ?";
};

func int DIA_Addon_Saturas_PoorRanger_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Saturas_PoorRanger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_PoorRanger_15_00"); //Quel est le pauvre imb�cile que vous avez envoy� dans le marais ?
	AI_Output	(self, other, "DIA_Addon_Saturas_PoorRanger_14_01"); //Son nom �tait Lance.
	AI_Output	(self, other, "DIA_Addon_Saturas_PoorRanger_14_02"); //Je crains qu'il ne soit gu�re all� bien loin.
	
	Log_CreateTopic (TOPIC_Addon_Lance, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lance, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Lance,"Saturas a ordonn� � un d�nomm� Lance de se rendre dans les marais. Saturas craint maintenant que Lance ne soit pas all� bien loin..."); 
};

///////////////////////////////////////////////////////////////////////
//	Info Piraten
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Piraten		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Piraten_Condition;
	information	 = 	DIA_Addon_Saturas_Piraten_Info;

	description	 = 	"O� puis-je trouver une armure de bandit � ma taille ?";
};

func int DIA_Addon_Saturas_Piraten_Condition ()
{
	if (AlligatorJack.aivar [AIV_TalkedToPlayer] == FALSE)
	&& (Greg.aivar [AIV_TalkedToPlayer] == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Piraten_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Piraten_15_00"); //O� puis-je trouver une armure de bandit � ma taille ?
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_01"); //Il semblerait qu'un camp de pirates se trouve � l'ouest d'ici.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_02"); //A ce que je sache, ils sont en cheville avec les bandits.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_03"); //Je ne pense pas qu'ils vous attaquent si vous tentez de vous rapprocher d'eux.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_04"); //Peut-�tre trouverez-vous de l'aide aupr�s d'eux...

	B_LogEntry (TOPIC_Addon_BDTRuestung,"Saturas m'a dit que les pirates pourraient m'aider � trouver une armure."); 
};

///////////////////////////////////////////////////////////////////////
//	Info LanceLeiche
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_LanceLeiche		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_LanceLeiche_Condition;
	information	 = 	DIA_Addon_Saturas_LanceLeiche_Info;

	description	 = 	"J'ai trouv� le corps de Lance.";
};

func int DIA_Addon_Saturas_LanceLeiche_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_PoorRanger))
	&& (Npc_HasItems (NONE_Addon_114_Lance_ADW, ItRi_LanceRing) == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_LanceLeiche_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_LanceLeiche_15_00"); //J'ai trouv� le corps de Lance.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceLeiche_14_01"); //Que son �me repose en le royaume d'Adanos...
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceLeiche_14_02"); //Soyez prudent, mon fils. Je ne veux pas avoir � pleurer un autre d�c�s.
	
	TOPIC_End_Lance = TRUE;
	B_GivePlayerXP (XP_Addon_LanceLeiche);
};

///////////////////////////////////////////////////////////////////////
//	Info LanceRing
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_LanceRing		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_LanceRing_Condition;
	information	 = 	DIA_Addon_Saturas_LanceRing_Info;

	description	 = 	"Je vous ai apport� l'anneau d'aigue-marine de Lance.";
};

func int DIA_Addon_Saturas_LanceRing_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_LanceLeiche))
	&& (Npc_HasItems (other,ItRi_LanceRing))
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_LanceRing_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_LanceRing_15_00"); //Je vous ai apport� l'anneau d'aigue-marine de Lance.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceRing_14_01"); //Vous devriez me le donner. Il ne doit pas tomber entre des mains mal intentionn�es.
	B_GiveInvItems (other, self, ItRi_LanceRing, 1);		
	B_GivePlayerXP (XP_Addon_LanceRing);
};
///////////////////////////////////////////////////////////////////////
//	Info Tokens
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Tokens		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Saturas_Tokens_Condition;
	information	 = 	DIA_Addon_Saturas_Tokens_Info;
	permanent	 = 	TRUE;

	description	 = 	"A propos des reliques...";
};

func int DIA_Addon_Saturas_Tokens_Condition ()
{
	if (Saturas_SCBroughtAllToken == FALSE)
		{
			return TRUE;
		};
};

var int DIA_Addon_Saturas_Tokens_OneTime;
var int Saturas_SCBroughtAllToken;
var int Saturas_BroughtTokenAmount;
var int ScBroughtToken;
var int Saturas_SCFound_ItMi_Addon_Stone_01;
var int Saturas_SCFound_ItMi_Addon_Stone_02;
var int Saturas_SCFound_ItMi_Addon_Stone_03;
var int Saturas_SCFound_ItMi_Addon_Stone_04;
var int Saturas_SCFound_ItMi_Addon_Stone_05;

func void DIA_Addon_Saturas_Tokens_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_00"); //A propos de reliques...
	
	if (DIA_Addon_Saturas_Tokens_OneTime == FALSE)
	&& ((C_ScHasMagicStonePlate ())
	|| (Npc_HasItems (other,ItWr_StonePlateCommon_Addon)))
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_01"); //Je crois avoir sur moi quelque chose pour vous.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_02"); //Nous connaissons d�j� ce type de tablette de pierre. Elle ne nous m�nera h�las nulle part.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_03"); //�a ne peut pas �tre aussi simple...
		DIA_Addon_Saturas_Tokens_OneTime = TRUE;
	};
	
	
	var int BroughtToken;BroughtToken = 0;
	var int XP_BroughtTokens;XP_BroughtTokens = 0;
	
	if ((Npc_HasItems (other,ItMi_Addon_Stone_01)) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_02)) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_03)) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_04)) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_05)) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE))
	{	
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_04"); //Et CECI ?
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_05"); //Cela a l'air int�ressant... O� l'avez-vous trouv�e ?
              
 		B_LogEntry (TOPIC_Addon_Relicts,"J'ai remis � Saturas les reliques suivantes :"); 
                               
		if ((Npc_HasItems (other,ItMi_Addon_Stone_01)) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_01, 1);
				Saturas_SCFound_ItMi_Addon_Stone_01 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_06"); //Les bandits utilisent ces tablettes pierre comme monnaie d'�change.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_07"); //Ces tablettes portent la marque de Quarhodron, un grand guerrier.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_08"); //Il est le commandant dont le fils, Rhademes, a provoqu� le d�clin de la ville toute enti�re.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_09"); //(avec m�pris) Tss. Je parie que ces bandits n'ont pas la moindre id�e de la valeur de ce qu'ils �changent ainsi.
				Log_AddEntry (TOPIC_Addon_Relicts,"Une tablette de pierre rouge"); 
			};		
		if ((Npc_HasItems (other,ItMi_Addon_Stone_02)) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_02, 1);
				Saturas_SCFound_ItMi_Addon_Stone_02 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_10"); //J'ai trouv� ces tablettes dans un b�timent au sud d'ici.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_11"); //Ah ! Une tablette des veilleurs des morts. Ces veilleurs �taient charg�s d'invoquer les esprits de leurs morts.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_12"); //Les liens des b�tisseurs avec leurs anc�tres �taient tr�s puissants.
				Log_AddEntry (TOPIC_Addon_Relicts,"Une tablette de pierre mauve"); 
			};	

		if ((Npc_HasItems (other,ItMi_Addon_Stone_03)) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_03,1);
				Saturas_SCFound_ItMi_Addon_Stone_03 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_13"); //J'ai trouv� ces tablettes dans un b�timent au sud-ouest d'ici.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_14"); //Selon l'apparence de la tablette, elle a � voir avec l'h�bergement des pr�tres de la ville.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_15"); //Le nom du grand pr�tre �tait KHARDIMON. Nous ne savons rien de lui.
				Log_AddEntry (TOPIC_Addon_Relicts,"Une tablette de pierre bleue"); 
			};		 
		if ((Npc_HasItems (other,ItMi_Addon_Stone_04)) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_04,1);
				Saturas_SCFound_ItMi_Addon_Stone_04 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output (other, self, "DIA_Addon_Saturas_Tokens_15_15"); //J'ai trouv� cet objet dans un b�timent poche du grand marais.
				AI_Output (self, other, "DIA_Addon_Saturas_Tokens_14_16"); //Ce devait �tre la demeure des soigneurs.
				AI_Output (self, other, "DIA_Addon_Saturas_Tokens_14_17"); //Nous ne savons pas grand-chose d'eux. Ils semblent avoir �t� les premiers � dispara�tre.
				Log_AddEntry (TOPIC_Addon_Relicts,"Une tablette de pierre verte"); 
			};		 
		if ((Npc_HasItems (other,ItMi_Addon_Stone_05)) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_05, 1);
				Saturas_SCFound_ItMi_Addon_Stone_05 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_18"); //Ce fragment gisait dans un grand b�timent, dans un profond ravin.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_19"); //C'�tait la biblioth�que des anciens.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_20"); //Apparemment, cette tablette est l'�uvre de leurs �rudits.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_80"); //Nombre des �crits dont nous avons retrouv� la trace sont l'�uvre du ma�tre de la caste des Erudits.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_81"); //Etrangement, nous n'avons retrouv� nulle trace de son nom...
				Log_AddEntry (TOPIC_Addon_Relicts,"Une tablette de pierre jaune"); 
		};		 
			
			if (SC_Knows_WeaponInAdanosTempel == TRUE)
			{
			};
	
			XP_BroughtTokens = (XP_Addon_ForOneToken * BroughtToken);
	
			B_GivePlayerXP (XP_BroughtTokens);
			Saturas_BroughtTokenAmount = (Saturas_BroughtTokenAmount + BroughtToken);

		if (Saturas_BroughtTokenAmount < 5)
		{
			if (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_21"); //Excellent. L'image de cette ville se fait plus claire, mais nous n'en savons pas encore assez.
			};
			
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_22"); //En tout, cinq tablettes de pierre de cette sorte doivent �tre dissimul�es ici.
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_23"); //Trouvez-les et ramenez-les moi.
		};
		
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_24"); //Voici de l'or en r�compense.

		var int Kohle;
		Kohle = (200 * BroughtToken);
			
		CreateInvItems (self, ItMi_Gold, Kohle);									
		B_GiveInvItems (self, other, ItMi_Gold, Kohle);		

		ScBroughtToken = TRUE; //mindestens einen gebracht
	};
	
	if (Saturas_BroughtTokenAmount == 5)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_25"); //Nous avons rassembl� toutes les reliques dont nous avions besoin.
	
		if (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_26"); //Vous nous avez rendu un immense service. Je vous en remercie.
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_27"); //Ceci nous sera d'une aide inestimable dans le cadre de nos recherches.
		};
		MIS_Saturas_LookingForHousesOfRulers = LOG_SUCCESS;
		Saturas_SCBroughtAllToken = TRUE;
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_28"); //Peut-�tre parviendrai-je � vous procurer d'autres objets.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_29"); //Bien. Mais h�tez-vous. Le temps n'est pas notre alli�.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info StonePlateHint
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_StonePlateHint		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_StonePlateHint_Condition;
	information	 = 	DIA_Addon_Saturas_StonePlateHint_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Saturas_StonePlateHint_Condition ()
{
	if ((Merdarion_GotFocusCount >= 2) || (RavenIsInTempel == TRUE))
	&& (Saturas_SCBroughtAllToken == FALSE)
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_StonePlateHint_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_00"); //Votre pr�sence ici est la bienvenue. Nous avons effectu� de nouvelles d�couvertes que nous souhaitons partager avec vous.
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_15_01"); //Je vous �coute, dans ce cas.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_02"); //La ville engloutie portait autrefois le nom de Jharkendar. Elle �tait gouvern�e par 5 dirigeants, qui se partageaient leur pouvoir sur le peuple.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_03"); //Chacun de ces chefs poss�dait une demeure, dans laquelle il vivait et conservait ses biens.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_04"); //Par cons�quent, lorsque vous rechercherez des reliques de cette culture ancienne, il est essentiel que vous fouilliez ces demeures.
	
	MIS_Saturas_LookingForHousesOfRulers = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Addon_Saturas_StonePlateHint);
	Info_AddChoice	(DIA_Addon_Saturas_StonePlateHint, "Et si ces demeures n'existent plus ?", DIA_Addon_Saturas_StonePlateHint_unter );
	Info_AddChoice	(DIA_Addon_Saturas_StonePlateHint, "O� puis-je trouver ces demeures ?", DIA_Addon_Saturas_StonePlateHint_wo );
};
func void DIA_Addon_Saturas_StonePlateHint_wo ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_wo_15_00"); //O� puis-je trouver ces demeures ?
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_01"); //Riordian a �tudi� la structure des b�timents de Jharkendar.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_02"); //Il vous indiquera les endroits o� se trouvent vraisemblablement ces demeures.

	Log_CreateTopic (TOPIC_Addon_HousesOfRulers, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_HousesOfRulers,"Saturas m'a demand� de fouiller les demeures des b�tisseurs � la recherche d'objets utiles. Riordian m'indiquera o� trouver ces b�timents."); 
};
func void DIA_Addon_Saturas_StonePlateHint_unter ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_unter_15_00"); //Et si ces demeures n'existent plus ?
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_01"); //Si vous ne parvenez pas � retrouver ces demeures, cela signifie qu'elles ont vraisemblablement �t� englouties avec la ville...
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_02"); //Toutefois, si elles existent encore, leur valeur aux fins de nos recherches sera r�ellement inestimable.
};

///////////////////////////////////////////////////////////////////////
//	Info SCBroughtAllToken
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_SCBroughtAllToken		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_SCBroughtAllToken_Condition;
	information	 = 	DIA_Addon_Saturas_SCBroughtAllToken_Info;

	description	 = 	"Pourquoi avez-vous besoin de ces cinq tablettes de pierre ?";
};

func int DIA_Addon_Saturas_SCBroughtAllToken_Condition ()
{
	if (ScBroughtToken == TRUE)
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_SCBroughtAllToken_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_SCBroughtAllToken_15_00"); //Pourquoi avez-vous besoin de ces cinq tablettes de pierre ?
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_01"); //Les �crits que nous sommes parvenus � retrouver dans ces ruines sont incomplets.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_02"); //Toutefois, les �crits des b�tisseurs parlent de cinq dirigeants qui r�gnaient autrefois sur cette ville.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_03"); //Chacun de ces chefs poss�dait l'une de ces tablettes de pierre, symbole de sa puissance.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_04"); //Je crois que ces tablettes sont la clef m�me de toutes nos interrogations.
};

///////////////////////////////////////////////////////////////////////
//	Info Flut
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Flut		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Flut_Condition;
	information	 = 	DIA_Addon_Saturas_Flut_Info;

	description	 = 	"Nefarius m'a parl� d'une inondation...";
};

func int DIA_Addon_Saturas_Flut_Condition ()
{
	if (NefariusADW_Talk2Saturas == TRUE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Flut_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Flut_15_00"); //Nefarius m'a parl� d'une crue...
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_02"); //Il est �crit qu'Adanos lui-m�me est descendu des cieux pour ch�tier les infid�les et les bannir dans les royaumes des morts.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_03"); //C�dant � sa furie divine, il a laiss� la mer s'abattre sur les b�tisseurs de cette ville et les a emport�s.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_04"); //Le marais dans l'est de ces terres t�moigne, aujourd'hui encore, des �v�nements pass�s.

	TOPIC_END_Flut = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info AdanosZorn
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_AdanosZorn		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_AdanosZorn_Condition;
	information	 = 	DIA_Addon_Saturas_AdanosZorn_Info;

	description	 = 	"Qu'est-ce qui a pu rendre Adanos aussi furieux ?";
};
func int DIA_Addon_Saturas_AdanosZorn_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_Flut))
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_AdanosZorn_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_AdanosZorn_15_00"); //Qu'est-ce qui a pu rendre Adanos aussi furieux ?
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_01"); //Le temple de cette ville �tait autrefois un �difice puissant et glorieux.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_02"); //Tous l'honoraient et priaient notre dieu Adanos.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_03"); //Mais Rhademes, fils du commandant Quarhodron, a profana ce temple.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_04"); //C'est pourquoi, les uns apr�s les autres, les habitants de la ville ont �t� envo�t�s par le mal.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_05"); //Je soup�onne Adanos de n'avoir pu pardonner cet acte, et d'avoir d�cha�n� sa vengeance sur ces terres.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_06"); //Cela ne rend que plus importante notre mission d'arr�ter Raven. Il est sur le point de faire exactement la m�me chose...
};

///////////////////////////////////////////////////////////////////////
//	Info RavenInfos
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_RavenInfos		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	9;
	condition	 = 	DIA_Addon_Saturas_RavenInfos_Condition;
	information	 = 	DIA_Addon_Saturas_RavenInfos_Info;
	permanent	 = 	TRUE;

	description	 = 	"A propos de Raven...";
};
var int DIA_Addon_Saturas_RavenInfos_OneTime1;
var int DIA_Addon_Saturas_RavenInfos_OneTime2;
var int DIA_Addon_Saturas_RavenInfos_OneTime3;
var int DIA_Addon_Saturas_RavenInfos_OneTime4;
var int DIA_Addon_Saturas_RavenInfos_OneTime5;

var int Addon_Saturas_Fortuno;

func int DIA_Addon_Saturas_RavenInfos_Condition ()
{
	if (MIS_ADDON_Saturas_GoToRaven == LOG_RUNNING)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_RavenInfos_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_00"); //A propos de Raven...
	
	var int RavenNeuigkeit;
	RavenNeuigkeit = 0;


	if (Thorus.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime1 == FALSE)
	&& (RavenIsInTempel == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_01"); //Je me suis rendu dans le camp des bandits, � l'est d'ici. Raven est leur chef.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_02"); //Mais pour retrouver Raven, je vais d'abord devoir �carter certains bandits de ma route.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_03"); //Parfait. Bonne chance, dans ce cas. Mais n'oubliez pas que le temps presse.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_04"); //Raven ne doit en aucun cas atteindre son objectif.
		DIA_Addon_Saturas_RavenInfos_OneTime1 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};

	if (SC_KnowsRavensGoldmine == TRUE) 
	&& (DIA_Addon_Saturas_RavenInfos_OneTime2 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_05"); //Il d�tient une mine d'or, dans laquelle il fait travailler les prisonniers.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_06"); //�a lui ressemble, sans aucun doute... Vous devez faire sortir les prisonniers de cette mine.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_07"); //(Soupire) Oui, bien s�r. J'y travaille...
		DIA_Addon_Saturas_RavenInfos_OneTime2 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};	

	if (SC_KnowsFortunoInfos == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime3 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_08"); //L'un des bandits pr�tend m�me conna�tre les plans de Raven.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_09"); //Son nom est Fortuno. Il pr�tend que Raven veut entrer dans le temple afin de se procurer un puissant artefact.
		AI_Output	(self, other, "DIA_Addon_Bodo_14_03"); //Et ? Que savait-il de l'artefact ?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_11"); //Il a seulement pu me dire que Raven avait ordonn� l'exhumation du tombeau d'un pr�tre d'Adanos.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_12"); //Ce tombeau contient peut-�tre la clef du temple. Vous devriez aller inspecter les lieux.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_13"); //Raven a contraint les prisonniers � exhumer le tombeau du pr�tre.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_14"); //Ce n'est pas bon du tout. Vous devez vous h�ter et arr�ter Raven � tout prix !
		Addon_Saturas_Fortuno = TRUE;
		
		DIA_Addon_Saturas_RavenInfos_OneTime3 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};
		
	if (RavenIsInTempel == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime4 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_15"); //Je me suis infiltr� dans les quartiers de Raven.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_16"); //Et ? Qu'en est-il de Raven ?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_17"); //Je suis arriv� trop tard. Il a disparu dans le temple d'Adanos, sous mes yeux.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_18"); //(inquiet) Quoi ?! Mais c'est une CATASTROPHE ! Pourquoi ne l'avez-vous pas arr�t� ?!

		DIA_Addon_Saturas_RavenInfos_OneTime4 = TRUE;
		MIS_ADDON_Saturas_GoToRaven = LOG_SUCCESS;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};

	if (RavenNeuigkeit != 0)
	{
		var int XP_RavenNeuigkeit;
		XP_RavenNeuigkeit = (RavenNeuigkeit * XP_Ambient);
		B_GivePlayerXP (XP_RavenNeuigkeit);
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_19"); //Avez-vous autre chose � signaler ?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_20"); //Rien pour l'instant.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_21"); //Je vous conseille de ne pas sous-estimer ce Raven... me comprenez-vous bien ?
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TuerZu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_TuerZu		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_TuerZu_Condition;
	information	 = 	DIA_Addon_Saturas_TuerZu_Info;

	description	 = 	"Je n'ai pas pu poursuivre Raven !";
};

func int DIA_Addon_Saturas_TuerZu_Condition ()
{
	if (MIS_ADDON_Saturas_GoToRaven == LOG_SUCCESS)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_TuerZu_Info ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_00"); //Je n'ai pas pu suivre Raven. Il a bloqu� l'entr�e de l'int�rieur.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_02"); //(h�tivement) Je dois r�fl�chir...
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_03"); //La question est de savoir comment Raven a pu acc�der au temple...
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_04"); //Qu'a-t-il fait avant de franchir le portail ?
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_05"); //Il a prononc� une invocation devant la porte.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_06"); //Et avant cela ?
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_07"); //Il a ouvert un tombeau.

	if (Addon_Saturas_Fortuno == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_09"); //Je vous en ai d�j� parl�...
		AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_10"); //Exact !
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_08"); //Je sais seulement qu'il a d� y accomplir un rituel quelconque...
	};

	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_11"); //(r�fl�chit) Un rituel...
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_12"); //(comprenant tout � coup) Oui ! Bien s�r !
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_13"); //Je crains que Raven ne se soit accapar� la puissance des veilleurs des morts.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_14"); //Sa connaissance du temple lui a �t� accord�e par un esprit !
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_15"); //Vous devez aller voir Myxir et lui parler de cela !
	
	Log_CreateTopic (TOPIC_Addon_Quarhodron, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Quarhodron,"Raven s'est accapar� la puissance des veilleurs des morts. Il tient son savoir d'un spectre qui erre dans le temple d'Adanos. Je dois aller voir Myxir et l'en informer.");  
	
	Saturas_RiesenPlan = TRUE;	
};

///////////////////////////////////////////////////////////////////////
//	Info GhostQuestions
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_GhostQuestions		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_GhostQuestions_Condition;
	information	 = 	DIA_Addon_Saturas_GhostQuestions_Info;

	description	 = 	"J'ai parl� � Quarhodron.";
};
func int DIA_Addon_Saturas_GhostQuestions_Condition ()
{
	if ((Npc_IsDead(Quarhodron)) == FALSE)
	&& (SC_TalkedToGhost == TRUE) 
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_GhostQuestions_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_00"); //J'ai parl� � Quarhodron.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_01"); //Et ?! Qu'a-t-il dit ?
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_02"); //Il n'acceptera de m'aider que si je r�ponds � certaines questions.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_03"); //Quel est le probl�me ?
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_04"); //Je ne suis pas s�r de mes r�ponses.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_05"); //Hmm... nous savons que les �rudits de cette ville ont �rig� une biblioth�que au nord de ces terres.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_06"); //Ils se sont astreints � consigner les �v�nements pass�s.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_07"); //Peut-�tre y trouverez-vous les r�ponses que Quarhodron exige de vous...

	B_LogEntry (TOPIC_Addon_Quarhodron,"Saturas pense que je trouverai les r�ponses aux questions de Quarhodron dans la biblioth�que des Erudits. La biblioth�que se trouve loin au nord d'ici."); 

};

///////////////////////////////////////////////////////////////////////
//	Info TalkedToGhost
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_TalkedToGhost		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_TalkedToGhost_Condition;
	information	 = 	DIA_Addon_Saturas_TalkedToGhost_Info;

	description	 = 	"Le probl�me de la porte du temple est r�solu.";
};

func int DIA_Addon_Saturas_TalkedToGhost_Condition ()
{
	if (Ghost_SCKnowsHow2GetInAdanosTempel == TRUE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_TalkedToGhost_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_00"); //Le probl�me de la porte du temple est r�solu.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_01"); //L'esprit a-t-il parl� ?
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_02"); //Oui.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_03"); //Alors, vous savez d�sormais comment vous rendre � l'int�rieur du temple.
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_04"); //Exact. Et il m'a �galement d�crit ce qui se trouve � l'int�rieur du temple.
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_05"); //Il a parl� d'une puissante �p�e et des salles d'Adanos.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_06"); //(d�sesp�r�) Par Adanos. Nous avons �t� aveugles... comment pouvions-nous �tre si ing�nus ?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_07"); //(abasourdi) Les indices dans les �crits...
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_08"); //(nerveux) Cette �p�e ne peut �tre que la Griffe de Beliar !
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_09"); //Nous devons franchir ces salles sans plus tarder et nous emparer de cette arme !
	
	Info_ClearChoices	(DIA_Addon_Saturas_TalkedToGhost);
	Info_AddChoice		(DIA_Addon_Saturas_TalkedToGhost, "Qu'est-ce que la Griffe de Beliar ?", DIA_Addon_Saturas_TalkedToGhost_wasistdas );
	Info_AddChoice		(DIA_Addon_Saturas_TalkedToGhost, "O� sont les salles d'Adanos ?", DIA_Addon_Saturas_TalkedToGhost_kammern );
};
func void DIA_Addon_Saturas_TalkedToGhost_wasistdas ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_15_00"); //Qu'est-ce que la Griffe de Beliar ?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_01"); //Elle est l'essence m�me du mal, forg�e par Beliar lui-m�me.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_02"); //Son porteur poss�de un formidable outil destructeur.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_03"); //Plus son porteur est puissant, plus la Griffe le devient �galement.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_04"); //Seule une personne dot�e d'un esprit fort et d'une foi in�branlable peut r�sister � son sort.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_05"); //D�sormais, je ne doute plus de la raison pour laquelle les b�tisseurs ont scell� cette vall�e.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_06"); //Ils ont apport� cette arme mal�fique dans leur ville, et sont tomb�s sous son joug.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_07"); //Ces cr�tins arrogants se sont ensuite an�antis par pure avidit�.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_08"); //Les massacres n'ont cess� que lorsque la furie d'Adanos a d�ferl� sur ces terres, laissant la mer recouvrir ces erreurs.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_09"); //En effet. Les cr�ateurs du portail ont �t� sages de dissimuler ces choses aux yeux du reste du monde.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_10"); //Quelle fin tragique pour une culture si merveilleuse...
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_11"); //Maintenant, comprenez-vous toute l'urgence de notre situation ?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_12"); //Raven est un guerrier puissant, aveugl� par sa soif de pouvoir.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_13"); //Dans sa main, la Griffe deviendra un instrument de destruction.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_14"); //Il ne doit pas s'emparer de l'arme - sinon, tout sera perdu !

	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Klaue,"Le temple d'Adanos rec�le une puissante arme, appel�e 'Griffe de Beliar'. Raven ne doit pas s'emparer de cette arme !"); 

};
func void DIA_Addon_Saturas_TalkedToGhost_kammern ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_kammern_15_00"); //Que sont les salles d'Adanos ?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_01"); //Nous savons maintenant que l'entr�e ne constitue pas l'unique obstacle nous emp�chant d'acc�der au temple.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_02"); //A l'int�rieur du temple ont �t� �rig�es trois salles, dont le but est d'arr�ter toute intrusion.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_03"); //Les reliques color�es des b�tisseurs en sont les clefs.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_04"); //Ce n'est qu'en rassemblant toutes les reliques et en r�solvant leurs �nigmes que nous pourrons p�n�trer au c�ur m�me du temple.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_05"); //Je ne sais pas si Raven a pu d�chiffrer les �nigmes du temple, mais si tel est le cas, nous avons un r�el probl�me.
	
	Log_CreateTopic (TOPIC_Addon_Kammern, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kammern, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Kammern,LogText_Addon_Relicts); 
	
	Log_CreateTopic (TOPIC_Addon_Relicts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Relicts,LogText_Addon_Relicts); 

	Saturas_KnowsHow2GetInTempel = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info RelictsBack
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_RelictsBack		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_RelictsBack_Condition;
	information	 = 	DIA_Addon_Saturas_RelictsBack_Info;

	description	 = 	"Que dois-je faire des reliques lorsque je serai dans le temple ?";
};

func int DIA_Addon_Saturas_RelictsBack_Condition ()
{
	if (Saturas_SCBroughtAllToken == TRUE)
	&& (Saturas_KnowsHow2GetInTempel == TRUE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_RelictsBack_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_RelictsBack_15_00"); //Que dois-je faire des reliques lorsque je serai dans le temple ?
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_03"); //Nous n'en savons pas assez. Toutefois, nous ne pouvons qu'esp�rer que leur signification deviendra apparente � vos yeux lorsque vous vous trouverez dans le temple.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_05"); //Je suis d�sol� de ne pouvoir vous en dire davantage. D�sormais, tout repose sur vos �paules.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_06"); //Prenez ces reliques et rendez-vous imm�diatement � l'int�rieur du temple.

	CreateInvItems (hero, ItMi_Addon_Stone_01, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_02, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_03, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_04, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_05, 1);
	AI_PrintScreen	(PRINT_ItemsErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);

	B_LogEntry (TOPIC_Addon_Kammern,"Saturas m'a ordonn� de me rendre dans le temple d'Adanos en me remettant les cinq reliques des b�tisseurs, qui me permettront de franchir les salles du temple et d'arr�ter Raven."); 

	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_07"); //Qu'Adanos ait piti� et nous prot�ge tous !
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_08"); //Peut-�tre n'est-il encore pas trop tard.
};

///////////////////////////////////////////////////////////////////////
//	Info RavensDead
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_RavensDead		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_RavensDead_Condition;
	information	 = 	DIA_Addon_Saturas_RavensDead_Info;

	important	 = 	TRUE;
};
func int DIA_Addon_Saturas_RavensDead_Condition ()
{
	if (RavenIsDead == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_RavensDead_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_00"); //Les s�ismes ont cess� et, si mes yeux ne me trompent pas, vous �tes toujours en vie.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_01"); //Cela signifie-t-il que votre mission a �t� un succ�s ?
	AI_Output	(other, self, "DIA_Addon_Saturas_RavensDead_15_02"); //Oui. Raven est mort.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_03"); //Alors, �'en est fini. Adanos soit lou� !
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_04"); //Vous avez bien agi, mon fils. Nous vous devons beaucoup.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_05"); //Vous avez arrach� une arme puissante des mains du mal, et r�tabli l'�quilibre dans cette r�gion du monde.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_06"); //Lorsque les s�ismes ont cess�, nous nous sommes r�unis afin de discuter de la marche � suivre, et sommes arriv�s � une seule et m�me conclusion.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_07"); //Allez prendre la Griffe de Beliar. Qu'elle soit v�tre, d�sormais.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_08"); //Dans votre main, elle deviendra une arme puissante au service de chacun de nous.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_09"); //Utilisez-la avec sagesse, mon fils. Qu'Adanos vous aide.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_11"); //Nous resterons ici et veillerons � ce que ce temple retrouve sa splendeur pass�e.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_12"); //Seul Myxir fait d�j� route vers Khorinis, afin de porter assistance � Vatras.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_13"); //Cela ne fait que trop longtemps que Vatras est seul dans cette ville.

	Log_CreateTopic (TOPIC_Addon_VatrasAbloesung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_VatrasAbloesung,"Myxir a �t� d�p�ch� � la ville portuaire, afin d'y aider Vatras."); 

	B_GivePlayerXP (XP_Addon_Saturas_RavensDead);
};

///////////////////////////////////////////////////////////////////////
//	Info FreedMissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_FreedMissingPeople		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_FreedMissingPeople_Condition;
	information	 = 	DIA_Addon_Saturas_FreedMissingPeople_Info;

	description	 = 	"J'ai lib�r� les prisonniers.";
};

func int DIA_Addon_Saturas_FreedMissingPeople_Condition ()
{
	if (MissingPeopleReturnedHome == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_FreedMissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_FreedMissingPeople_15_00"); //J'ai lib�r� les prisonniers.
	AI_Output	(self, other, "DIA_Addon_Saturas_FreedMissingPeople_14_01"); //Tr�s bien. Puissent-ils retrouvent leur patrie sains et saufs.
	B_GivePlayerXP (XP_Addon_Saturas_FreedMissingPeople);
};

///////////////////////////////////////////////////////////////////////
//	Info BeliarsWeapon
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_BeliarsWeapon		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_BeliarsWeapon_Condition;
	information	 = 	DIA_Addon_Saturas_BeliarsWeapon_Info;

	description	 = 	"J'ai pris la Griffe de Beliar.";
};

func int DIA_Addon_Saturas_BeliarsWeapon_Condition ()
{
	if (C_ScHasBeliarsWeapon ())
	&& (RavenIsDead == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_BeliarsWeapon_Info ()
{
	AI_UnequipWeapons (hero);
	AI_Output	(other, self, "DIA_Addon_Saturas_BeliarsWeapon_15_00"); //J'ai pris la Griffe de Beliar.
	
	if (Npc_HasItems (hero,ItMw_BeliarWeapon_Raven))
	&& (SC_FailedToEquipBeliarsWeapon == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_BeliarsWeapon_15_01"); //Toutefois, je ne peux la porter.
	};
	
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_02"); //La Griffe de Beliar est une arme tr�s sp�ciale.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_03"); //Elle poss�de une volont� et une conscience qui lui sont propres.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_04"); //Vous, qui poss�dez maintenant cette puissante arme, �tes son seigneur et son ma�tre.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_05"); //Elle forme partie de vous, et s'adaptera � vos capacit�s.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_06"); //Toutefois, elle ne le fera pas de sa propre volont�.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_07"); //Seul Beliar lui-m�me peut lui ordonner de vous ob�ir.
	
	Info_ClearChoices	(DIA_Addon_Saturas_BeliarsWeapon);
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "Et pourquoi Beliar m'aiderait-il ?", DIA_Addon_Saturas_BeliarsWeapon_besser );
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "Que puis-je faire de cette arme ?", DIA_Addon_Saturas_BeliarsWeapon_wastun );
};
func void DIA_Addon_Saturas_BeliarsWeapon_wastun ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_wastun_15_00"); //Que puis-je faire de cette arme ?
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_01"); //Cela ne tient qu'� vous. Vous avez conquis l'arme et en �tes d�sormais le ma�tre.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_02"); //Je ne peux que vous recommander d'utiliser au mieux sa puissance.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_03"); //Vous pouvez soit me la remettre, en quel cas je veillerai � ce qu'elle ne puisse plus jamais faire de mal...
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_04"); //...ou vous pouvez utiliser sa puissance et l'emporter au combat.
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "Ne pourriez-vous pas la garder en s�curit� ?", DIA_Addon_Saturas_BeliarsWeapon_geben );
};

func void DIA_Addon_Saturas_BeliarsWeapon_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_geben_15_00"); //Ne pourriez-vous pas la garder en s�curit� ?
	//AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_01"); //Du bist der Bezwinger des B�sen. Deine Entscheidungen bestimmen das Geschick dieser Welt.
	//AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_02"); //Wenn du dich dazu entschlie�t, die Klaue aus der Hand zu geben, ist dein Schicksal nicht mehr an sie gebunden.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_03"); //Si vous me la donnez, je la rendrai inoffensive afin que sa puissance ne soit plus jamais employ�e � mauvais escient.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_04"); //Alors, r�fl�chissez bien � votre d�cision.

	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Klaue,"Je pourrais remettre la Griffe de Beliar � Saturas, ou la garder pour moi-m�me."); 
};

func void DIA_Addon_Saturas_BeliarsWeapon_besser ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_besser_15_00"); //Et pourquoi Beliar m'aiderait-il ?
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_01"); //Seule une pri�re � Beliar peut vous obtenir cette faveur.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_02"); //Mais soyez vigilant... Beliar est aussi malveillant que rus�.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_03"); //Si vous provoquez son courroux, il vous le fera ressentir.
	
	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	Log_AddEntry  (TOPIC_Addon_Klaue,"Pour soumettre la Griffe � ma volont�, je dois prier Beliar.");

	B_Say 	  	(other,self,"$VERSTEHE");
};

///////////////////////////////////////////////////////////////////////
//	Info PermENDE_ADDON
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_PermENDE_ADDON		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_PermENDE_ADDON_Condition;
	information	 = 	DIA_Addon_Saturas_PermENDE_ADDON_Info;
	permanent	 = 	TRUE;

	description	 = 	"Qu'allez-vous faire � pr�sent ?";
};

func int DIA_Addon_Saturas_PermENDE_ADDON_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_RavensDead))
		{
			return TRUE;
		};
};
var int DIA_Addon_Saturas_PermENDE_ADDON_OneTime;
func void DIA_Addon_Saturas_PermENDE_ADDON_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_PermENDE_ADDON_15_00"); //Qu'allez-vous faire, maintenant ?
	AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_01"); //Nous allons rester ici et aider le temple � retrouver sa splendeur disparue.
	AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_02"); //Cela ne fait que trop longtemps que ses murs sont tomb�s en d�cr�pitude.
	if (DIA_Addon_Saturas_PermENDE_ADDON_OneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_03"); //En ce qui vous concerne, mon fils...
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_04"); //Je suis heureux de constater que je ne me suis pas tromp� sur vous. Vous �tes le Gardien de l'�quilibre. Il n'y a plus aucun doute � ce sujet.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_05"); //Sans votre courage et votre force, l'�le de Khorinis aurait �t� engloutie par les flots. Nous vous remercions humblement, nous nous souviendrons longtemps de votre h�ro�sme.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_06"); //Maintenant, consacrez-vous corps et �me aux autres t�ches qui vous attendent, et r�tablissez l'�quilibre et la paix dans ce monde.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_07"); //Maintenant, allez et accomplissez votre destin. Nos pri�res vous accompagneront.
		DIA_Addon_Saturas_PermENDE_ADDON_OneTime = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BeliarWeapGeben
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_BeliarWeapGeben		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_BeliarWeapGeben_Condition;
	information	 = 	DIA_Addon_Saturas_BeliarWeapGeben_Info;

	description	 = 	"Emportez la Griffe de Beliar et d�truisez-la.";
};

func int DIA_Addon_Saturas_BeliarWeapGeben_Condition ()
{
	if (C_ScHasBeliarsWeapon ())
	&& (RavenIsDead == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Saturas_BeliarsWeapon))
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_BeliarWeapGeben_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_BeliarWeapGeben_15_00"); //Prenez la Griffe de Beliar et d�truisez-la.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_01"); //A votre guise, mon fils. Donnez-la moi.
	B_ClearBeliarsWeapon ();
	AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_02"); //Afin qu'elle ne puisse plus jamais faire de mal � quiconque, je l'immergerai dans les profondeurs de l'oc�an.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_03"); //La sagesse d'Adanos veillera sur elle.
	TOPIC_END_Klaue = TRUE;
	B_GivePlayerXP (XP_Addon_BeliarsWeaponAbgegeben);
	Saturas_KlaueInsMeer = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info PreTeachCircle
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADW_PreTeachCircle		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Saturas_ADW_PreTeachCircle_Condition;
	information	 = 	DIA_Addon_Saturas_ADW_PreTeachCircle_Info;

	description	 = 	"Pouvez-vous m'enseigner les Cercles de la magie ?";
};

func int DIA_Addon_Saturas_ADW_PreTeachCircle_Condition ()
{
	if (hero.guild == GIL_KDF)
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 1)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_ADW_PreTeachCircle_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_00"); //Pouvez-vous m'enseigner les Cercles de la magie ?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_01"); //Vous �tes un Magicien du feu. Que penserait Pyrokar d'une telle pratique ?
	AI_Output	(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_02"); //Nul n'est tenu de le savoir.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_03"); //(soupire) Je vois que vous �tes s�rieux, aussi, j'acc�derai � votre demande.

	if ((RavenIsDead == FALSE))
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_04"); //Toutefois, si je devais avoir le sentiment de placer nos connaissances en des mains corrompues, vous ne pourriez plus compter sur mon aide.
		AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_05"); //Aussi, je vous recommande de ne pas me d�cevoir.
	};
	Saturas_Addon_TeachCircle = TRUE;

	Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
	B_LogEntry (TOPIC_Addon_KDWTeacher, LogText_Addon_SaturasTeach); 
};

///////////////////////////////////////////////////////////////////////
//	Info TEACHCIRCLE
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADW_CIRCLE		(C_INFO)
{
	npc			 = 	KDW_14000_Addon_Saturas_ADW;
	nr			 = 	99;
	condition	 = 	DIA_Addon_Saturas_ADW_CIRCLE_Condition;
	information	 = 	DIA_Addon_Saturas_ADW_CIRCLE_Info;
	permanent	 = 	TRUE;
	description	 = 	"Je veux acqu�rir une plus grande ma�trise de la magie.";
};
var int DIA_Addon_Saturas_ADW_CIRCLE_NoPerm;
func int DIA_Addon_Saturas_ADW_CIRCLE_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 1)
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) < 6)
	&& (Saturas_Addon_TeachCircle == TRUE)
	&& (DIA_Addon_Saturas_ADW_CIRCLE_NoPerm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Saturas_ADW_CIRCLE_Info ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_ADW_CIRCLE_15_00"); //Je veux acqu�rir une plus grande ma�trise de la magie.
	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 1)
	&& (Kapitel >= 2)
	{
		if B_TeachMagicCircle (self,other, 2)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_01"); //Oui, vous �tes pr�t � accro�tre vos connaissances.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_02"); //P�n�trez maintenant dans le deuxi�me Cercle de la magie. Qu'Adanos vous accorde la force d'utiliser avec sagesse la puissance qui vous est maintenant acquise.
		};                                                                                                                     
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 2)
	&& (Kapitel >= 3)
	{
		if B_TeachMagicCircle (self,other, 3)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_03"); //Oui, il est temps. P�n�trez maintenant dans le troisi�me Cercle de la magie.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_04"); //Vos connaissances vous permettront d�sormais d'utiliser des sorts nouveaux et plus puissants. Utilisez-les avec discernement.
		};                                                             
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 3)
	&& (MIS_ReadyforChapter4 == TRUE)
	{
		if B_TeachMagicCircle (self,other, 4)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_05"); //L'heure est venue. Vous �tes d�sormais pr�t � acc�der au quatri�me Cercle de la magie.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_06"); //D�sormais, vos mots et vos actes sont plus puissants que jamais. Choisissez toujours vos nouveaux sorts avec soin et raison.
		};
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 4)
	&& (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,other, 5)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_07"); //Vous aurez maintenant l'honneur de p�n�trer dans le cinqui�me Cercle de la magie.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_08"); //Les sorts que vous apprendrez � compter de maintenant peuvent �tre r�ellement d�vastateurs.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_09"); //Alors ayez conscience de votre puissance, et ne succombez pas � la soif de pouvoir.
		};
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	{
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_10"); //D�sormais, ce r�le n'est plus le mien.
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_11"); //Pour acc�der au sixi�me et dernier Cercle de la magie, vous devez vous rendre au monast�re des Mages du feu.
		DIA_Addon_Saturas_ADW_CIRCLE_NoPerm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_12"); //Il est encore trop t�t pour vous. Revenez me voir plus tard.
	};
};


















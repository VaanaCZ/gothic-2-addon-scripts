// *************************************************************************
// 									Drachenfrage 1
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_1(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_1_Condition;
	information	= DIA_DragonTalk_Main_1_Info;
	permanent	= FALSE;
	description = "Qu'est-ce qui vous a fait apparaître ici ?";
};                       

FUNC INT DIA_DragonTalk_Main_1_Condition()
{
	if (MIS_KilledDragons == 0)
	{
		return 1;
	};	
};

FUNC VOID DIA_DragonTalk_Main_1_Info()
{	

	AI_Output			(other, self, "DIA_DragonTalk_Main_1_15_00"); //Serviteur du mal. Comment se fait-il que vous soyez apparu ici ? N'êtes-vous venus que pour semer la terreur et la panique ?
	AI_Output			(self, other, "DIA_DragonTalk_Main_1_20_01"); //Les raisons de la présence de notre Concile en ce monde ne vous seront pas révélées, petit humain.

	Info_AddChoice	(DIA_DragonTalk_Main_1, "Comment puis-je faire parler les autres dragons ?", DIA_DragonTalk_Main_1_reden );
	Info_AddChoice	(DIA_DragonTalk_Main_1, "Que dois-je faire déjà pour vous bannir ?", DIA_DragonTalk_Main_1_verbannen );

	DragonTalk_Exit_Free = TRUE;
};
func void DIA_DragonTalk_Main_1_verbannen ()
{
	AI_Output			(other, self, "DIA_DragonTalk_MAIN_1_verbannen_15_00"); //Que dois-je faire, au nom d'Innos, pour vous bannir une bonne fois pour toutes des royaumes humains ?
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_01"); //(rires) Avant de pouvoir agir, il vous faut d'abord saisir l'objectif de notre Concile.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_02"); //Mais aucun de nous ne vous le révélera de sa propre volonté.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_03"); //Seul l'Œil pourrait délier nos langues et vous permettre de découvrir nos vrais objectifs.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_04"); //Quoi qu'il en soit, il ne vous sera d'aucune utilité une fois que vous serez mort.
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_05"); //On nous a déjà rapporté que vous aviez choisi la voie du chasseur de dragons.
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_06"); //Aussi, nous avons envoyé sur votre monde notre progéniture pour perpétuer notre lignée ancestrale.
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_07"); //Vous avez déjà perdu, petit humain.
		
		Log_CreateTopic (TOPIC_DRACHENEIER, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DRACHENEIER, LOG_RUNNING);
		B_LogEntry (TOPIC_DRACHENEIER,"Un des dragons a marmonné quelque chose à propos de 'progéniture' et de la préservation de sa lignée. Je crains qu'ils n'aient dispersé leurs couvées aux quatre coins du monde."); 
	}
	else
	{
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_08"); //L'Œil vous a permis d'entrer. Cependant ce n'est qu'un combat singulier qui décidera si vous êtes digne de moi.
	};
};

func void DIA_DragonTalk_Main_1_reden ()
{
	AI_Output			(other, self, "DIA_DragonTalk_MAIN_1_reden_15_00"); //Comment puis-je faire pour parler aux autres dragons ?
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_reden_20_01"); //Seul mon cœur peut vous permettre de renouveler le pouvoir de l'Œil.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_reden_20_02"); //Mais vous ne parviendrez pas à m'arracher le cœur.

};


// *************************************************************************
// 									Drachenfrage 2
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_2(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_2_Condition;
	information	= DIA_DragonTalk_Main_2_Info;
	permanent	= FALSE;
	description = "Qui vous envoie ici ?";
};                       

FUNC INT DIA_DragonTalk_Main_2_Condition()
{
	if (MIS_KilledDragons == 1)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_2_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_2_15_00"); //Aux ordres de qui obéissez-vous ? Qui vous a envoyé ici ?
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_01"); //Notre avenir et notre existence sont contrôlés par le Maître et son Mot de pouvoir. Bientôt, plus personne ne pourra lui résister.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_02"); //Sa main s'étend déjà hors du royaume des morts. Les esprits de la nuit se rassemblent pour célébrer son arrivée.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_03"); //Il balaiera les humains et régnera sur ce monde.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_04"); //Dans son ombre, nous ne sommes que les instruments de son pouvoir créatif.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_05"); //Le Maître viendra pour ranimer vos corps meurtris et il se servira de vous pour refaçonner le monde.

	B_LogEntry (TOPIC_DRACHENJAGD,"Les dragons ne sont pas libres. Ils servent un maître dont ils ne veulent rien révéler à part de vagues prophéties. Le maître va venir détruire le monde et ce genre de choses. La routine."); 
	
	DragonTalk_Exit_Free = TRUE;
};


// *************************************************************************
// 									Drachenfrage 3
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_3(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_3_Condition;
	information	= DIA_DragonTalk_Main_3_Info;
	permanent	= FALSE;
	description = "Comment puis-je vaincre votre maître ?";
};                       

FUNC INT DIA_DragonTalk_Main_3_Condition()
{
	if (MIS_KilledDragons == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_3_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_00"); //Comment puis-je vaincre votre maître ?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_01"); //Il est tout-puissant et presque invincible. Même si vous êtes assez fou pour l'affronter, vous mourrez d'une mort lente et douloureuse.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_02"); //Ce n'est pas la première fois que j'entends ça. Presque invincible ne signifie pas que je ne peux pas le tuer.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_03"); //Alors, crachez le morceau. Que dois-je faire ?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_04"); //Pour affronter le Maître, vous devez posséder des choses qu'il ne pourrait jamais obtenir.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_05"); //Et de quoi s'agit-il ?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_06"); //Vous devez posséder la plus belle armure connue de votre communauté et la porter à même votre peau.

	if (other.guild == GIL_PAL) || (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Dragons_Add_20_01"); //Il vous faut une épée bénie par votre dieu.
	}
	else if (other.guild == GIL_KDF) || (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Dragons_Add_20_02"); //Il vous faut une rune créée uniquement à votre intention.
	}
	else //Sld - Djg
	{	
		AI_Output (self, other, "DIA_Dragons_Add_20_00"); //Il vous faut une arme conçue pour vous.
	};
	
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_08"); //Mais la condition la plus difficile est que vous devez rassembler cinq compagnons prêts à vous suivre dans la mort.
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_09"); //Alors vous pourrez oser affronter le Maître.
	
	DragonTalk_Exit_Free = TRUE;
};


// *************************************************************************
// 									Drachenfrage 4
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_4(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_4_Condition;
	information	= DIA_DragonTalk_Main_4_Info;
	permanent	= FALSE;
	description 	= "Comment puis-je trouver votre maître ?";
};                       

FUNC INT DIA_DragonTalk_Main_4_Condition()
{
	if (MIS_KilledDragons == 3)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_4_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_4_15_00"); //Comment puis-je trouver votre maître ?
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_01"); //Il s'est établi dans les Halls d'Irdorath où il attend que s'accomplisse sa destinée.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_02"); //Il y attend, plongé dans la plus profonde méditation, jusqu'à ce qu'il puisse transformer ce monde...
	AI_Output			(other, self, "DIA_DragonTalk_Main_4_15_03"); //Epargnez-moi les détails. Dites-moi juste où je peux trouver ces Halls sacrés d'Irdorath.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_04"); //Ha ! Ha ! Ha ! Vous me décevez, petit homme. Vous avez surmonté tous les dangers et vous nous avez presque tous vaincus et pourtant il vous manque la connaissance.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_05"); //Si Irdorath ne signifie rien pour vous, vous feriez bien de retourner auprès de vos magiciens et de leur demander si vous pouvez vous occuper d'eux.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_06"); //Car il semble évident que vous n'êtes pas prêt pour accepter le fardeau de la connaissance suprême.
	 
	Log_CreateTopic (TOPIC_BuchHallenVonIrdorath, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BuchHallenVonIrdorath, LOG_RUNNING);
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"On raconte que le maître des dragons s'est réfugié sur le rocher des Halls sacrés d'Irdorath. Hum. Cela me semble familier. Où ai-je lu ça ?"); 

	B_NPC_IsAliveCheck (OLDWORLD_ZEN);  //Joly: bringt Angar und Gorn in die NW.
	DragonTalk_Exit_Free = TRUE;
};


//**********************************************************************************
//		B_AssignDragonTalk_Main
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Main (var c_NPC slf)
{
	DIA_DragonTalk_Main_1.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_2.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_3.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_4.npc				= Hlp_GetInstanceID(slf);	
};














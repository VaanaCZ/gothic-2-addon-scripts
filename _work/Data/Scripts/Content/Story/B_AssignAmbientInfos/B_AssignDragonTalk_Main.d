// *************************************************************************
// 									Drachenfrage 1
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_1(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_1_Condition;
	information	= DIA_DragonTalk_Main_1_Info;
	permanent	= FALSE;
	description = "Qu'est-ce qui vous a fait appara�tre ici ?";
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

	AI_Output			(other, self, "DIA_DragonTalk_Main_1_15_00"); //Serviteur du mal. Comment se fait-il que vous soyez apparu ici ? N'�tes-vous venus que pour semer la terreur et la panique ?
	AI_Output			(self, other, "DIA_DragonTalk_Main_1_20_01"); //Les raisons de la pr�sence de notre Concile en ce monde ne vous seront pas r�v�l�es, petit humain.

	Info_AddChoice	(DIA_DragonTalk_Main_1, "Comment puis-je faire parler les autres dragons ?", DIA_DragonTalk_Main_1_reden );
	Info_AddChoice	(DIA_DragonTalk_Main_1, "Que dois-je faire d�j� pour vous bannir ?", DIA_DragonTalk_Main_1_verbannen );

	DragonTalk_Exit_Free = TRUE;
};
func void DIA_DragonTalk_Main_1_verbannen ()
{
	AI_Output			(other, self, "DIA_DragonTalk_MAIN_1_verbannen_15_00"); //Que dois-je faire, au nom d'Innos, pour vous bannir une bonne fois pour toutes des royaumes humains ?
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_01"); //(rires) Avant de pouvoir agir, il vous faut d'abord saisir l'objectif de notre Concile.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_02"); //Mais aucun de nous ne vous le r�v�lera de sa propre volont�.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_03"); //Seul l'�il pourrait d�lier nos langues et vous permettre de d�couvrir nos vrais objectifs.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_04"); //Quoi qu'il en soit, il ne vous sera d'aucune utilit� une fois que vous serez mort.
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_05"); //On nous a d�j� rapport� que vous aviez choisi la voie du chasseur de dragons.
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_06"); //Aussi, nous avons envoy� sur votre monde notre prog�niture pour perp�tuer notre lign�e ancestrale.
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_07"); //Vous avez d�j� perdu, petit humain.
		
		Log_CreateTopic (TOPIC_DRACHENEIER, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DRACHENEIER, LOG_RUNNING);
		B_LogEntry (TOPIC_DRACHENEIER,"Un des dragons a marmonn� quelque chose � propos de 'prog�niture' et de la pr�servation de sa lign�e. Je crains qu'ils n'aient dispers� leurs couv�es aux quatre coins du monde."); 
	}
	else
	{
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_08"); //L'�il vous a permis d'entrer. Cependant ce n'est qu'un combat singulier qui d�cidera si vous �tes digne de moi.
	};
};

func void DIA_DragonTalk_Main_1_reden ()
{
	AI_Output			(other, self, "DIA_DragonTalk_MAIN_1_reden_15_00"); //Comment puis-je faire pour parler aux autres dragons ?
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_reden_20_01"); //Seul mon c�ur peut vous permettre de renouveler le pouvoir de l'�il.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_reden_20_02"); //Mais vous ne parviendrez pas � m'arracher le c�ur.

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
	AI_Output			(other, self, "DIA_DragonTalk_Main_2_15_00"); //Aux ordres de qui ob�issez-vous ? Qui vous a envoy� ici ?
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_01"); //Notre avenir et notre existence sont contr�l�s par le Ma�tre et son Mot de pouvoir. Bient�t, plus personne ne pourra lui r�sister.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_02"); //Sa main s'�tend d�j� hors du royaume des morts. Les esprits de la nuit se rassemblent pour c�l�brer son arriv�e.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_03"); //Il balaiera les humains et r�gnera sur ce monde.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_04"); //Dans son ombre, nous ne sommes que les instruments de son pouvoir cr�atif.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_05"); //Le Ma�tre viendra pour ranimer vos corps meurtris et il se servira de vous pour refa�onner le monde.

	B_LogEntry (TOPIC_DRACHENJAGD,"Les dragons ne sont pas libres. Ils servent un ma�tre dont ils ne veulent rien r�v�ler � part de vagues proph�ties. Le ma�tre va venir d�truire le monde et ce genre de choses. La routine."); 
	
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
	description = "Comment puis-je vaincre votre ma�tre ?";
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
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_00"); //Comment puis-je vaincre votre ma�tre ?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_01"); //Il est tout-puissant et presque invincible. M�me si vous �tes assez fou pour l'affronter, vous mourrez d'une mort lente et douloureuse.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_02"); //Ce n'est pas la premi�re fois que j'entends �a. Presque invincible ne signifie pas que je ne peux pas le tuer.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_03"); //Alors, crachez le morceau. Que dois-je faire ?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_04"); //Pour affronter le Ma�tre, vous devez poss�der des choses qu'il ne pourrait jamais obtenir.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_05"); //Et de quoi s'agit-il ?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_06"); //Vous devez poss�der la plus belle armure connue de votre communaut� et la porter � m�me votre peau.

	if (other.guild == GIL_PAL) || (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Dragons_Add_20_01"); //Il vous faut une �p�e b�nie par votre dieu.
	}
	else if (other.guild == GIL_KDF) || (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Dragons_Add_20_02"); //Il vous faut une rune cr��e uniquement � votre intention.
	}
	else //Sld - Djg
	{	
		AI_Output (self, other, "DIA_Dragons_Add_20_00"); //Il vous faut une arme con�ue pour vous.
	};
	
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_08"); //Mais la condition la plus difficile est que vous devez rassembler cinq compagnons pr�ts � vous suivre dans la mort.
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_09"); //Alors vous pourrez oser affronter le Ma�tre.
	
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
	description 	= "Comment puis-je trouver votre ma�tre ?";
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
	AI_Output			(other, self, "DIA_DragonTalk_Main_4_15_00"); //Comment puis-je trouver votre ma�tre ?
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_01"); //Il s'est �tabli dans les Halls d'Irdorath o� il attend que s'accomplisse sa destin�e.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_02"); //Il y attend, plong� dans la plus profonde m�ditation, jusqu'� ce qu'il puisse transformer ce monde...
	AI_Output			(other, self, "DIA_DragonTalk_Main_4_15_03"); //Epargnez-moi les d�tails. Dites-moi juste o� je peux trouver ces Halls sacr�s d'Irdorath.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_04"); //Ha ! Ha ! Ha ! Vous me d�cevez, petit homme. Vous avez surmont� tous les dangers et vous nous avez presque tous vaincus et pourtant il vous manque la connaissance.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_05"); //Si Irdorath ne signifie rien pour vous, vous feriez bien de retourner aupr�s de vos magiciens et de leur demander si vous pouvez vous occuper d'eux.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_06"); //Car il semble �vident que vous n'�tes pas pr�t pour accepter le fardeau de la connaissance supr�me.
	 
	Log_CreateTopic (TOPIC_BuchHallenVonIrdorath, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BuchHallenVonIrdorath, LOG_RUNNING);
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"On raconte que le ma�tre des dragons s'est r�fugi� sur le rocher des Halls sacr�s d'Irdorath. Hum. Cela me semble familier. O� ai-je lu �a ?"); 

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













